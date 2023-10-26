module fsm_tb;
	reg clk;
	reg clr;
	reg en;
	wire [2:0] q;
	wire [7:0] f;
	wire [2:0] result;
	
	fsm uut (clk, en, clr, result);
	
	integer i;
	
	initial begin
	
		#10 clr = 1;
		
		#10 clr = 0; en = 1;
	
		for (i = 0; i < 256; i = i + 1) begin
			
		#10 clk = 0;
			
		#10 clk = 1;
			
		end
		
	end

	initial
      $monitor ("res=%b clr=%b en=%b clk=%b", result, clr, en, clk);

endmodule

module fsm(
	input wire clk, en, clr,
	output reg [2:0] result);
	
	wire c;
	wire r;
	wire [2:0] q;
	wire [7:0] f;
	
	assign c = clk & en;
	
	assign r = clr | f[6];
	
	EightWayDecoder dec (1'b1, q, f);
	
	dfCounter3 count (c, r, en, q);
	
	always @ (clr) begin
	
		result = 3'b000;
		
	end
	
	always @ (posedge c) begin
		case (f)
			8'd0: result = 3'b000;
			8'd1: result = 3'b001;
			8'd2: result = 3'b011;
			8'd4: result = 3'b101;
			8'd8: result = 3'b111;
			8'd16: result = 3'b010;
			default: result = 3'b000;
		endcase	
	end
	
	
endmodule

module dfCounter3(
		input wire clk,
		input wire clr,
		input wire en,
		output wire [2:0] q);
		
		wire [2:0] qn;
		
		assign qn = ~q;
		
		assign c = clk & en;
		
		asyncDFlop df0 (qn[0], c, clr, q[0]);
		
		asyncDFlop df1 (qn[1], qn[0], clr, q[1]);
		
		asyncDFlop df2 (qn[2], qn[1], clr, q[2]);
		
		
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

module EightWayDecoder (A, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire A; 
   input wire [2:0] S;
   output wire [7:0] F;
   
   wire [1:0] B;
   
   TwoWayDecoder premux (.A(A), .S(S[2]), .F(B));
   
   FourWayDecoder himux (.A(B[0]), .S(S[1:0]), .F(F[3:0]));
   FourWayDecoder lomux (.A(B[1]), .S(S[1:0]), .F(F[7:4]));

endmodule

module FourWayDecoder (A, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire A; 
   input wire [1:0] S;
   output wire [3:0] F;
   
   wire [1:0] B;
   
   TwoWayDecoder premux (.A(A), .S(S[1]), .F(B));
   
   TwoWayDecoder himux (.A(B[0]), .S(S[0]), .F(F[1:0]));
   TwoWayDecoder lomux (.A(B[1]), .S(S[0]), .F(F[3:2]));

endmodule

module TwoWayDecoder (A, S, F);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   
   input wire A, S;
   output wire [1:0] F;
   
   wire Sn;
   
   not (Sn, S);
   
   and (F[0], A, Sn);
   and (F[1], A, S);
  
endmodule