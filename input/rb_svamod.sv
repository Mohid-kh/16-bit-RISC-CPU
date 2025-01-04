`ifndef SYNTHESIS

`include "mycpu.svh"

import mycpu_pkg::*;

module rb_svamod
  (
   input logic 		   clk,
   input logic 		   rst_n,
   input logic [15:0] 	   d_in,
   input logic 		   rw_in,
   input logic [11:0] 	   rs_in,
   input logic [15:0] 	   a_out,
   input logic [15:0] 	   b_out,
   input logic [7:0][15:0] rb_r,
   input logic [7:0][15:0] hb_r   

   );

   `xcheck(d_in);
   `xcheck(rw_in);
   `xcheck(rs_in);      
   `xcheck(a_out);
   `xcheck(b_out);
   `xcheck(rb_r);
   `xcheck(hb_r);               
   `resetcheck(rb_r, 0);
   `resetcheck(hb_r, 0);

   
   covergroup cg_writes @(posedge clk iff (rw_in && d_in != 0));
      option.per_instance = 1;
      write_address: coverpoint(rs_in[11:8])
	{
	 bins R[] = { [0:7] };
	 bins HR[] = { [8:15] };
      }
      write_data: coverpoint(d_in[3:0])
	{
	 option.goal = 16;
	 bins values[] = { [0:15] };
      }
   endgroup

   covergroup cg_reads @(posedge clk iff ( !rw_in ));
      a_address: coverpoint(rs_in[7:4])
	{
	 bins R[] = { [0:7] };
	 bins HR[] = { [8:15] };
      }
      b_address: coverpoint(rs_in[3:0])
	{
	 bins R[] = { [0:7] };
	 bins HR[] = { [8:15] };
      }
   endgroup
   
   cg_writes cg_writes_1 = new;
   cg_reads cg_reads_1 = new;			 

   /* Remove comments to enable write-read assertion.

    property f_rb_write_read_a;
      logic [3:0] 	   wsel;
      logic [15:0] 	   wdata;
     @(posedge clk) disable iff (rst_n == '0)
       (rw_in, wsel = rs_in[11:8], wdata = d_in) ##1 !(rw_in && (rs_in[11:8] == wsel)) throughout ((rs_in[7:4] == wsel) [-> 1])
	 |-> (a_out == wdata);
   endproperty

   af_rb_write_read_a: assert property(f_rb_write_read_a) else $error("rb: Write-read error on port a_out");

   property f_rb_write_read_b;
      logic [3:0] 	   wsel;
      logic [15:0] 	   wdata;
     @(posedge clk) disable iff (rst_n == '0)
       (rw_in, wsel = rs_in[11:8], wdata = d_in) ##1 !(rw_in && (rs_in[11:8] == wsel)) throughout ((rs_in[3:0] == wsel) [-> 1])
	 |-> (b_out == wdata);
   endproperty // f_rb_write_read_b

   af_rb_write_read_b: assert property(f_rb_write_read_b) else $error("rb: Write-read error on port b_out");   

    */
   
endmodule

`endif
