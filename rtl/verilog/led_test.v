
//`define SIMULATION
`define PACKED
`define GEN_BLK
`timescale 1ns/10ps
module led_test #(parameter NUM_SEG=6)
   (
    input 		   clk, rst_n, btn,
    input [3:0] 	   sw,
    output [8*NUM_SEG-1:0] seg
    );

`include "myPkg.v"
   reg 			   btn_dly;
   wire 		   catch = ~btn & btn_dly;
   always@(posedge clk)
     btn_dly <= btn;

   reg [3:0] 		   sw_r[0:NUM_SEG-1]; //packed array

   integer 		   i;
   always@(posedge clk)
     if(catch)begin
	sw_r[0] <= sw;
	for(i=0; i<NUM_SEG-1; i=i+1)begin
	   sw_r[i+1] <= sw_r[i];
	end
     end
   // part selection works for generate block but not always block. hmm!!
`ifdef GEN_BLK   
   genvar k;
   generate
      for(k=0; k<NUM_SEG-1; k=k+1) begin:SEG
	 assign seg[k*8+7:k*8] = seg_drv(sw_r[k]);
	 //assign seg[k*8+:8] = seg_drv(sw_r[k]);
      end
   endgenerate
`else
   integer j;
   always@(*)
     for(j=0; j<NUM_SEG; j=j+1)begin
   	seg[j*8+7 : j*8] = seg_drv(sw_r[j]);
   	//seg[j*8 +: 8] = seg_drv(sw_r[j]);
     end
   
`endif
   
   
endmodule // led

















