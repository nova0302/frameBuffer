//+++++++++++++++++++++++++++++++++++++++++++++++++
// Simple Program with ports
//+++++++++++++++++++++++++++++++++++++++++++++++++
//program simple(input clk, led0, output logic rst_n);
//   //=================================================
//   // Initial block inside program block
//   //=================================================
//   initial begin
//     $monitor("@%0tns led0 = %0d",$time, led0);
//     rst_n = 0;
//     #20 rst_n = 1;
//     @ (posedge clk);
//     repeat (100) @ (posedge clk);
//     $finish;
//  end
//endprogram

`include "defines.sv"

module   led_test_tb;

   timeunit 1ns;
   timeprecision 1ns;

   localparam PERIOD = 10;
   localparam NUM_COUNT = 5;


   logic clk, rst_n, led0;

   initial begin
      clk <= 1'b1;
      forever #(PERIOD/2) clk <= ~clk;
   end

   always @(posedge clk)
     $monitor("@%0tns count=%h led0 = %0d",$time, dut.count_r, led0);

   initial begin
      rst_n = 0;
      #20 rst_n = 1;
      @ (posedge clk);
      repeat (30) @ (posedge clk);
      $finish;
   end
`ifdef SIMULATION
   led_test  dut(.*);
`else
   led_test #(.NUM_COUNT(NUM_COUNT)) dut(.*);
`endif



endmodule // led_test_tb
