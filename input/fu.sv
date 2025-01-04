`include "mycpu.svh"

import mycpu_pkg::*;

module fu
  (
   input logic [15:0]  a_in,		// R[SA] value received (usr)
   input logic [15:0]  b_in, 
   input 	       fs_t fs_in, 
   output logic [15:0] f_out,		// R[DR] value sent (usr)
   output logic [1:0]  nz_out
   );
   
  logic [15:0] alu;   // alu output
  logic [15:0] mul;   // mul output
  logic [15:0] usr;   // usr output
  logic signed [31:0] mab;   // A * B result

 // logic [15:0] reg_A;  // source reg A
 // logic [15:0] reg_b;  // source reg B
  logic [15:0] DR;     // dest. reg.

  always_comb
    begin: ALU_LGC     	// alu (handle all cases except fmul and fusr)
     case(fs_in)   
      FMOVA   :         // move A
        alu = a_in; 
      FINC    :         // incr A
        alu = a_in + 1;
      FADD    :		// A + B
	alu = a_in + b_in;	
      FSRA    :         // shift right arithmetic (signed)
        alu = $signed(a_in)>>>(b_in[2:0]+1);
      FSUB    :		// A - B
        alu = a_in - b_in;
      FDEC    :		// decr A
	alu = a_in - 1;
      FSLA    :         // shift left arithmetic (signed)
	alu = $signed(a_in)<<<(b_in[2:0]+1);
      FAND    :		// bitwise AND
	alu = a_in & b_in;
      FOR     :		// bitwise OR
	alu = a_in | b_in;
      FXOR    :		// bitwise XOR
	alu = a_in ^ b_in;
      FNOT    :		// bitwise NOT
	alu = ~a_in;
      FMOVB   :		// move B
	alu = b_in;
      FSHR    :		// shift right
	alu = b_in >> 1;
      FSHL    :		// shift left
	alu = b_in << 1;
      default :         // fmul/fusr selected
        alu = '0;
      endcase
    end: ALU_LGC
  
  always_comb 		
   begin : MUL_LGC	// mul logic
   mab = $signed(a_in) * $signed(b_in);
    if(fs_in == FMUL)
      begin : sgn_mul
      if(mab > $signed(16'h7fff))	  // clipped to max (d32767)
       mul = 16'h7FFF;
      else if(mab < $signed(16'h8000))    // clipped to min (d-32768)
       mul = $signed(16'h8000); 
      else
       mul = $unsigned(mab);
      end   : sgn_mul
    else
      mul = '0;
   end   : MUL_LGC

  always_comb                                    // user code (M = 2)
   begin : USR_LGC	
   DR = '0;			
   if(fs_in == FUSR) begin
    if($signed(a_in) >= 0)			// pos 2's compliment
     DR = a_in;
    else					// neg 2's compliment
     DR = {1'b1, a_in[14:0]};
//    if(a_in == 16'h8000)
//     DR = a_in;
   usr = DR;
   end
   else 
    usr = '0;
   end   : USR_LGC 
  
  always_comb				         // output logic
   begin : fout
   f_out = alu | mul | usr;
   if(f_out == '0)     // zero op
    nz_out[0] = 1;
   else
    nz_out[0] = 0;
   if(f_out[15] == 1)  // neg num
    nz_out[1] = 1;
   else
    nz_out[1] = 0;     
   end   : fout

endmodule
