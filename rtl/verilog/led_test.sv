
import myPkg::seg_drv;
//`define SIMULATION
//`define PACKED
module led_test #(parameter NUM_SEG=6)
   (
    input 		    clk, rst_n, btn,
    input [3:0] 	    sw,
`ifdef PACKED
    output logic [0:NUM_SEG-1][7:0] seg
`else
    output logic [7:0] 	    seg[0:NUM_SEG-1]
`endif
    );

   logic 		    btn_dly, catch;
   always_ff@(posedge clk)
     btn_dly <= btn;
   assign catch = ~btn & btn_dly;

`ifdef PACKED
   logic [0:NUM_SEG-1] [3:0] 	    sw_r; //packed array
   always_ff@(posedge clk)
     if(catch)begin
	sw_r <= {sw,sw_r[0:$high(sw_r)-1]};
     end
`else
   logic [3:0] 	     sw_r[0:NUM_SEG-1]; //unpacked array
   always_ff@(posedge clk)
     if(catch)begin
	sw_r[0] <= sw;
	sw_r[1:$high(sw_r)] <= sw_r[0:$high(sw_r)-1];
     end
`endif
`ifdef GEN_BLK
   genvar 	i;
   generate
      for(i=0; i<NUM_SEG; i++) begin : gen // the name "gen "is necessary
	 assign  seg[i] = seg_drv(sw_r[i]);
      end
   endgenerate
`else
   //always_comb
   always@(*)
     for(int i=0; i<NUM_SEG; i++)
       seg[i] = seg_drv(sw_r[i]);
`endif // !`ifdef GEN_BLK
   
   //assign seg[i] = seg_drv(sw_r[i]);
   //assign seg[0] = seg_drv(sw_r[0]);
   //assign seg[1] = seg_drv(sw_r[1]);
   //assign seg[2] = seg_drv(sw_r[2]);
   // packed array
   //bit [7:0] packed_array = 8'hAA; 
   // unpacked array
   //reg 	     unpacked_array [7:0] = '{0,0,0,0,0,0,0,1};
endmodule // led

