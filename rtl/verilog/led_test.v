
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
   always@(posedge clk, negedge rst_n)
     if(!rst_n)
       for(i=0; i<NUM_SEG-1; i=i+1)begin
	  sw_r[i] <= 0;
       end
     else
       if(catch)begin
	  sw_r[0] <= sw;
	  for(i=0; i<NUM_SEG-1; i=i+1)begin
	     sw_r[i+1] <= sw_r[i];
	  end
       end

   genvar k;
   generate
      for(k=0; k<NUM_SEG; k=k+1) begin:SEG
	 assign seg[k*8+:8] = seg_drv(sw_r[k]);
      end
   endgenerate
endmodule // led_test

 

















