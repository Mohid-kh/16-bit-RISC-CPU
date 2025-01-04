`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

module mycpu_svamod
  
  (
   input logic 	      clk,
   input logic 	      rst_n, 
   input logic [15:0] a_out, 
   input logic [15:0] d_in,
   input logic [15:0] d_out,
   input logic [15:0] io_in,
   input logic 	      wen_out,
   input logic 	      iom_out,
   input logic [1:0]  ps,
   input logic 	      il,
   input logic [3:0]  mx,
   input logic 	      rw,
   input logic [11:0] rs,
   input 	      fs_t fs,
   input logic [15:0] pca,
   input logic [15:0] ins,
   input logic [15:0] abus,
   input logic [15:0] bdat,
   input logic [15:0] fbus,
   input logic [1:0]  nz,
   input logic [15:0] dbus,
   input logic [15:0] bbus            
   );

   `xcheck(a_out);
   `xcheck(d_in);
   `xcheck(d_out);
   `xcheck(io_in);
   `xcheck(wen_out);
   `xcheck(iom_out);
   `xcheck(ps);
   `xcheck(il);
   `xcheck(mx);
   `xcheck(rw);
   `xcheck(rs);
   `xcheck(fs);
   `xcheck(pca);
   `xcheck(ins);
   `xcheck(abus);
   `xcheck(bdat);
   `xcheck(fbus);
   `xcheck(nz);
   `xcheck(dbus);
   `xcheck(bbus);
   
   covergroup cg_opcodes @(posedge clk iff il);
      coverpoint d_in[15:9]
	{ 
	 bins opcodes[] = {MOVA, INC, ADD, MUL, SRA, SUB, DEC, SLA, AND, OR, XOR, NOT, MOVB, SHR, SHL,  LDI, ADI, LD, ST, 
BRZ, BRN, JMP, HAL, USR};
      }
   endgroup
   cg_opcodes cg_opcodes_inst = new;    
      
endmodule


`endif //  `ifndef SYNTHESIS
