---
title: Neuromorphic Hardware
description: Neuromorphic chips and systems — Loihi, TrueNorth, SpiNNaker, Neurogrid, analog VLSI, and silicon neurons.
---

# Neuromorphic Hardware

## Scope

Neuromorphic hardware implements networks of spiking neuron and synapse circuits directly in silicon, with computation emerging from spike propagation through a reconfigurable connectivity fabric rather than sequential instruction execution. The architecture is explicitly modelled on biological neural circuits. The field originates in Carver Mead's subthreshold analog VLSI work at Caltech in the late 1980s.

## Relevance

Event-driven, sparse spike streams enable energy and latency profiles that von Neumann architectures cannot match: inference at milliwatt budgets, real-time processing for dynamic vision sensors, audio pipelines, and implantable BCI systems. Current platforms span a design space from fully digital (IBM TrueNorth, Intel Loihi 2) to mixed-signal analog (Stanford Neurogrid) to large-scale simulation (Manchester SpiNNaker), each encoding different tradeoffs between biological fidelity, on-chip learning, and scalability.

## Cross-references

Neuromorphic hardware implements the neuron models from [Neuron Models](../neuron-models/index.md) and the plasticity rules from [Plasticity](../plasticity/index.md), using [RRAM Devices](../rram-devices/index.md) or [Memristors](../memristors/index.md) as synaptic elements. Benchmarking against real cortical circuits draws on [Cortex Physiology](../cortex-physiology/index.md) and [Network Dynamics](../network-dynamics/index.md).

## Papers

### 2022

- [Taking brain-inspired computing to the next level with Intel's Loihi 2 — extended review](https://www.intel.com/content/www/us/en/research/neuromorphic-computing-loihi-2-technology-brief.html)

### 2021

- [Loihi 2: a neuromorphic processor with on-chip learning and programmable neuron models](https://redwood.berkeley.edu/wp-content/uploads/2021/08/Davies2018.pdf)

### 2018

- [Loihi: a neuromorphic manycore processor with on-chip learning](https://www.researchgate.net/publication/322548911_Loihi_A_Neuromorphic_Manycore_Processor_with_On-Chip_Learning)

### 2014

- [A million spiking-neuron integrated circuit with a scalable communication network and interface](https://doi.org/10.1126/science.1254642)
- [Neurogrid: a mixed-analog-digital multichip system for large-scale neural simulations](https://doi.org/10.1109/JPROC.2014.2313565)
- [Neuromorphic electronic circuits for building autonomous cognitive systems](https://doi.org/10.1109/JPROC.2014.2313103)
- [The SpiNNaker project](https://doi.org/10.1109/JPROC.2014.2304638)

### 2011

- [Neuromorphic silicon neuron circuits](https://doi.org/10.3389/fnins.2011.00073)

### 1991

- [A silicon neuron](https://doi.org/10.1038/354515a0)

### 1990

- [Neuromorphic electronic systems](https://doi.org/10.1109/5.58356)

### 1989

- [Analog VLSI and neural systems](https://archive.org/details/analogvlsineural00mead)
