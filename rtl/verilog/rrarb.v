module rrarb 
  (
   input [1:0] 	    request,
   output reg [1:0] grant,
   input 	    reset,
   input 	    clk
   );

   reg 		    last_winner;
   always@(posedge clk) begin
      grant <= 2'b00;
      if(reset)
	last_winner <= 1'b0;
      else
	if(request != 2'b00) begin:find_winner
	   reg winner;
	   case(request)
	     2'b01: winner = 0;
	     2'b10: winner = 1;
	     2'b11: winner = last_winner+1;
	   endcase // case (request)
	   grant[winner] <= 1'b1;
	   last_winner <= winner;
	end:find_winner
   end
   
endmodule // rrarb
