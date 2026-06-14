---
title: Extra & Emerging
description: Ferroelectric synapses, organic neuromorphic devices, hybrid SNN architectures, AER systems, and frontier topics.
---

# Extra & Emerging

## What is this domain?

This section collects recent and edge papers that do not fit cleanly within any single thematic section, or that span multiple sections in novel ways. Topics include emerging device technologies such as ferroelectric tunnel junctions and organic electrochemical transistors, hybrid architectures that combine spiking neural networks with conventional deep learning pipelines, advanced AER communication systems, and speculative but scientifically grounded proposals for the next generation of neuromorphic computing.

## Why it matters

The frontier of neuromorphic research often appears here first, before it consolidates into a distinct subfield. Ferroelectric synapses and organic devices may offer advantages in scalability, flexibility, or biocompatibility that oxide-based RRAM cannot match. Hybrid SNN-ANN architectures acknowledge that spiking and rate-coded computation may each be optimal for different tasks, and that real systems will blend both. Tracking these developments prevents the knowledge base from calcifying around established paradigms.

## Core concepts

- **Ferroelectric synaptic devices** — ferroelectric tunnel junctions (FTJs) and ferroelectric field-effect transistors (FeFETs) use polarisation switching in perovskite films (e.g. HfO₂:Si, BaTiO₃) to implement analogue synaptic weights with nanosecond switching and CMOS compatibility
- **Organic neuromorphic devices** — electrochemical transistors based on conducting polymers (e.g. PEDOT:PSS) exhibit ion-mediated conductance modulation that closely mimics short- and long-term synaptic plasticity; inherently soft and biocompatible
- **Hybrid SNN-ANN architectures** — systems that use spiking layers for event-driven preprocessing or temporal processing and rate-coded layers for classification or regression, combining the energy efficiency of SNNs with the training maturity of ANNs
- **AER communication systems** — Address Event Representation systems encode spike events as asynchronous digital packets and route them between neuron arrays; high-bandwidth, low-latency AER buses and routers are a hardware bottleneck in large-scale systems
- **Stochastic and probabilistic neuromorphic computing** — exploiting device stochasticity (thermal noise in phase-change memory, quantum tunnelling in FTJs) as a computational resource rather than a nuisance, enabling Bayesian inference and sampling in hardware
- **In-sensor computing and neuromorphic vision** — dynamic vision sensors (DVS cameras) paired with on-sensor spike processing eliminate the need for frame-based readout, reducing bandwidth and latency by orders of magnitude

## How it connects

This section extends in all directions: it draws on the device physics of [RRAM Devices](../rram-devices/index.md) and [Memristors](../memristors/index.md), the architecture of [Neuromorphic Hardware](../neuromorphic-hw/index.md), and the plasticity theory of [Plasticity](../plasticity/index.md), while pushing each of these domains toward new materials, new paradigms, and new application contexts.


## Papers

### 2025
- [Ferroelectric synapses](2025-moore-ferroelectric-synapses.md)

### 2024
- [1T1R design to prevent sneak currents](2024-pan-1t1r-design-prevent-sneak-currents.md)
- [3D crossbar RRAM](2024-chen-3d-crossbar-rram.md)
- [Hybrid CMOS-memristor SNN for MNIST](2024-wu-hybrid-cmos-memristor-snn-mnist.md)
- [Self-organized nanowire memristors](2024-kim-self-organized-nanowire-memristors.md)

### 2020
- [Advanced memristive neural systems](2020-amor-advanced-memristive-neural-systems.md)

### 2018
- [Large-scale memristive networks for inference](2018-ambrogio-large-scale-memristive-networks-inference.md)

### 2017
- [Organic neuromorphic chip](2017-van-de-burgt-organic-neuromorphic-chip.md)

### 2016
- [MOSIX chip](2016-qiao-mosix-chip.md)

### 2014
- [Mahowald & Mead AER reference](2014-mahowald-mead-aer-reference.md)

