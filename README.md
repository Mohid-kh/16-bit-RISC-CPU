Overview 
MyCPU is a 16-bit RISC architecture-based processor core designed to perform a variety of arithmetic, logical, and control operations. This processor features a modular design and is implemented as part of a digital techniques design project. MyCPU is designed for efficient instruction execution and integrates a pipeline for fetching and executing instructions.  
Share

MKT
You said:
mycpu_project_specification_2024.docx
Document
readme file for a : 16-bit RISC architecture based CPU that has following modules :
control unit (cu), function unit (fu), instruction register (ir), muxa, muxb, muxd, register bank (rb) and program counter (pc). details in the file provided 
ChatGPT
Based on the information provided in the document, here's a draft for a README file for the 16-bit RISC architecture-based CPU project:

MyCPU 16-Bit RISC Processor
Overview
MyCPU is a 16-bit RISC architecture-based processor core designed to perform a variety of arithmetic, logical, and control operations. This processor features a modular design and is implemented as part of a digital techniques design project. MyCPU is designed for efficient instruction execution and integrates a pipeline for fetching and executing instructions.

Key Features
16-bit Instruction Set: Supports various instruction types, including register, immediate, branch, and special operations.
Modular Design: Comprises several key modules: Control Unit (CU), Function Unit (FU), Instruction Register (IR), Multiplexers (MUXA, MUXB, MUXD), Register Bank (RB), and Program Counter (PC).
Special Instructions: Includes a customizable USR instruction for advanced operations.
Pipeline Architecture: Efficiently handles instruction fetch and execution.
Modules
1. Control Unit (CU)
Implements a finite state machine for the fetch-decode-execute cycle.
Decodes instructions and generates control signals for all other modules.
Includes a HALT state for stopping execution and special logic for the USR instruction.
2. Function Unit (FU)
Performs arithmetic and logical operations on operands from input buses.
Supports operations like addition, subtraction, multiplication (with saturation), logical shifts, and bitwise operations.
Outputs result and sets condition flags (Zero and Negative).
3. Instruction Register (IR)
Temporarily stores the fetched instruction.
Decodes immediate values and provides them to other modules.
4. Multiplexers (MUXM, MUXB, MUXD)
MUXM: Selects the source for the program counter.
MUXB: Extends immediate values and selects input sources.
MUXD: Routes data to the Register Bank based on operation requirements.
5. Register Bank (RB)
Contains 16 registers (8 general-purpose and 8 hidden).
Provides operand values and stores results of operations.
6. Program Counter (PC)
Tracks the address of the next instruction to execute.
Supports increment, branch, and jump operations.
Instruction Set Architecture
General Instruction Format
16-bit instruction word divided into:
Opcode (7 bits): Defines the operation.
Operands (3 x 3 bits): Define destination, source A, and source B registers or immediate values.
Types of Instructions
Register Instructions: Operate on data in registers.
Immediate Instructions: Use constant values in operations.
Branch/Jump Instructions: Modify program flow based on conditions.
Special Instructions: Implement custom complex operations.
