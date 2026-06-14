---
title: Plasticity
description: Synaptic plasticity rules — STDP, BCM theory, metaplasticity, rate-based and timing-based learning.
---

# Plasticity

## What is this domain?

Synaptic plasticity encompasses the mechanisms by which the strength of synaptic connections changes in response to neural activity. These changes can occur on timescales from milliseconds (short-term plasticity) to hours and days (long-term potentiation and depression), and they constitute the primary substrate for learning and memory in the brain. Plasticity rules specify the conditions under which a synapse is strengthened or weakened.

## Why it matters

Plasticity rules are the learning algorithms of the brain. They are the biological counterpart of gradient descent in deep learning, and understanding them is essential for designing hardware that can learn autonomously from data without relying on offline training. Implementing spike-timing-dependent plasticity (STDP) or related rules in memristive devices is one of the central challenges of neuromorphic engineering.

## Core concepts

- **Spike-timing-dependent plasticity (STDP)** — synaptic weight changes depend on the precise relative timing of pre- and postsynaptic spikes; causal (pre before post) firing potentiates, anticausal (post before pre) depresses
- **BCM theory** — the Bienenstock-Cooper-Munro rule introduces a sliding modification threshold, providing homeostatic stability and an explanation for the selectivity of visual cortical neurons
- **Metaplasticity** — plasticity of plasticity; the history of synaptic activity modulates the threshold and direction of subsequent changes, preventing runaway potentiation or silencing
- **Rate-based plasticity** — Hebbian and anti-Hebbian rules that depend on firing rate rather than precise spike timing; relevant to rate-coded neuromorphic systems
- **Short-term synaptic dynamics** — facilitation and depression on timescales of tens to hundreds of milliseconds, providing working memory and gain control without permanent weight changes
- **Homeostatic plasticity** — synaptic scaling and intrinsic excitability adjustments that maintain network stability over long timescales

## How it connects

Plasticity rules are derived from the biological mechanisms described in [Foundations](../foundations/index.md) and are validated against recordings in [Cultures & MEA](../cultures-mea/index.md). Their hardware implementation motivates much of the work on [Memristors](../memristors/index.md) and [RRAM Devices](../rram-devices/index.md).

## Papers

Papers will appear here as they are added.
