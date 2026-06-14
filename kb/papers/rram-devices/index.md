---
title: RRAM Devices
description: Resistive RAM, oxide switching, filament formation, sneak currents, crossbar arrays, and in-memory computing.
---

# RRAM Devices

## What is this domain?

Resistive random-access memory (RRAM) is a class of non-volatile memory technology in which data is stored as the resistance state of a metal-insulator-metal stack. Switching between high-resistance (HRS) and low-resistance (LRS) states is achieved by the formation and dissolution of conductive filaments — typically composed of oxygen vacancies or metal cations — within a thin oxide layer. RRAM devices are among the most mature memristive technologies and have reached commercial production in several forms.

## Why it matters

RRAM offers a compelling combination of properties for neuromorphic computing: nanoscale scalability, CMOS compatibility, analogue conductance tuning, low switching energy, and non-volatility. Dense crossbar arrays of RRAM devices can perform vector-matrix multiplication in the analogue domain at the location of weight storage, eliminating the von Neumann bottleneck and enabling in-memory computing at a fraction of the energy cost of digital approaches.

## Core concepts

- **Filamentary switching mechanism** — set (LRS) and reset (HRS) transitions involve the formation and rupture of nanoscale conductive filaments driven by Joule heating, ion drift, and redox reactions
- **Forming process** — the initial high-voltage electroforming step that creates the first conductive filament and establishes the switching regime; a source of device-to-device variability
- **Cycle-to-cycle and device-to-device variability** — stochastic filament dynamics lead to resistance distributions rather than fixed resistance values, a major challenge for reliable analogue weight storage
- **Sneak current paths** — in passive crossbar arrays without selector devices, current leaks through neighbouring rows and columns, corrupting read operations and wasting power
- **Selector devices** — two-terminal nonlinear elements (threshold switches, diodes, MOSFETs) placed in series with each RRAM cell to suppress sneak currents and enable individual cell addressing
- **Multi-level cell (MLC) operation** — careful control of compliance current, pulse amplitude, and duration allows programming of multiple resistance levels per cell, increasing information density

## How it connects

RRAM devices are the principal physical realisation of the memristive systems theorised in [Memristors](../memristors/index.md). Their integration into large-scale arrays connects directly to the architecture of [Neuromorphic Hardware](../neuromorphic-hw/index.md), and their analogue dynamics are analysed against the plasticity rules in [Plasticity](../plasticity/index.md).

## Papers

Papers will appear here as they are added.
