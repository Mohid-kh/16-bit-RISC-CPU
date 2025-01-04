`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

module ir_svamod
  (
   input logic 	      clk,
   input logic 	      rst_n,
   input logic 	      il_in,
   input logic [15:0] ins_in,
   input logic [15:0] ins_out,
   input logic [15:0] ir_r     
   );

   `xcheck(il_in);
   `xcheck(ins_in);
   `xcheck(ins_out);
   `xcheck(ir_r);               
   `resetcheck(ir_r, 0);

`ifdef design_top_is_mycpu
   
   property f_ins_load;
     @(posedge clk ) disable iff (rst_n == '0)
       il_in |=> (ins_out == $past(ins_in));
   endproperty

   af_ins_load: assert property(f_ins_load) else $error("ins_out does not show ins_in after il_in == '1");
   cf_ins_load: cover property(f_ins_load);

   property f_ins_hold;
     @(posedge clk ) disable iff (rst_n == '0)
       !il_in |=> (ins_out == $past(ins_out));
   endproperty

   af_ins_hold: assert property(f_ins_hold) else $error("ins_out changed when il_in == '0");
   cf_ins_hold: cover property(f_ins_hold);
   
`endif 

endmodule


`endif
