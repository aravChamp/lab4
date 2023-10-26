module dfCounter_tb;
	reg clk;
	reg clr;
	reg en;
	wire [7:0] q;
	
	integer i;
	
	dfCounter uut (clk, clr, en, q);
	
	initial begin
	
	#10 clr = 1;
	
	#10 clr = 0; en = 1;
	
	
	for (i = 0; i < 256; i = i + 1) begin
			
		#10 clk = 0;
			
		#10 clk = 1;
			
		end
	
	end

	initial
      $monitor ("Q=%d clr=%b en=%b clk=%b", q, clr, en, clk);
	

endmodule


module dfCounter(
		input wire clk,
		input wire clr,
		input wire en,
		output wire [7:0] q);
		
		wire [7:0] qn;
		
		assign qn = ~q;
		
		assign c = clk & en;
		
		asyncDFlop df0 (qn[0], c, clr, q[0]);
		
		asyncDFlop df1 (qn[1], qn[0], clr, q[1]);
		
		asyncDFlop df2 (qn[2], qn[1], clr, q[2]);
		
		asyncDFlop df3 (qn[3], qn[2], clr, q[3]);
		
		asyncDFlop df4 (qn[4], qn[3], clr, q[4]);
		
		asyncDFlop df5 (qn[5], qn[4], clr, q[5]);
		
		asyncDFlop df6 (qn[6], qn[5], clr, q[6]);
		
		asyncDFlop df7 (qn[7], qn[6], clr, q[7]);
		
endmodule


module asyncDFlop(
	input wire D,
	input wire clk, 
	input wire r,
	output reg Q);
	
	always @(posedge clk or posedge r) 
	begin
 		if(r==1'b1)
  			Q <= 1'b0; 
 		else 
  			Q <= D; 
	end 

endmodule