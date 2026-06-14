---
title: Connectomics
description: Connectome mapping, graph-theoretic analysis, C. elegans, Drosophila, and the human connectome project.
---

# Connectomics

## What is this domain?

Connectomics is the systematic reconstruction and analysis of neural wiring diagrams at cellular or subcellular resolution. Using serial electron microscopy, expansion microscopy, or light-sheet fluorescence imaging, researchers reconstruct the complete set of neurons and synapses in a tissue volume and represent this as a directed, weighted graph. The resulting connectome encodes the structural substrate within which all neural computations must occur.

## Why it matters

The connectivity matrix of a neural circuit constrains which computations it can perform and which dynamical states it can express. Connectomes provide ground-truth structural data against which models of network dynamics can be tested, and they reveal organisational principles — small-world topology, rich-club organisation, hub nodes — that may be design targets for neuromorphic architectures. The complete synaptic wiring of small organisms also enables whole-organism neural simulation.

## Core concepts

- **C. elegans connectome** — the 302-neuron hermaphrodite connectome, fully mapped since 1986, remains the only complete connectome of an adult nervous system and a benchmark for circuit models
- **Drosophila connectomics** — the FAFB (full adult fly brain) and hemibrain datasets contain tens of thousands of neurons and millions of synapses, enabling analysis of specific circuits including the mushroom body and central complex
- **Volume electron microscopy** — serial section TEM, FIB-SEM, and SBEM techniques for imaging neural tissue at nanometre resolution; dense reconstruction requires automated segmentation
- **Graph-theoretic analysis** — measures including degree distribution, clustering coefficient, path length, modularity, and rich-club coefficient characterise network topology and predict functional properties
- **Human Connectome Project** — diffusion MRI tractography at macro-scale, identifying white matter tracts and regional connectivity; complementary to micro-scale EM approaches
- **Automated segmentation and proofreading** — deep learning methods (flood-filling networks, 3D U-Nets) for automated neuron segmentation from EM stacks, with human proofreading for quality control

## How it connects

Connectomes provide structural constraints for the network models in [Network Dynamics](../network-dynamics/index.md) and inform our understanding of the cortical circuits detailed in [Cortex Physiology](../cortex-physiology/index.md). The organisational principles revealed by connectomics — modularity, sparse connectivity, hub structure — are increasingly referenced in the architectural design of [Neuromorphic Hardware](../neuromorphic-hw/index.md).

## Papers

Papers will appear here as they are added.
