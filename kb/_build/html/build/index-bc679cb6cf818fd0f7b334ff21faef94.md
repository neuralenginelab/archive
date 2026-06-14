---
title: Network Dynamics
description: Neural oscillations, gamma and theta rhythms, synchrony, Hopfield networks, and cortical dynamics.
---

# Network Dynamics

## What is this domain?

Network dynamics concerns the collective behaviour that emerges when many neurons are coupled together through excitatory and inhibitory synapses. Individual neurons fire spikes, but networks of neurons generate oscillations, transient synchrony, attractor states, and chaotic trajectories — phenomena that have no single-neuron counterpart. Understanding these emergent dynamics is essential for linking cellular mechanisms to systems-level computation and behaviour.

## Why it matters

The functional states of neural circuits — memory retrieval, sensory binding, sleep-wake transitions, pathological seizures — are expressed as network-level dynamical phenomena. Neuromorphic systems that seek to replicate or interface with these functions must produce or respond to the same dynamical signatures. Attractor network theory, in particular, provides one of the few tractable mathematical frameworks connecting connectivity structure to computational function.

## Core concepts

- **Neural oscillations** — rhythmic fluctuations in local field potential and population firing rate spanning delta (< 4 Hz), theta (4–8 Hz), alpha (8–13 Hz), beta (13–30 Hz), and gamma (30–100 Hz) bands
- **Gamma and theta coupling** — theta oscillations in hippocampus organise sequences of gamma-coupled cell assemblies, providing a temporal scaffolding for episodic memory encoding
- **Excitatory-inhibitory balance** — the interplay between fast excitatory (AMPA) and inhibitory (GABA) currents determines whether networks oscillate, remain asynchronous, or generate bursts
- **Hopfield networks** — recurrent networks with symmetric weights that store patterns as fixed-point attractors; the mathematical foundation of associative memory and energy-based learning
- **Mean-field theory** — analytical reduction of large networks to equations for population firing rate and synaptic currents, enabling tractable study of phase transitions and bifurcations
- **Criticality hypothesis** — the proposal that cortex operates near a phase transition between ordered and disordered dynamics, maximising dynamic range, information transmission, and computational flexibility

## How it connects

Network dynamics emerges from the neuron models in [Neuron Models](../neuron-models/index.md) and the plasticity rules in [Plasticity](../plasticity/index.md). The oscillatory signatures studied here are directly observable in MEA recordings described in [Cultures & MEA](../cultures-mea/index.md), and connect to the circuit-level physiology of [Cortex Physiology](../cortex-physiology/index.md).


## Papers

### 2012
- [Mechanisms of gamma oscillations](2012-buzsaki-wang-mechanisms-of-gamma-oscillations.md)

### 2005
- [A mechanism for cognitive dynamics: neuronal communication through neuronal coherence](2005-fries-neuronal-communication-through-coherence.md)

### 2004
- [Neuronal oscillations in cortical networks](2004-buzsaki-draguhn-neuronal-oscillations-cortical-networks.md)

### 2002
- [Theta oscillations in the hippocampus](2002-buzsaki-theta-oscillations-hippocampus.md)

### 1989
- [Stimulus-specific neuronal oscillations in orientation columns of cat visual cortex](1989-gray-singer-stimulus-specific-neuronal-oscillations.md)

### 1982
- [Neural networks and physical systems with emergent collective computational abilities](1982-hopfield-neural-networks-emergent-computational-abilities.md)

