`include "mycpu.svh"

import mycpu_pkg::*;

module cu
  (
   input logic 	       clk,
   input logic 	       rst_n,
   input logic [15:0]  ins_in,
   input logic [1:0]   nz_in,
   output logic        il_out,
   output logic [1:0]  ps_out,
   output logic        rw_out,
   output logic [11:0] rs_out,
   output logic [3:0]  mx_out,
   output 	       fs_t fs_out, 
   output logic        wen_out,
   output logic        iom_out   
   );

   cu_state_t          st_r;		// enum defined in mycpu_pkg.sv
   cu_state_t          ns;   	
   opcode_t 	       opcode;		// defined in cu_pkg.sv
	
   always_ff @(posedge clk or negedge rst_n)  
    begin : st_regs
    if(rst_n == '0)
     st_r <= RST;
    else 
     st_r <= ns;			// store next state in st_r
    end : st_regs 

   always_comb
   begin : idecoder
   case(st_r)
    RST: 	     begin : rst_state	// RESET State
     ns = INF;
     ps_out  = '0;
     il_out  = '0;
     rw_out  = '0;
     wen_out = '1;
     rs_out  = '0;                      // don't care
     mx_out  = '0;  
     fs_out  = FMOVA; 			// don't care
     iom_out = '0;   end   : rst_state
    INF:	     begin : fetch_state
     ns = EX0;
     ps_out  = '0;
     il_out  = '1;
     rw_out  = '0;
     mx_out  =  1;			// actual value : xxx1 [don't care: 0 in cu.sv]
     rs_out  = '0; 			// don't care
     fs_out  = FMOVA;			// don't care
     wen_out = '1;   
     iom_out = '0;   end   : fetch_state
    EX0: 	     begin : EX0_state
     rs_out  = {'0, ins_in[8:6], '0, ins_in[5:3], '0, ins_in[2:0]};
     if(opcode == MOVA) begin
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : x10x
      fs_out  = FMOVA;
      wen_out = '1;     
      iom_out = '0;     end
     else if(opcode == INC) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : x10x
      fs_out  =  FINC;
      wen_out = '1;     
      iom_out = '0;         end
     else if(opcode == ADD) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : 010x
      fs_out  = FADD;	
      wen_out = '1;     
      iom_out = '0;         end  
     else if(opcode == MUL) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : x10x
      fs_out  = FMUL;
      wen_out = '1;     
      iom_out = '0;         end 
     else if(opcode == SRA) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b1100;		// actual value : 110x
      fs_out  = FSRA;
      wen_out = '1;     
      iom_out = '0;         end
     else if(opcode == SUB) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : 010x
      fs_out  = FSUB;
      wen_out = '1;     
      iom_out = '0;         end  
     else if(opcode == DEC) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : x10x
      fs_out  = FDEC;
      wen_out = '1;     
      iom_out = '0;         end    
     else if(opcode == SLA) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b1100;		// actual value : 110x
      fs_out  = FSLA;
      wen_out = '1;     
      iom_out = '0;         end 
     else if(opcode == AND) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : 010x
      fs_out  = FAND;
      wen_out = '1;     
      iom_out = '0;         end    
     else if(opcode == OR) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : 010x
      fs_out  = FOR;
      wen_out = '1;     
      iom_out = '0;         end   
     else if(opcode == XOR) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : x10x
      fs_out  = FXOR;
      wen_out = '1;     
      iom_out = '0;         end  
     else if(opcode == NOT) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : x10x
      fs_out  = FNOT;
      wen_out = '1;     
      iom_out = '0;         end    
     else if(opcode == MOVB) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : 010x
      fs_out  = FMOVB;
      wen_out = '1;     
      iom_out = '0;         end   
     else if(opcode == SHR) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : 010x
      fs_out  = FSHR;
      wen_out = '1;     
      iom_out = '0;         end      
     else if(opcode == SHL) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0100;		// actual value : 010x
      fs_out  = FSHL;
      wen_out = '1;     
      iom_out = '0;         end  
     else if(opcode == USR) begin 	// SELF IMPLEMENTATION 
       ns = INF;
       ps_out =  1;
       il_out = '0;
       rw_out =  1;
       mx_out = 4'b0100; 		// actual value : x10x
       fs_out = FUSR;
       wen_out =  1;
       iom_out = '0;
     end   
     else if(opcode == LD) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0010;		// actual value : x010
      fs_out  = FMOVA;			// actual value : xxxx
      wen_out = '1;     
      iom_out = '0;         end  
     else if(opcode == ST) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '0;
      mx_out  = 4'b0000;		// actual value : 0xx0
      fs_out  = FMOVA;			// actual value : xxxx
      wen_out = '0;     
      iom_out = '0;         end 
     else if(opcode == LDI) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b1100;		// actual value : 110x
      fs_out  = FMOVB;
      wen_out = '1;     
      iom_out = '0;         end 
     else if(opcode == ADI) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b1100;		// actual value : 110x
      fs_out  = FADD;
      wen_out = '1;     
      iom_out = '0;         end    
     else if(opcode == BRZ) begin   
      if(nz_in == 2'b01 || nz_in == 2'b11)    begin  // nz_in = x1
       ns = INF;
       ps_out  = 2'b10;
       il_out  = '0;
       rw_out  = '0;
       mx_out  = 4'b0000;		// actual value : xxxx
       fs_out  = FMOVA;
       wen_out = '1;     
       iom_out = '0;         end 
      else 		     begin	// nz_in = x0
       ns = INF;
       ps_out  = 2'b01;
       il_out  = '0;
       rw_out  = '0;
       mx_out  = 4'b0000;		// actual value : xxxx
       fs_out  = FMOVA;
       wen_out = '1;     
       iom_out = '0;         end  end
     else if(opcode == BRN) begin      
      if(nz_in == 2'b10 || nz_in == 2'b11)    begin 
       ns = INF;
       ps_out  = 2'b10;
       il_out  = '0;
       rw_out  = '0;
       mx_out  = 4'b0000;		// actual value : xxxx
       fs_out  = FMOVA;
       wen_out = '1;     
       iom_out = '0;         end 
     else 		     begin
       ns = INF;
       ps_out  = 2'b01;
       il_out  = '0;
       rw_out  = '0;
       mx_out  = 4'b0000;		// actual value : xxxx
       fs_out  = FMOVA;
       wen_out = '1;     
       iom_out = '0;         end  end
     else if(opcode == JMP) begin 
      ns = INF;
      ps_out  = '1;
      il_out  = '0;
      rw_out  = '0;
      mx_out  = 4'b0000;		// actual value : xxxx
      fs_out  = FMOVA;
      wen_out = '1;     
      iom_out = '0;         end
     else if(opcode == IOR) begin 
      ns = INF;
      ps_out  = 2'b01;
      il_out  = '0;
      rw_out  = '1;
      mx_out  = 4'b0000;		// actual value : x000
      fs_out  = FMOVA;			// actual value : xxxx
      wen_out = '1;     
      iom_out = '1;         end
     else if(opcode == IOW) begin 
      ns = INF;
      ps_out  =  1;
      il_out  = '0;
      rw_out  = '0;
      mx_out  = 4'b0000;		// actual value : 0xx0
      fs_out  = FMOVA;		 	// actual value : xxxx
      wen_out = '0;     
      iom_out = '1;         end
     else if(opcode == HAL) begin 
      ns = HLT;
      ps_out  = '0;
      il_out  = '0;
      rw_out  = '0;
      mx_out  = 4'b0000;		// actual value : xxxx
      fs_out  = FMOVA;			// actual value : xxxx
      wen_out = '1;     
      iom_out = '0;         end
     else begin 			// illegal state (return to halt state)
      ns = HLT;
      ps_out  = '0;
      il_out  = '0;
      rw_out  = '0;
      mx_out  = 4'b0000;		// actual value : xxxx
      fs_out  = FMOVA;			// actual value : xxxx
      wen_out = '1;     
      iom_out = '0;         end
    end : EX0_state
    default: begin : dft_case		// illegal state
    ns = HLT;
    ps_out  = '0;
    il_out  = '0;
    rw_out  = '0;
    rs_out  = '0;
    mx_out  = 4'b0000;			// actual value : xxxx
    fs_out  = FMOVA;			// actual value : xxxx
    wen_out = '1;     
    iom_out = '0;         
    end : dft_case
    endcase;
   end : idecoder 

   assign opcode = opcode_t'(ins_in[15:9]);   // opcode gets assigned the last 7 bits of ins_in
   
endmodule


