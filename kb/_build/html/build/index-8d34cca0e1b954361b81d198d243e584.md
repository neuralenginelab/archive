---
title: Memristors
description: Memristor theory, circuit models, SPICE simulation, memristive systems, and the fourth circuit element.
---

# Memristors

## What is this domain?

The memristor — short for memory resistor — is a two-terminal passive circuit element whose resistance depends on the history of current or charge that has passed through it. Postulated by Leon Chua in 1971 as the missing fourth fundamental circuit element alongside the resistor, capacitor, and inductor, the memristor was first physically identified in 2008 in a titanium dioxide thin film device at HP Labs. Its defining property — a pinched hysteresis loop in the current-voltage plane — is shared by a wide class of devices now collectively termed memristive systems.

## Why it matters

The memristor's ability to continuously tune its conductance in response to applied signals makes it a natural analogue of a biological synapse. Unlike digital memory, memristive synapses can store analogue weight values and update them locally through simple voltage pulses, enabling in-situ learning without the need for a separate processor. This underpins much of the excitement around memristors as the physical substrate for spike-timing-dependent plasticity and other on-chip learning rules.

## Core concepts

- **Chua's circuit element theory** — the four fundamental two-terminal circuit elements are defined by the six possible relationships between charge, flux, voltage, and current; the memristor completes this set
- **Pinched hysteresis loop** — the defining electrical signature of a memristive device; the current-voltage curve collapses to a single-valued function at high frequencies, distinguishing memristors from nonlinear resistors
- **State variable formulation** — memristive systems are described by a state equation governing the internal variable (e.g. doping front position, phase boundary) and a constitutive relation linking voltage, current, and state
- **SPICE modelling** — behavioural SPICE models (e.g. Biolek, Prodromakis, Yakopcic) allow circuit simulation of memristive elements and are essential for system-level design
- **Emulator circuits** — active circuit implementations of memristive behaviour using op-amps and multipliers, enabling laboratory testing without physical memristive materials
- **Crossbar synaptic arrays** — memristors placed at the intersections of horizontal and vertical wire grids implement dense, passive weight matrices for vector-matrix multiplication

## How it connects

Memristor theory provides the conceptual framework for the device physics detailed in [RRAM Devices](../rram-devices/index.md), and directly motivates the synaptic implementations used in [Neuromorphic Hardware](../neuromorphic-hw/index.md). The plasticity rules it seeks to implement are covered in [Plasticity](../plasticity/index.md).

## Papers

Papers will appear here as they are added.
