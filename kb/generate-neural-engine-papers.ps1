<#
.SYNOPSIS
  Build paper markdown pages from a plain-text manifest and wire them into the MyST book.

.DESCRIPTION
  This script is designed for the Neural Engine knowledge base structure:
    kb/
      index.md
      _toc.yml
      papers/<section>/index.md
      papers/<section>/papers/

  It parses a manifest that looks like the list you pasted in chat:
    ## 2) Brain biology and synaptic fundamentals
    - **2010** — Caporale N, Dan Y. *Spike-timing-dependent plasticity: a Hebbian learning rule*. Annual Review of Neuroscience. `copyref`

  For each parsed paper, it:
    1. Creates a markdown page under papers/<section>/papers/
    2. Rewrites the section index.md with a generated paper list
    3. Rebuilds _toc.yml so the papers show up in the sidebar

  Non-paper bullets in the "resources" section are collected separately and can be written to papers/extra/resources.md.

.NOTES
  PowerShell 7+ recommended. Uses parallel file generation for speed.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ManifestPath,

    [Parameter()]
    [string]$RootPath = (Get-Location).Path,

    [switch]$UpdateToc = $true,

    [switch]$UpdateSectionIndexes = $true,

    [switch]$WriteResourcePage = $true,

    [switch]$Overwrite = $true,

    [int]$ThrottleLimit = 12
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Write-Info {
    param([string]$Message)
    Write-Host "[paper-builder] $Message"
}

function Ensure-Dir {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

function Backup-File {
    param([string]$Path)
    if (Test-Path -LiteralPath $Path) {
        $stamp = Get-Date -Format "yyyyMMdd-HHmmss"
        $backup = "$Path.bak-$stamp"
        Copy-Item -LiteralPath $Path -Destination $backup -Force
        return $backup
    }
    return $null
}

function Normalize-Text {
    param([string]$Text)
    if ($null -eq $Text) { return "" }
    # Convert curly dashes/quotes to normal ASCII where useful for filenames.
    $Text = $Text -replace "[—–]", "-"
    $Text = $Text -replace "[“”]", '"'
    $Text = $Text -replace "[‘’]", "'"
    return $Text.Trim()
}

function To-Slug {
    param([string]$Text)
    $Text = Normalize-Text $Text
    $slug = $Text.ToLowerInvariant()

    # Remove accents/diacritics
    $normalized = $slug.Normalize([Text.NormalizationForm]::FormD)
    $sb = New-Object System.Text.StringBuilder
    foreach ($ch in $normalized.ToCharArray()) {
        $uc = [Globalization.CharUnicodeInfo]::GetUnicodeCategory($ch)
        if ($uc -ne [Globalization.UnicodeCategory]::NonSpacingMark) {
            [void]$sb.Append($ch)
        }
    }
    $slug = $sb.ToString().Normalize([Text.NormalizationForm]::FormC)

    $slug = $slug -replace "[^a-z0-9]+", "-"
    $slug = $slug.Trim("-")
    if ([string]::IsNullOrWhiteSpace($slug)) { $slug = "paper" }
    return $slug
}

function Escape-YamlValue {
    param([string]$Text)
    if ($null -eq $Text) { return '""' }
    $escaped = $Text -replace '\\', '\\\\'
    $escaped = $escaped -replace '"', '\"'
    return '"' + $escaped + '"'
}

function Get-SectionSlug {
    param([string]$Heading)
    $norm = (Normalize-Text $Heading).ToLowerInvariant()

    $map = [ordered]@{
        'brain biology and synaptic fundamentals'        = 'foundations'
        'neuron models and computational neuroscience'   = 'neuron-models'
        'synapses, plasticity, and learning rules'       = 'plasticity'
        'neuronal cultures, mea, and closed-loop experiments' = 'cultures-mea'
        'memristors, foundational theory, and circuit models' = 'memristors'
        'rram, resistive switching, pcm, and related devices' = 'rram-devices'
        'neuromorphic hardware and circuit systems'      = 'neuromorphic-hw'
        'network dynamics, oscillations, and collective behavior' = 'network-dynamics'
        'connectomics and structural brain organization' = 'connectomics'
        'biological neuron and cortex physiology'        = 'cortex-physiology'
        'other paper-like resources explicitly named in the dump' = 'extra'
        'non-paper resources mentioned in the dump'      = 'extra'
    }

    foreach ($k in $map.Keys) {
        if ($norm -eq $k) { return $map[$k] }
    }

    # Fallback: derive from the heading text itself.
    return To-Slug $Heading
}

function Get-SectionDisplayName {
    param([string]$SectionSlug)
    switch ($SectionSlug) {
        'foundations'       { 'Foundations' }
        'neuron-models'     { 'Neuron Models' }
        'plasticity'        { 'Plasticity' }
        'cultures-mea'      { 'Cultures & MEA' }
        'memristors'        { 'Memristors' }
        'rram-devices'     { 'RRAM Devices' }
        'neuromorphic-hw'   { 'Neuromorphic Hardware' }
        'network-dynamics'  { 'Network Dynamics' }
        'connectomics'      { 'Connectomics' }
        'cortex-physiology' { 'Cortex Physiology' }
        'extra'             { 'Extra & Emerging' }
        default             { $SectionSlug }
    }
}

function Parse-PaperLine {
    param(
        [string]$Line,
        [string]$SectionSlug,
        [string]$SectionHeading
    )

    $line = (Normalize-Text $Line)

    # Standard paper line:
    # - **2010** — Caporale N, Dan Y. *Spike-timing-dependent plasticity: a Hebbian learning rule*. Annual Review of Neuroscience. `copyref`
    $paperPattern = '^\-\s+\*\*(?<year>\d{4})\*\*\s+[—-]\s+(?<authors>.+?)\.\s+\*(?<title>.+?)\*\.\s*(?<venue>.*?)(?:\s*`copyref`)?\s*$'
    $m = [regex]::Match($line, $paperPattern)
    if ($m.Success) {
        $year = [int]$m.Groups['year'].Value
        $authors = $m.Groups['authors'].Value.Trim()
        $title = $m.Groups['title'].Value.Trim()
        $venue = $m.Groups['venue'].Value.Trim()

        # Clean venue text.
        $venue = $venue.Trim().TrimEnd('.')
        $venue = $venue -replace '\s+`copyref`$', ''
        $venue = $venue.Trim()

        $slugBase = "{0}-{1}" -f $year, (To-Slug $title)
        return [pscustomobject]@{
            Kind          = 'Paper'
            Year          = $year
            Authors       = $authors
            Title         = $title
            Venue         = $venue
            SectionSlug   = $SectionSlug
            SectionHeading= $SectionHeading
            Slug          = $slugBase
            RawLine       = $Line
        }
    }

    # If it is a bullet line in the "resources" / non-paper section, keep it as a resource.
    if ($line -match '^\-\s*(?<text>.+)$') {
        $text = $Matches['text'].Trim()
        if (-not [string]::IsNullOrWhiteSpace($text)) {
            return [pscustomobject]@{
                Kind           = 'Resource'
                Text           = $text
                SectionSlug    = $SectionSlug
                SectionHeading = $SectionHeading
                Slug           = (To-Slug $text)
                RawLine        = $Line
            }
        }
    }

    return $null
}

function Parse-Manifest {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        throw "Manifest not found: $Path"
    }

    $lines = Get-Content -LiteralPath $Path
    $sections = New-Object System.Collections.Generic.List[object]

    $currentSection = $null
    $currentItems = New-Object System.Collections.Generic.List[object]

    foreach ($raw in $lines) {
        $line = $raw.TrimEnd()

        if ($line -match '^\#\#\s+(?<num>\d+)\)\s+(?<heading>.+)$') {
            if ($null -ne $currentSection) {
                $sections.Add([pscustomobject]@{
                    Heading = $currentSection.Heading
                    Slug    = $currentSection.Slug
                    Items   = @($currentItems)
                })
            }

            $heading = Normalize-Text $Matches['heading']
            $slug = Get-SectionSlug $heading
            $currentSection = [pscustomobject]@{
                Heading = $heading
                Slug    = $slug
            }
            $currentItems = New-Object System.Collections.Generic.List[object]
            continue
        }

        if ($null -ne $currentSection) {
            $item = Parse-PaperLine -Line $line -SectionSlug $currentSection.Slug -SectionHeading $currentSection.Heading
            if ($null -ne $item) {
                $currentItems.Add($item)
            }
        }
    }

    if ($null -ne $currentSection) {
        $sections.Add([pscustomobject]@{
            Heading = $currentSection.Heading
            Slug    = $currentSection.Slug
            Items   = @($currentItems)
        })
    }

    return @($sections)
}

function New-PaperMarkdown {
    param(
        [Parameter(Mandatory = $true)]$Paper
    )

    $displaySection = Get-SectionDisplayName $Paper.SectionSlug
    $title = $Paper.Title
    $desc = if ($Paper.Venue) {
        "$($Paper.Year) — $($Paper.Authors) — $($Paper.Venue)"
    } else {
        "$($Paper.Year) — $($Paper.Authors)"
    }

@"
---
title: "$(Normalize-Text $title)"
description: "$(Normalize-Text $desc)"
year: $($Paper.Year)
authors: $(Escape-YamlValue (Normalize-Text $Paper.Authors))
venue: $(Escape-YamlValue (Normalize-Text $Paper.Venue))
section: $(Escape-YamlValue $displaySection)
tags:
  - neuroscience
  - paper
  - $($Paper.SectionSlug)
---

# $(Normalize-Text $title)

**Authors:** $(Normalize-Text $Paper.Authors)  
**Year:** $($Paper.Year)  
**Venue:** $(Normalize-Text $Paper.Venue)  
**Section:** $displaySection

## Reference

`copyref`

## Notes

This page was generated automatically from your paper manifest.
Add abstract, key findings, links, and annotations here.

## Why it belongs here

Write the short reason this paper matters for the section.

## Related

- Back to [$(Get-SectionDisplayName $Paper.SectionSlug)](../index.md)
"@
}

function New-ResourceMarkdown {
    param(
        [Parameter(Mandatory = $true)]$Resource,
        [Parameter(Mandatory = $true)][string]$SectionDisplayName
    )

@"
---
title: "$(Normalize-Text $Resource.Text)"
description: "Resource listed under $SectionDisplayName"
section: $(Escape-YamlValue $SectionDisplayName)
tags:
  - resource
  - $($Resource.SectionSlug)
---

# $(Normalize-Text $Resource.Text)

This is a non-paper resource listed in your manifest.

## Notes

Add a description, link, or context here.

## Related

- Back to [$(Get-SectionDisplayName $Resource.SectionSlug)](../index.md)
"@
}

function Build-SectionIndexBody {
    param(
        [Parameter(Mandatory = $true)]$Section,
        [Parameter(Mandatory = $true)]$Papers,
        [Parameter()]$Resources
    )

    $display = Get-SectionDisplayName $Section.Slug
    $sortedPapers = $Papers | Sort-Object Year -Descending, Title

    $paperLines = New-Object System.Collections.Generic.List[string]
    foreach ($p in $sortedPapers) {
        $rel = "./papers/$($p.Slug).md"
        $line = "- [$($p.Year) — $($p.Title)]($rel) — $($p.Venue)"
        $paperLines.Add($line)
    }

    $resourceLines = New-Object System.Collections.Generic.List[string]
    foreach ($r in @($Resources)) {
        $rel = "./resources/$($r.Slug).md"
        $resourceLines.Add("- [$($r.Text)]($rel)")
    }

    $core = @()
    $core += "<!-- GENERATED PAPERS START -->"
    $core += "## Papers"
    if ($paperLines.Count -gt 0) {
        $core += ""
        $core += $paperLines
    } else {
        $core += ""
        $core += "_No papers have been generated for this section yet._"
    }

    if ($resourceLines.Count -gt 0) {
        $core += ""
        $core += "## Related resources"
        $core += ""
        $core += $resourceLines
    }
    $core += "<!-- GENERATED PAPERS END -->"

    return ($core -join "`n")
}

function Replace-GeneratedBlock {
    param(
        [string]$Content,
        [string]$GeneratedBlock
    )

    $startMarker = '<!-- GENERATED PAPERS START -->'
    $endMarker = '<!-- GENERATED PAPERS END -->'

    if ($Content -match [regex]::Escape($startMarker) -and $Content -match [regex]::Escape($endMarker)) {
        $pattern = [regex]::Escape($startMarker) + '.*?' + [regex]::Escape($endMarker)
        return [regex]::Replace($Content, $pattern, [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $GeneratedBlock }, 'Singleline')
    }

    if ($Content -match '(?ms)^\s*##\s+Papers\b.*$') {
        # Replace from the Papers heading to EOF.
        $prefix = [regex]::Replace($Content, '(?ms)^\s*##\s+Papers\b.*$', '').TrimEnd()
        if ([string]::IsNullOrWhiteSpace($prefix)) {
            return $GeneratedBlock
        }
        return ($prefix + "`n`n" + $GeneratedBlock).TrimEnd() + "`n"
    }

    # Append if no marker/heading exists.
    return ($Content.TrimEnd() + "`n`n" + $GeneratedBlock + "`n")
}

function Build-Toc {
    param(
        [Parameter(Mandatory = $true)]$Sections
    )

    $lines = New-Object System.Collections.Generic.List[string]
    $lines.Add('format: jb-book')
    $lines.Add('root: index.md')
    $lines.Add('')
    $lines.Add('chapters:')

    $sectionOrder = @(
        'foundations',
        'neuron-models',
        'plasticity',
        'cultures-mea',
        'memristors',
        'rram-devices',
        'neuromorphic-hw',
        'network-dynamics',
        'connectomics',
        'cortex-physiology',
        'extra'
    )

    foreach ($slug in $sectionOrder) {
        $sec = $Sections | Where-Object { $_.Slug -eq $slug } | Select-Object -First 1
        if ($null -eq $sec) { continue }

        $lines.Add("  - file: papers/$slug/index.md")

        $children = New-Object System.Collections.Generic.List[string]
        $papers = @($sec.Items | Where-Object { $_.Kind -eq 'Paper' } | Sort-Object Year -Descending, Title)
        foreach ($p in $papers) {
            $children.Add("      - file: papers/$slug/papers/$($p.Slug).md")
        }

        $resources = @($sec.Items | Where-Object { $_.Kind -eq 'Resource' })
        if ($resources.Count -gt 0) {
            $children.Add("      - file: papers/$slug/resources/index.md")
        }

        if ($children.Count -gt 0) {
            $lines.Add('    sections:')
            foreach ($child in $children) {
                $lines.Add($child)
            }
        }
    }

    return ($lines -join "`n") + "`n"
}

# ---------- main ----------
$root = (Resolve-Path -LiteralPath $RootPath).Path
$manifest = (Resolve-Path -LiteralPath $ManifestPath).Path

Write-Info "Root: $root"
Write-Info "Manifest: $manifest"

$sections = Parse-Manifest -Path $manifest

if ($sections.Count -eq 0) {
    throw "No sections were parsed from the manifest."
}

# Report parsed counts
foreach ($sec in $sections) {
    $paperCount = @($sec.Items | Where-Object { $_.Kind -eq 'Paper' }).Count
    $resourceCount = @($sec.Items | Where-Object { $_.Kind -eq 'Resource' }).Count
    Write-Info ("Parsed {0} papers and {1} resources for {2}" -f $paperCount, $resourceCount, $sec.Slug)
}

# Create paper pages and resource pages in parallel.
$tasks = foreach ($sec in $sections) {
    foreach ($item in $sec.Items) {
        [pscustomobject]@{
            SectionSlug   = $sec.Slug
            SectionHeading= $sec.Heading
            Item          = $item
        }
    }
}

$tasks | ForEach-Object -Parallel {
    param($Overwrite, $RootPath, $WriteResourcePage)

    function Normalize-Text {
        param([string]$Text)
        if ($null -eq $Text) { return "" }
        $Text = $Text -replace "[—–]", "-"
        $Text = $Text -replace "[“”]", '"'
        $Text = $Text -replace "[‘’]", "'"
        return $Text.Trim()
    }

    function Escape-YamlValue {
        param([string]$Text)
        if ($null -eq $Text) { return '""' }
        $escaped = $Text -replace '\\', '\\\\'
        $escaped = $escaped -replace '"', '\"'
        return '"' + $escaped + '"'
    }

    function Get-DisplayName {
        param([string]$Slug)
        switch ($Slug) {
            'foundations'       { 'Foundations' }
            'neuron-models'     { 'Neuron Models' }
            'plasticity'        { 'Plasticity' }
            'cultures-mea'      { 'Cultures & MEA' }
            'memristors'        { 'Memristors' }
            'rram-devices'      { 'RRAM Devices' }
            'neuromorphic-hw'   { 'Neuromorphic Hardware' }
            'network-dynamics'  { 'Network Dynamics' }
            'connectomics'      { 'Connectomics' }
            'cortex-physiology' { 'Cortex Physiology' }
            'extra'             { 'Extra & Emerging' }
            default             { $Slug }
        }
    }

    $item = $_.Item
    $sectionSlug = $_.SectionSlug
    $sectionDir = Join-Path $RootPath "papers/$sectionSlug"
    $paperDir = Join-Path $sectionDir 'papers'
    $resourceDir = Join-Path $sectionDir 'resources'
    $display = Get-DisplayName $sectionSlug

    if ($item.Kind -eq 'Paper') {
        if (-not (Test-Path -LiteralPath $paperDir)) {
            New-Item -ItemType Directory -Path $paperDir -Force | Out-Null
        }

        $path = Join-Path $paperDir ($item.Slug + '.md')
        if ($Overwrite -or -not (Test-Path -LiteralPath $path)) {
            $content = @"
---
title: "$(Normalize-Text $item.Title)"
description: "$(Normalize-Text "$($item.Year) — $($item.Authors) — $($item.Venue)")"
year: $($item.Year)
authors: $(Escape-YamlValue (Normalize-Text $item.Authors))
venue: $(Escape-YamlValue (Normalize-Text $item.Venue))
section: $(Escape-YamlValue $display)
tags:
  - neuroscience
  - paper
  - $sectionSlug
---

# $(Normalize-Text $item.Title)

**Authors:** $(Normalize-Text $item.Authors)  
**Year:** $($item.Year)  
**Venue:** $(Normalize-Text $item.Venue)  
**Section:** $display

## Reference

`copyref`

## Notes

This page was generated automatically from your paper manifest.
Add abstract, key findings, links, and annotations here.

## Why it belongs here

Write the short reason this paper matters for the section.

## Related

- Back to [$(Get-DisplayName $sectionSlug)](../index.md)
"@
            Set-Content -LiteralPath $path -Value $content -Encoding UTF8
        }
        return
    }

    if ($item.Kind -eq 'Resource' -and $WriteResourcePage) {
        if (-not (Test-Path -LiteralPath $resourceDir)) {
            New-Item -ItemType Directory -Path $resourceDir -Force | Out-Null
        }
        $path = Join-Path $resourceDir ($item.Slug + '.md')
        if ($Overwrite -or -not (Test-Path -LiteralPath $path)) {
            $content = @"
---
title: "$(Normalize-Text $item.Text)"
description: "Resource listed under $display"
section: $(Escape-YamlValue $display)
tags:
  - resource
  - $sectionSlug
---

# $(Normalize-Text $item.Text)

This is a non-paper resource listed in your manifest.

## Notes

Add a description, link, or context here.

## Related

- Back to [$(Get-DisplayName $sectionSlug)](../index.md)
"@
            Set-Content -LiteralPath $path -Value $content -Encoding UTF8
        }
    }
}} -ThrottleLimit $ThrottleLimit -ArgumentList $Overwrite, $root, $WriteResourcePage

# Update each section index.md
if ($UpdateSectionIndexes) {
    foreach ($sec in $sections) {
        $sectionDir = Join-Path $root "papers/$($sec.Slug)"
        Ensure-Dir $sectionDir

        $indexPath = Join-Path $sectionDir 'index.md'
        if (-not (Test-Path -LiteralPath $indexPath)) {
            throw "Missing section index: $indexPath"
        }

        Backup-File -Path $indexPath | Out-Null

        $content = Get-Content -LiteralPath $indexPath -Raw
        $papers = @($sec.Items | Where-Object { $_.Kind -eq 'Paper' })
        $resources = @($sec.Items | Where-Object { $_.Kind -eq 'Resource' })

        $generated = Build-SectionIndexBody -Section $sec -Papers $papers -Resources $resources
        $newContent = Replace-GeneratedBlock -Content $content -GeneratedBlock $generated

        Set-Content -LiteralPath $indexPath -Value $newContent -Encoding UTF8
        Write-Info "Updated index: papers/$($sec.Slug)/index.md"

        if ($WriteResourcePage) {
            $resources = @($sec.Items | Where-Object { $_.Kind -eq 'Resource' })
            if ($resources.Count -gt 0) {
                $resourceDir = Join-Path $sectionDir 'resources'
                Ensure-Dir $resourceDir
                $resourceIndex = Join-Path $resourceDir 'index.md'
                Backup-File -Path $resourceIndex | Out-Null

                $resourceLines = New-Object System.Collections.Generic.List[string]
                foreach ($r in ($resources | Sort-Object Text)) {
                    $resourceLines.Add("- [$($r.Text)](./$($r.Slug).md)")
                }

                $resourceIndexContent = @"
---
title: Resources
description: Supporting resources for $($sec.Heading)
---

# Resources

These items were listed in the manifest as non-paper resources.

## List

$($resourceLines -join "`n")

## Back to section

- [$(Get-SectionDisplayName $sec.Slug)](../index.md)
"@
                Set-Content -LiteralPath $resourceIndex -Value $resourceIndexContent -Encoding UTF8
                Write-Info "Updated resource index: papers/$($sec.Slug)/resources/index.md"
            }
        }
    }
}

# Update TOC
if ($UpdateToc) {
    $tocPath = Join-Path $root '_toc.yml'
    if (Test-Path -LiteralPath $tocPath) {
        Backup-File -Path $tocPath | Out-Null
        $tocContent = Build-Toc -Sections $sections
        Set-Content -LiteralPath $tocPath -Value $tocContent -Encoding UTF8
        Write-Info "Updated _toc.yml"
    }
}

Write-Info "Done."
