---
title: Neuron Models
description: Computational models of single neurons — Hodgkin-Huxley, integrate-and-fire, FitzHugh-Nagumo, AdEx, Izhikevich, and dendritic computation.
---

# Neuron Models

## Scope

Neuron models are mathematical formalisms for single-neuron electrical dynamics. The spectrum runs from conductance-based models resolving individual ion channel kinetics to two-variable abstractions retaining only threshold and reset. Every position encodes a deliberate trade-off: biological fidelity against computational and analytical cost.

## Relevance

Model choice determines which dynamics survive into simulation, which hardware resources a circuit demands, and which plasticity rules can operate. For neuromorphic designers: a neuron model is a circuit specification. For theorists: it is a dynamical system whose geometry must be fully characterised before network-level inference is valid.

## Cross-references

Models here abstract from the biophysics in [Foundations](../foundations/index.md) and constitute the computational units assembled in [Network Dynamics](../network-dynamics/index.md). Model choice directly constrains what is realisable on [Neuromorphic Hardware](../neuromorphic-hw/index.md).

## Papers

### 2007

- [Dynamical systems in neuroscience: the geometry of excitability and bursting](https://dn760105.eu.archive.org/0/items/AAAIzhikevichE.M.DynamicalSystemsInNeuroscience/AA%20A%20Izhikevich%20E.M.%20Dynamical%20Systems%20in%20Neuroscience.pdf)

### 2005

- [Adaptive exponential integrate-and-fire model as an effective description of neuronal activity](https://doi.org/10.1152/jn.00686.2005)
- [Dendritic computation](10.1146/annurev.neuro.28.061604.135703)

### 2004

- [Which model to use for cortical spiking neurons?](10.1109/TNN.2004.832719)

### 2003

- [Pyramidal neuron as two-layer neural network](<https://doi.org/10.1016/S0896-6273(03)00149-1>)
- [Simple model of spiking neurons](10.1109/TNN.2003.820440)

### 2002

- [Spike-timing-dependent synaptic modification induced by natural spike trains](https://www.nature.com/articles/416433a)

### 2001

- [Rate, timing, and cooperativity jointly determine cortical synaptic plasticity](<https://doi.org/10.1016/S0896-6273(01)00542-6>)

### 2000

- [Reliability of spike timing in neocortical neurons](https://www.science.org/doi/10.1126/science.7770778)

### 1996

- [Excitatory and inhibitory interactions in localized populations of model neurons](<https://doi.org/10.1016/S0006-3495(72)86068-5>)

### 1995

- [Cellular basis of working memory](https://doi.org/10.1098/rspb.1984.0024)

### 1984

- [A model of neuronal bursting using three coupled first order differential equations](https://www.researchgate.net/publication/17042423_A_Model_of_Neuronal_Bursting_Using_Three_Coupled_First_Order_Differential_Equations)

### 1981

- [Voltage oscillations in the barnacle giant muscle fiber](https://www.sciencedirect.com/science/article/pii/S0006349581847820)

### 1962

- [An active pulse transmission line simulating nerve axon](https://ieeexplore.ieee.org/document/4066548)

### 1961

- [Impulses and physiological states in theoretical models of nerve membrane](<https://doi.org/10.1016/S0006-3495(61)86902-6>)

### 1907

- [First integrate-and-fire model of neuron](https://www.researchgate.net/publication/5577361_Spike_Timing-Dependent_Plasticity_A_Hebbian_Learning_Rule)
