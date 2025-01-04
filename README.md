Key Features 
16-bit Instruction Set: Supports various instruction types, including register, immediate, branch, and special operations. 
Modular Design: Comprises several key modules: Control Unit (CU), Function Unit (FU), Instruction Register (IR), Multiplexers (MUXA, MUXB, MUXD), Register Bank (RB), and Program Counter (PC).
Special Instructions: Includes a customizable USR instruction for advanced operations. 
Pipeline Architecture: Efficiently handles instruction fetch and execution. 
1. Control Unit (CU) 
Manages the fetch-decode-execute cycle and generates control signals. Includes a state machine and special handling for USR and HAL instructions. 
 
2. Function Unit (FU) 
Performs arithmetic and logical operations, sets condition flags (Zero and Negative), and supports signed/unsigned operations with saturation for specific functions.  
 
3. Instruction Register (IR) 
Stores the fetched instruction and extracts immediate values. Supplies instruction opcodes and operands to other modules. 

4. Multiplexers (MUXM, MUXB, MUXD) 
MUXM: Selects between program counter or memory bus as the memory address source. 
MUXB: Handles operand selection and immediate value extension. 
MUXD: Routes data from multiple sources (FU, memory, or I/O) to the Register Bank. 
5. Register Bank (RB) 
Holds 16 registers (8 user-accessible and 8 hidden). Provides operand values and stores operation results. 

6. Program Counter (PC) 
Tracks the next instruction address, supporting increments, branches, and jumps based on control signals. 
