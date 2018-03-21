
import myPkg::seg_drv;

//`define SIMULATION

module led_test
  (
   input 	      clk, rst_n, btn,
   input logic [3:0]  sw,
   //output logic [0:2][7:0] seg
   output logic [7:0] seg[0:2]
   );

   logic 	      btn_dly, catch;
   always_ff@(posedge clk)
     btn_dly <= btn;
   assign catch = ~btn & btn_dly;
   //`define PACKED
`ifdef PACKED
   logic [0:2] [3:0]  sw_r; //packed array
   always_ff@(posedge clk)
     if(catch)begin
	sw_r <= {sw,sw_r[0:1]};
     end
`else
   logic [3:0] 	     sw_r[0:2]; //unpacked array
   always_ff@(posedge clk)
     if(catch)begin
	sw_r[0] <= sw;
	sw_r[1:2] <= sw_r[0:1];
     end
`endif
   //genvar 	i;
   always_comb
     for(int i=0;i<3;i++)
       seg[i] = seg_drv(sw_r[i]);
   //assign seg[i] = seg_drv(sw_r[i]);
   //assign seg[0] = seg_drv(sw_r[0]);
   //assign seg[1] = seg_drv(sw_r[1]);
   //assign seg[2] = seg_drv(sw_r[2]);
   // packed array
   //bit [7:0] packed_array = 8'hAA; 
   // unpacked array
   //reg 	     unpacked_array [7:0] = '{0,0,0,0,0,0,0,1};
endmodule // led

