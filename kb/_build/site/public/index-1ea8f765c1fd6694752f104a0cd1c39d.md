---
title: Neuron Models
description: Computational models of neurons — Hodgkin-Huxley, integrate-and-fire, FitzHugh-Nagumo, AdEx, Izhikevich, and dendritic computation.
---

# Neuron Models

## What is this domain?

Neuron models are mathematical descriptions of the electrical dynamics of individual neurons. They range from biophysically detailed conductance-based models that reproduce the full ionic basis of the action potential, to highly abstracted point neuron models that retain only the spike threshold and reset mechanism. Each model represents a different trade-off between biological fidelity, computational tractability, and analytical transparency.

## Why it matters

Neuron models are the building blocks of any spiking neural network. The choice of model determines what dynamics are preserved in simulation, what hardware resources are required, and what learning rules can be applied. For neuromorphic hardware designers, neuron models define the computation that silicon circuits must implement; for theorists, they define the dynamical systems whose behaviour must be understood.

## Core concepts

- **Hodgkin-Huxley model** — four coupled ODEs describing the dynamics of sodium, potassium, and leak conductances; the canonical biophysical neuron model
- **Leaky integrate-and-fire (LIF)** — a linear subthreshold model with a hard threshold and instantaneous reset; computationally efficient and widely used in large-scale simulation
- **FitzHugh-Nagumo model** — a two-dimensional reduction of Hodgkin-Huxley capturing excitability and spike generation with a fast activator and slow recovery variable
- **Adaptive exponential integrate-and-fire (AdEx)** — extends LIF with an exponential spike initiation term and an adaptation current, reproducing a wide range of cortical firing patterns
- **Izhikevich model** — a two-variable system combining computational efficiency with the ability to reproduce over twenty distinct firing patterns observed in cortical neurons
- **Dendritic computation** — active conductances in dendrites enable nonlinear integration, coincidence detection, and local plasticity beyond what point neuron models capture

## How it connects

Neuron models abstract from the biophysical detail in [Foundations](../foundations/index.md) and provide the computational units used in [Network Dynamics](../network-dynamics/index.md). The choice of neuron model directly informs what can be implemented on [Neuromorphic Hardware](../neuromorphic-hw/index.md).


## Papers

### 2007
- [Dynamical systems in neuroscience: the geometry of excitability and bursting](2007-izhikevich-dynamical-systems-neuroscience.md)

### 2005
- [Adaptive exponential integrate-and-fire model as an effective description of neuronal activity](2005-brette-gerstner-adaptive-exponential-integrate-fire.md)
- [Dendritic computation](2005-london-hausser-dendritic-computation.md)

### 2004
- [Which model to use for cortical spiking neurons?](2004-izhikevich-which-model-cortical-spiking-neurons.md)

### 2003
- [Pyramidal neuron as two-layer neural network](2003-poirazi-pyramidal-neuron-two-layer-network.md)
- [Simple model of spiking neurons](2003-izhikevich-simple-model-spiking-neurons.md)

### 2002
- [Spike-timing-dependent synaptic modification induced by natural spike trains](2002-froemke-dan-stdp-natural-spike-trains.md)

### 2001
- [Rate, timing, and cooperativity jointly determine cortical synaptic plasticity](2001-sjostrom-rate-timing-cooperativity-plasticity.md)

### 2000
- [Reliability of spike timing in neocortical neurons](2000-mainen-sejnowski-reliability-spike-timing.md)

### 1996
- [Excitatory and inhibitory interactions in localized populations of model neurons](1996-wilson-cowan-excitatory-inhibitory-interactions.md)

### 1995
- [Cellular basis of working memory](1995-goldman-rakic-cellular-basis-working-memory.md)

### 1984
- [A model of neuronal bursting using three coupled first order differential equations](1984-hindmarsh-rose-neuronal-bursting-model.md)

### 1981
- [Voltage oscillations in the barnacle giant muscle fiber](1981-morris-lecar-voltage-oscillations.md)

### 1962
- [An active pulse transmission line simulating nerve axon](1962-nagumo-active-pulse-transmission-line.md)

### 1961
- [Impulses and physiological states in theoretical models of nerve membrane](1961-fitzhugh-theoretical-models-nerve-membrane.md)

### 1907
- [First integrate-and-fire model of neuron](1907-lapicque-first-integrate-fire-model.md)

