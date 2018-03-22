package myPkg;

   function automatic [3:0]inv_seg_drv;
      input [7:0] 	seg;
      case(seg)
	8'b11000000	 : inv_seg_drv    = 4'h0; //0
	8'b11111001	 : inv_seg_drv    = 4'h1; //1
	8'b10100100	 : inv_seg_drv    = 4'h2; //2
	8'b10110000	 : inv_seg_drv    = 4'h3; //3
	8'b10011001	 : inv_seg_drv    = 4'h4; //4
	8'b10010010	 : inv_seg_drv    = 4'h5; //5
	8'b10000010	 : inv_seg_drv    = 4'h6; //6
	8'b11111000	 : inv_seg_drv    = 4'h7; //7
	8'b10000000	 : inv_seg_drv    = 4'h8; //8
	8'b10011000	 : inv_seg_drv    = 4'h9; //9
	8'b10001000	 : inv_seg_drv    = 4'hA; //9
	8'b10000011	 : inv_seg_drv    = 4'hB; //9
	8'b11000110	 : inv_seg_drv    = 4'hC; //9
	8'b10100001	 : inv_seg_drv    = 4'hD; //9
	8'b10000110	 : inv_seg_drv    = 4'hE; //9
	8'b00001110	 : inv_seg_drv    = 4'hF; //9
	default: inv_seg_drv  = 4'h0; //9
      endcase // case (seg)
   endfunction // inv_seg_drv

   function automatic [7:0] seg_drv;
      input [3:0] 	bcd ;
      case(bcd)
	4'h0 : seg_drv    = 8'b11000000; //0
	4'h1 : seg_drv    = 8'b11111001; //1
	4'h2 : seg_drv    = 8'b10100100; //2
	4'h3 : seg_drv    = 8'b10110000; //3
	4'h4 : seg_drv    = 8'b10011001; //4
	4'h5 : seg_drv    = 8'b10010010; //5
	4'h6 : seg_drv    = 8'b10000010; //6
	4'h7 : seg_drv    = 8'b11111000; //7
	4'h8 : seg_drv    = 8'b10000000; //8
	4'h9 : seg_drv    = 8'b10011000; //9
	4'hA : seg_drv    = 8'b10001000; //9
	4'hB : seg_drv    = 8'b10000011; //9
	4'hC : seg_drv    = 8'b11000110; //9
	4'hD : seg_drv    = 8'b10100001; //9
	4'hE : seg_drv    = 8'b10000110; //9
	4'hF : seg_drv    = 8'b10001110; //9
	default: seg_drv  = 8'b10001110; //9
      endcase // case (bcd)
   endfunction // bcd

endpackage // myPkg
   
