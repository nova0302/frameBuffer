package myPkg;
   function automatic [3:0]inv_seg_drv;
      input [7:0] 	seg;
      case(seg)
	8'b1100_0000    : inv_seg_drv = 4'd0; //0
	8'b1111_1001    : inv_seg_drv = 4'd1; //1
	8'b1110_0100    : inv_seg_drv = 4'd2; //2
	8'b1011_0000    : inv_seg_drv = 4'd3; //3
	8'b1001_1001    : inv_seg_drv = 4'd4; //4
	8'b1001_0010    : inv_seg_drv = 4'd5; //5
	8'b1000_0011    : inv_seg_drv = 4'd6; //6
	8'b1101_1000    : inv_seg_drv = 4'd7; //7
	8'b1000_0000    : inv_seg_drv = 4'd8; //8
	8'b1001_1000    : inv_seg_drv = 4'd9; //9
	default: inv_seg_drv = 4'd0; //9
      endcase // case (seg)
   endfunction // inv_seg_drv

   function automatic [7:0] seg_drv;
      input [3:0] 	bcd ;
      case(bcd)
	4'd0 : seg_drv    = 8'b11111001; //0
	4'd1 : seg_drv    = 8'b10100100; //1
	4'd2 : seg_drv    = 8'b10110000; //2
	4'd3 : seg_drv    = 8'b10011001; //3
	4'd4 : seg_drv    = 8'b10010010; //4
	4'd5 : seg_drv    = 8'b10000010; //5
	4'd6 : seg_drv    = 8'b11111000; //6
	4'd7 : seg_drv    = 8'b10000000; //7
	4'd8 : seg_drv    = 8'b10011000; //8
	4'd9 : seg_drv    = 8'b10001000; //9
	4'd10 : seg_drv   = 8'b10000011; //9
	4'd11 : seg_drv   = 8'b11000110; //9
	4'd12 : seg_drv   = 8'b10100001; //9
	4'd13 : seg_drv   = 8'b10000110; //9
	4'd14 : seg_drv   = 8'b10001110; //9
	default: seg_drv  = 8'b01000000; //9
      endcase // case (bcd)
   endfunction // bcd

   //function automatic [7:0] seg_drv;
   //   input [3:0] 	bcd ;
   //   case(bcd)
   //	4'd0 : seg_drv   = 8'b1100_0000; //0
   //	4'd1 : seg_drv   = 8'b1111_1001; //1
   //	4'd2 : seg_drv   = 8'b1110_0100; //2
   //	4'd3 : seg_drv   = 8'b1011_0000; //3
   //	4'd4 : seg_drv   = 8'b1001_1001; //4
   //	4'd5 : seg_drv   = 8'b1001_0010; //5
   //	4'd6 : seg_drv   = 8'b1000_0011; //6
   //	4'd7 : seg_drv   = 8'b1101_1000; //7
   //	4'd8 : seg_drv   = 8'b1000_0000; //8
   //	4'd9 : seg_drv   = 8'b1001_1000; //9
   //	default: seg_drv = 8'b0000_0000; //9
   //   endcase // case (bcd)
   //endfunction // bcd

endpackage // myPkg
 
