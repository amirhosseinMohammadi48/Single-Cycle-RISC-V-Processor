# Single-Cycle RISC-V Processor

## Overview

This project focuses on the design and implementation of a single-cycle RISC-V processor using Verilog HDL. The processor's datapath and control unit are designed to execute supported instructions within a single clock cycle.

The project explores the fundamental concepts of processor architecture, instruction decoding, ALU operations, control signal generation, and datapath design.

## Features

- Single-cycle processor architecture
- Datapath and control unit design
- Instruction decoding and control signal generation
- Arithmetic and logical operations using the ALU
- Support for R-type, I-type, S-type, and B-type instruction formats
- Branch and jump handling
- Program counter (PC) update logic
- Register file and immediate generation

## Supported Instruction Formats

The processor design considers the following RISC-V instruction formats:

 R-type: Register-based arithmetic and logical operations 
 I-type: Immediate arithmetic and logical operations 
 S-type: Store instructions 
 B-type: Conditional branch instructions 

Additional instruction support depends on the implemented control logic and datapath.

## Architecture

The processor is organized around the following components:

- **Program Counter (PC):** Holds the address of the current instruction.
- **Control Unit:** Decodes instructions and generates the required control signals.
- **Register File:** Provides source operands and stores results in destination registers.
- **Immediate Generator:** Extracts and extends immediate values from instruction fields.
- **Arithmetic Logic Unit (ALU):** Performs arithmetic and logical operations.
- **Datapath:** Connects the processor components to execute instructions and update the architectural state.

## Technologies

- **Hardware Description Language:** Verilog HDL
- **Architecture:** RISC-V
- **Design Approach:** Single-cycle processor

## Learning Objectives

This project provides practical experience with:

- Computer organization and processor architecture
- RTL design using Verilog HDL
- Datapath and control unit implementation
- Instruction formats and decoding
- ALU design and control
- Digital system design and hardware verification

## Author

Amirhossein Mohammadi
