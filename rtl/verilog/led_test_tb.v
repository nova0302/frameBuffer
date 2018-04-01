//+++++++++++++++++++++++++++++++++++++++++++++++++
// Simple Program with ports
//+++++++++++++++++++++++++++++++++++++++++++++++++
//program simple(input clk, led, output logic rst_n);
//   //=================================================
//   // Initial block inside program block
//   //=================================================
//   initial begin
//     $monitor("@%0tns led = %0d",$time, led);
//     rst_n = 0;
//     #20 rst_n = 1;
//     @ (posedge clk);
//     repeat (100) @ (posedge clk);
//     $finish;
//  end
//endprogram

//`include "defines.sv"
`define GATE_SIM

`timescale 1ns/10ps
module   led_test_tb;
`include "myPkg.v"
   localparam PERIOD = 10;
   localparam NUM_SEG = 6;

   reg clk, rst_n=1'b0, btn=1'b1;
   reg [3:0] sw = 4'd0;
   //reg [7:0] seg0, seg1, seg2, seg3, seg4, seg5;
   wire [NUM_SEG*8-1:0] seg;
   integer 		i;
   task t_drv (input [3:0] isw);
      begin
	 @(clk) btn <= 1'b0;
	 @(clk) sw  <= isw;
	 @(clk) btn <= 1'b1;
      end
   endtask // t_drv
   
   initial begin
      @(clk) rst_n <= 1'b1;
      for(i=0; i<10; i=i+1)begin
	 t_drv(i); 
      end
      repeat(5)@(clk);
      $finish;
   end
   always@(clk)
     $display("@%4t sw:%h, seg0:%h, seg1:%h, seg2:%h, seg3:%h, seg4:%h, seg5:%h",
	      $time, 
	      sw,
	      inv_seg_drv(seg[8*0+7:8*0]), 
	      inv_seg_drv(seg[8*1+7:8*1]), 
	      inv_seg_drv(seg[8*2+7:8*2]), 
	      inv_seg_drv(seg[8*3+7:8*3]), 
	      inv_seg_drv(seg[8*4+7:8*4]), 
	      inv_seg_drv(seg[8*5+7:8*5]));
   
   initial begin
      clk <= 1'b1;
      forever #(PERIOD/2) clk <= ~clk;
   end

`ifdef GATE_SIM
   //led_test  dut(.*);
   led_test dut
     (
      .clk    (clk  )
      ,.rst_n  (rst_n)
      ,.btn    (btn  )
      ,.sw     (sw   )
      ,.seg   (seg )	);
`else
   led_test #(.NUM_SEG(NUM_SEG)) dut(.*);
`endif

   
   /*
    initial begin
    for( sw=0; sw<10; sw++)begin
    //$display("sw:%0d sw:%4d", sw, inv_seg_drv(seg_drv(sw)));
    $display("sw:%0d seg:%0b", sw, seg_drv(sw));
      end
    #50;
    $finish;
   end
    */
   
   /*
    initial begin
    repeat(2) @(posedge clk);
    rst_n <= 1'b1;
    for(int i=0; i<4; i++) begin
    @(posedge clk);
    sw = sw+1;
    btn = 1'b0;
    @(posedge clk);
    btn = 1'b1;
      end
    repeat(3) @(posedge clk);
    $finish;
   end
    
    always@(posedge clk)
    $display("@%5t btn:%0b sw:%0x seg0:%0x seg1:%0x seg2:%0x", 
    $time, btn, sw, 
    inv_seg_drv(seg[0]), 
    inv_seg_drv(seg[1]), 
    inv_seg_drv(seg[2]),  );
    
    
    */

endmodule // led_test_tb

//logic [15:0] buffer[0:15];
//   int 		counter, counter_n;
//   logic 	counterEnb;
//   typedef enum {Add, Sub, Mul, Div}op_enum;
//   op_enum state, nState;
//   always_ff@(posedge clk)
//     buffer <= {$random,buffer[0:14]};


//always @(posedge clk)
//  $monitor("@%0tns count=%h led = %0d",$time, dut.count_r, led);

//initial begin
//   $display("%0s",op.name );
//   op = Sub;
//   $display("%0s",op.name );
//   rst_n = 0;
//   #20 rst_n = 1;
//   @ (posedge clk);
//   repeat (3) @ (posedge clk);
//   $finish;
//end

//always @(posedge clk, negedge rst_n) begin
//if(!rst_n) begin
//	 state <= Add;
//	 counter <= 0;
//end else begin
//	 state <= nState;
//	 counter <= counter_n;
//end
//$display("@%5tns buffer[0]=%6d buffer[1]=%6d buffer[2]=%6d buffer[3]=%6d", $time, buffer[0], buffer[1], buffer[2], buffer[3]);
//$display("@%0tns buffer[0]=%0x buffer[1]=%0x buffer[2]=%0x buffer[3]=%0x", $time, buffer[0], buffer[1], buffer[2], buffer[3]);
//end
//always@(posedge clk)
//  $display("@%5t: counter:%3h state:%s", $time, counter, state.name());
//always_comb begin
//   nState = state;
//   counter_n = counter;
//   case (state)
//	Add: begin
//	   counter_n++;
//	   if(counter == 2) begin
//	      counter_n = 0;
//	      nState = Sub;
//	   end 
//	end
//	Sub: begin
//	   counter_n++;
//	   if(counter == 3) begin
//	      counter_n = 0;
//	      nState = Mul;
//	   end 
//	end
//	Mul: begin
//	   counter_n++;
//	   if(counter == 5) begin
//	      counter_n = 0;
//	      nState = Div;
//	   end 
//	end
//	Div: begin
//	   counter_n++;
//	   if(counter == 5) begin
//	      counter_n = 0;
//	      nState = Div;
//	   end 
//	end
//   endcase // case (state)
//end
/*
 initial begin
 $display("$left(seg)      : %0d", $left(seg));
 $display("$right(seg)     : %0d", $right(seg));
 $display("$low(seg)       : %0d", $low(seg));
 $display("$high(seg)      : %0d", $high(seg));
 $display("$dimensions(seg): %0d", $dimensions(seg));
 $finish;
   end
 */
