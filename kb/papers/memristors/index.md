---
title: Memristors
description: Memristor theory, circuit models, SPICE simulation, memristive systems, and the fourth circuit element.
---

# Memristors

## Scope

The memristor is a two-terminal passive circuit element whose resistance is determined by its charge or current history. Postulated by Leon Chua in 1971 as the fourth fundamental circuit element alongside the resistor, capacitor, and inductor, it was physically realised in 2008 in a titanium dioxide thin-film device at HP Labs. Its defining electrical signature: a pinched hysteresis loop in the current-voltage plane that collapses to a single-valued curve at high frequency. This property is shared by a broad class of devices: collectively termed memristive systems unified by a state-variable formulation coupling voltage, current, and an internal physical variable.

## Relevance

Continuous, analogue conductance tuning in response to voltage pulses makes the memristor a natural physical substrate for synaptic weight storage and update. Weight modification is local and requires no separate processor, enabling in-situ implementation of STDP and other spike-driven learning rules. At the array level, memristors placed at crossbar intersections implement dense passive weight matrices capable of analogue vector-matrix multiplication the core operation of neural inference.

## Cross-references

Memristor theory provides the conceptual framework for the device physics in [RRAM Devices](../rram-devices/index.md) and directly motivates the synaptic implementations in [Neuromorphic Hardware](../neuromorphic-hw/index.md). The plasticity rules these devices seek to implement are covered in [Plasticity](../plasticity/index.md).

## Papers

### 2020

- [Memristive devices for computing](https://doi.org/10.1038/s41565-020-0647-z)

### 2011

- [A versatile memristor model with nonlinear dopant kinetics](https://doi.org/10.1109/TED.2011.2158004)
- [Memory effects in complex materials and nanoscale systems](https://doi.org/10.1080/00018732.2010.544961)
- [The elusive memristor: properties of basic electrical circuits](https://doi.org/10.1088/0143-0807/30/4/001)

### 2010

- [Memristor — the missing circuit element](https://doi.org/10.1109/TCT.1971.1083337)

### 2009

- [SPICE model of memristor with nonlinear dopant drift](https://www.researchgate.net/publication/26625012_SPICE_Model_of_Memristor_with_Nonlinear_Dopant_Drift)

### 2008

- [How we found the missing memristor](https://doi.org/10.1109/MSPEC.2008.4687366)
- [The elusive memristor: properties of basic electrical circuits](https://doi.org/10.1088/0143-0807/30/4/001)
- [The missing memristor found](https://doi.org/10.1038/nature06932)

### 1976

- [Memristive devices and systems](https://doi.org/10.1109/PROC.1976.10092)

### 1971

- [Memristor — the missing circuit element](https://doi.org/10.1109/TCT.1971.1083337)
