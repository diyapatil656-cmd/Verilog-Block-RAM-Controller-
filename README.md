# Verilog-Block-RAM-Controller-
# Synchronous Block RAM Controller (Verilog RTL)

## Project Overview
This repository contains a fully functional **Synchronous Single-Port Block RAM (BRAM) Memory Controller** written in Verilog RTL. The module implements an internal storage layout capable of hosting data arrays, simulating internal block memories found on FPGA fabrics.

## Architectural Features
* **Storage Depth:** 16 addresses x 8-bit words register array layout.
* **Synchronous Operations:** Fully aligned transitions linked to rising system clock edges.
* **Control Partitioning:** Uses a single Write Enable (`we`) line to toggle between writing data payloads or reading historical variables out safely.

## File Configurations
* `/ram_controller.v` : Core RTL design mapping the multi-dimensional memory array space.
* `/ram_controller_tb.v` : Verification testbench verifying write-to-read sequencing loops.
