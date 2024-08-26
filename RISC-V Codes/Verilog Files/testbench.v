`timescale 1ns / 1ps
`ifdef PRE_SYNTH_SIM
   `include "rvmyth_pri.v"
   `include "clk_gate.v"
`endif


module testbench;

reg 		clk_pri;
wire [9:0] 	OUT;
reg  		reset;

rvmyth RISCV 
(
      .OUT(OUT),
      .clk_pri(clk_pri),
      .reset(reset)
);

   always
    #10  clk_pri  = ~ clk_pri;

   initial begin
      clk_pri = 0;
      reset = 0;
      
      #20 reset = 1;
      #100 reset = 0;
   end
   
 initial begin
`ifdef PRE_SYNTH_SIM
      $dumpfile("pre_synth_sim.vcd");
`endif
      $dumpvars(0, testbench);
   end
 
 initial begin
  #20000
      $finish;
   end
   
endmodule
