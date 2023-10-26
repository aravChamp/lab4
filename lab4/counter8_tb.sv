`include "./tFlop.sv"

module counter8_tb;

	reg clk;
	reg Clear_n;
	reg Enable;
	wire [7:0] Q;
	wire [7:0] Qn;
	
	integer i;
	
	counter8 uut (clk, Clear_n, Enable, Q);
	
	assign Qn = ~Q;
	
	initial begin
	
	#10 Clear_n = 1;
	
	#10 Clear_n = 0; Enable = 1;
	
		for (i = 0; i < 256; i = i + 1) begin
			
			#10 clk = 0;
			
			#10 clk = 1;
			
		end
	
	end

	initial
      $monitor ("Q=%b Qn=%d clr=%b en=%b clk=%b", Q, Qn, Clear_n, Enable, clk);

endmodule