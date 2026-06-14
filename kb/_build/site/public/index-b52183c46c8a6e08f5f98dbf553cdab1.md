---
title: Neuro-Electronics Knowledge Base
description: A structured research base spanning brain biology, neuron models, plasticity, memristors, and neuromorphic hardware.
---

# Neuro-Electronics Knowledge Base

This knowledge base consolidates annotated research literature across neuromorphic computing and computational neuroscience into a single, structured reference. It spans the full intellectual chain from the molecular biology of synapses to the design of silicon neural architectures capable of spike-based, energy-efficient computation. Each section is intended as a living index: papers are added incrementally as the field develops and as new work is reviewed.

The goal is not encyclopedic coverage but curated depth — ensuring that foundational mechanisms, theoretical models, device physics, and systems-level implementations are understood in relation to one another. Whether you are approaching from biology, physics, or engineering, this base is designed to make connections across disciplines explicit and navigable.

## Conceptual Pipeline

::::{grid} 1
:::{card}
**From Biology to Hardware — The Intellectual Chain**

```
Brain Biology  →  Neuron Models  →  Plasticity & Learning
     ↓                                        ↓
Connectomics                         Memristors & RRAM
     ↓                                        ↓
Cortical Physiology  →  Network Dynamics  →  Neuromorphic Hardware
```

Understanding neuromorphic systems requires traversing this chain in both directions: hardware designers must understand biological constraints; neuroscientists must understand what device physics can and cannot deliver.
:::
::::

## Sections

::::{grid} 2
:::{card} 🧬 Foundations
:link: foundations/index.md
Brain biology, synaptic structure, Hebbian learning, LTP/LTD, astrocytes, and the tripartite synapse. The biological ground truth.
:::

:::{card} ⚡ Neuron Models
:link: neuron-models/index.md
Hodgkin-Huxley, integrate-and-fire, AdEx, Izhikevich, FitzHugh-Nagumo, and dendritic computation. The mathematical abstractions of neural dynamics.
:::

:::{card} 🔁 Plasticity
:link: plasticity/index.md
STDP, BCM theory, metaplasticity, and rate- and timing-based learning rules. How synapses change and how that change encodes information.
:::

:::{card} 🧫 Cultures & MEA
:link: cultures-mea/index.md
Neuronal cultures, multi-electrode arrays, burst dynamics, and closed-loop stimulation. Learning observed directly in living networks.
:::

:::{card} 🌀 Memristors
:link: memristors/index.md
Chua's memristor theory, circuit models, SPICE simulation, and memristive systems. The fourth circuit element as a synapse analogue.
:::

:::{card} 🗃️ RRAM Devices
:link: rram-devices/index.md
Resistive RAM, oxide switching, filament dynamics, crossbar arrays, and in-memory computing. The materials and device physics behind memristive hardware.
:::

:::{card} 🖥️ Neuromorphic Hardware
:link: neuromorphic-hw/index.md
Loihi, TrueNorth, SpiNNaker, Neurogrid, and analog VLSI. Chips designed to run spiking neural networks at scale and low power.
:::

:::{card} 🌐 Network Dynamics
:link: network-dynamics/index.md
Neural oscillations, gamma and theta rhythms, synchrony, Hopfield networks, and cortical dynamics. The emergent behavior of coupled neurons.
:::

:::{card} 🗺️ Connectomics
:link: connectomics/index.md
Connectome mapping, graph-theoretic analysis, C. elegans, Drosophila, and the human connectome project. The topology of neural circuits.
:::

:::{card} 🧠 Cortex Physiology
:link: cortex-physiology/index.md
Place cells, grid cells, mirror neurons, visual cortex, and auditory processing. How cortical circuits perform specific computational tasks.
:::

:::{card} 🔬 Extra & Emerging
:link: extra/index.md
Ferroelectric synapses, organic neuromorphic devices, hybrid SNN architectures, and AER systems. The frontier of the field.
:::
::::
