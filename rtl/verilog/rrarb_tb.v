module rrarb_tb (/*AUTOARG*/) ;

   localparam PERIOD = 10;
   wire [1:0]		grant01;			// From dut of rrarb.v
   wire [1:0]		grant02;			// From dut of rrarb.v
   reg 			clk=0, reset=1;
   reg [1:0] 		request;
   task automatic request_tsk;
      input id;
      begin
	 while($random == 0) @(posedge clk);
	 request[id] = 1'b1;
	 $display("request ID: %b", id);
	 while(grant[id] == 0) @(clk);
	 $display("Got granted ID: %b", id); 
	 request[id] = 1'b0;
      end
   endtask // request_tsk

   initial begin
      repeat(2)@(posedge clk);
      reset = 0;
      repeat(2)@(posedge clk);
      repeat(5) begin
	 fork
	    request_tsk(0) ;
	    request_tsk(1) ;
	 join
      end
      $finish;
   end

   //   always@(posedge clk)
   //     $display("@%4t request: %2b grant: %2b", $time, request, grant);
   
   initial begin
      clk <= 1'b1;
      forever #(PERIOD/2) clk <= ~clk;
   end
   rrarb dut02
     (
      // Outputs
      .grant			(grant02),
      // Inputs
      .request			(request[1:0]),
      .reset			(reset),
      .clk			(clk));
endmodule // rrarb_tb
