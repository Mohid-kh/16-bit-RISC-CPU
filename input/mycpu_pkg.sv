package mycpu_pkg;

`ifndef SYNTHESIS
   // To do:  Define your clock period (unit is nanosecond)
   localparam real CLK_PERIOD = 4.3;    // N = 6

   // To do:  Define the last 4 digits of your student number
   localparam int  unsigned mynumber[4] = { 4, 3, 2, 6 };
   
`endif
   
   
   // Function unit  function codes

   typedef enum    logic [3:0] {   
				   FMOVA = 4'b0000,
				   FINC  = 4'b0001,
				   FADD  = 4'b0010,
                                   FMUL  = 4'b0011, // non-Mano!
                                   FSRA  = 4'b0100, // non-Mano!
				   FSUB  = 4'b0101,
				   FDEC  = 4'b0110,
				   FSLA  = 4'b0111, // non-Mano!
				   FAND  = 4'b1000,
				   FOR   = 4'b1001,
				   FXOR  = 4'b1010,
				   FNOT  = 4'b1011,
				   FMOVB = 4'b1100,
				   FSHR  = 4'b1101,
				   FSHL  = 4'b1110, 
				   FUSR  = 4'b1111 // non-Mano!
                                   } fs_t;
   
   // Opcodes

   typedef enum    logic [6:0] {   
				   MOVA = 7'b0000000,
				   INC  = 7'b0000001,
				   ADD  = 7'b0000010,
				   MUL  = 7'b0000011, // non-Mano!
				   SRA  = 7'b0000100, // non-Mano!				   				   
				   SUB  = 7'b0000101,
				   DEC  = 7'b0000110,
				   SLA  = 7'b0000111, // non-Mano!				   
				   AND  = 7'b0001000,
				   OR   = 7'b0001001,
				   XOR  = 7'b0001010,
				   NOT  = 7'b0001011,
				   MOVB = 7'b0001100,
				   SHR  = 7'b0001101,
				   SHL  = 7'b0001110,
				   USR  = 7'b0001111, // non-Mano!				   
				   LDI  = 7'b1001100,
				   ADI  = 7'b1000010,
				   LD   = 7'b0010000,
				   ST   = 7'b0100000,
				   BRZ  = 7'b1100000,
				   BRN  = 7'b1100001,
				   JMP  = 7'b1110000,
				   IOR  = 7'b0010001, // non-Mano!
				   IOW  = 7'b0100001, // non-Mano!		
				   HAL  = 7'b1111111  // non-Mano!
				   } opcode_t;

   // Control unit state codes

   typedef enum logic [5:0] {
			     RST = 6'b000000,
			     INF = 6'b000001, 
			     EX0 = 6'b000010, 
			     HLT = 6'b000100 
			     } cu_state_t;
   
endpackage
   
