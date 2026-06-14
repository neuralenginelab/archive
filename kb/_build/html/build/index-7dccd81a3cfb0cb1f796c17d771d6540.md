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

Papers will appear here as they are added.
