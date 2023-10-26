module syncReg4(
	input wire [3:0] D,
	input wire clk,
	input wire R,
	output wire [3:0] Q);

	syncDFlop df0 (D[0], clk, R, Q[0]);
	syncDFlop df1 (D[1], clk, R, Q[1]);
	syncDFlop df2 (D[2], clk, R, Q[2]);
	syncDFlop df3 (D[3], clk, R, Q[3]);
   
endmodule

module syncDFlop(
	input D,
	input clk, 
	input sync_reset,
	output reg Q);
	
	always @(posedge clk) 
	begin
 		if(sync_reset==1'b1)
  			Q <= 1'b0; 
 		else 
  			Q <= D; 
	end 

endmodule