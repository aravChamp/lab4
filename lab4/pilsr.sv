module pilsr(
	input wire c,
	input wire [3:0] ParallelIn,
	input wire load,
	input wire ShiftEn,
	input wire ShiftIn,
	input wire R,
	output wire [3:0] RegContent,
	output wire ShiftOut,
	output wire clk);
	
	wire [3:0] D;
	
	//wire clk;
	
	assign clk = c & (ShiftEn | load);
	
	mux2 m0 (ShiftIn, ParallelIn[0], load, D[0]);
	syncDFlop df0 (D[0], clk, R, RegContent[0]);
	
	mux2 m1 (RegContent[0], ParallelIn[1], load, D[1]);
	syncDFlop df1 (D[1], clk, R, RegContent[1]);
	
	mux2 m2 (RegContent[1], ParallelIn[2], load, D[2]);
	syncDFlop df2 (D[2], clk, R, RegContent[2]);
	
	mux2 m3 (RegContent[2], ParallelIn[3], load, D[3]);
	syncDFlop df3 (D[3], clk, R, RegContent[3]);
	
	assign ShiftOut = RegContent[3];
	
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

module mux2 #(parameter WIDTH = 1)

	(input wire [WIDTH-1:0] d0, d1,
	input wire s,
	output wire [WIDTH-1:0] y);
	
	assign y = s ? d1 : d0;
	
endmodule
