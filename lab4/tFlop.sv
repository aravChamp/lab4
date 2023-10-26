module counter8(
	input wire clk,
	input wire Clear_n,
	input wire Enable,
	output wire [7:0] Q);
	
	assign c = clk & Enable;
	
	tFlop tff0 (1'b1, c, Clear_n, Q[0]);
	
	tFlop tff1 (1'b1, Q[0], Clear_n, Q[1]);
	
	tFlop tff2 (1'b1, Q[1], Clear_n, Q[2]);
	
	tFlop tff3 (1'b1, Q[2], Clear_n, Q[3]);
	
	tFlop tff4 (1'b1, Q[3], Clear_n, Q[4]);
	
	tFlop tff5 (1'b1, Q[4], Clear_n, Q[5]);
	
	tFlop tff6 (1'b1, Q[5], Clear_n, Q[6]);
	
	tFlop tff7 (1'b1, Q[6], Clear_n, Q[7]);

endmodule

module tFlop (
	input wire t,
    input wire clk,
	input wire r,
    output wire q);
	
	jk_ff jkFlop (t, t, clk, r, q);

endmodule


module jk_ff (
	input wire j,
    input wire k,
    input wire clk,
	input wire r,
    output reg q);

   always @ (posedge clk or posedge r)
      case ({j,k,r})
         3'b000 :  q <= q;
         3'b010 :  q <= 0;
         3'b100 :  q <= 1;
         3'b110 :  q <= ~q;
		 3'b001 :  q <= 0;
		 3'b111 :  q <= 0;
      endcase
endmodule