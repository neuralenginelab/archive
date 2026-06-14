---
title: Neuromorphic Hardware
description: Neuromorphic chips and systems — Loihi, TrueNorth, SpiNNaker, Neurogrid, analog VLSI, and silicon neurons.
---

# Neuromorphic Hardware

## What is this domain?

Neuromorphic hardware refers to electronic systems whose architecture is explicitly inspired by the structure and dynamics of biological neural circuits. Rather than executing sequential instructions on a von Neumann processor, neuromorphic chips implement networks of spiking neuron and synapse circuits directly in silicon, with computation emerging from the propagation of spike events through a reconfigurable connectivity fabric. The field traces its origins to Carver Mead's analog VLSI work at Caltech in the late 1980s.

## Why it matters

Spiking neural networks processed on neuromorphic hardware offer potentially transformative advantages in energy efficiency and latency for event-driven, sparse data streams — the kind of data produced by dynamic vision sensors, audio preprocessing pipelines, and biological neural recordings. For applications where inference must run at milliwatt power budgets (edge devices, implantable BCI systems), neuromorphic approaches offer a compelling alternative to GPU-based deep learning inference.

## Core concepts

- **Intel Loihi / Loihi 2** — a research chip implementing up to 1 million neurons with on-chip STDP learning, programmable synaptic dynamics, and a hierarchical mesh interconnect
- **IBM TrueNorth** — a 4096-core chip implementing 1 million digital spiking neurons and 256 million binary synapses in 70 mW, targeting ultra-low-power inference
- **SpiNNaker (Manchester)** — a massively parallel ARM-core architecture designed to simulate large spiking networks in biological real time through a custom packet-switched interconnect
- **Neurogrid (Stanford)** — a mixed-signal analog/digital chip implementing 65,536 neurons with sub-threshold analog circuits that closely mimic biophysical conductance dynamics
- **Analog VLSI neuron circuits** — subthreshold CMOS circuits whose current-voltage characteristics follow exponential laws similar to the Boltzmann factors governing ion channel gating
- **Address Event Representation (AER)** — the spike communication protocol used across most neuromorphic chips, encoding spike events as asynchronous address packets on a shared digital bus

## How it connects

Neuromorphic hardware implements the neuron models from [Neuron Models](../neuron-models/index.md), the plasticity rules from [Plasticity](../plasticity/index.md), and uses [RRAM Devices](../rram-devices/index.md) or [Memristors](../memristors/index.md) as synaptic elements. Benchmarking against real cortical circuits draws on [Cortex Physiology](../cortex-physiology/index.md) and [Network Dynamics](../network-dynamics/index.md).

## Papers

Papers will appear here as they are added.
