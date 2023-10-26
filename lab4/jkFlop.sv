module jk_ff (
	input wire j,
    input wire k,
    input wire clk,
	input wire r,
    output reg q);

   always @ (posedge clk)
      case ({j,k,r})
         3'b000 :  q <= q;
         3'b010 :  q <= 0;
         3'b100 :  q <= 1;
         3'b110 :  q <= ~q;
		 3'b111 : q <= 0;
      endcase
endmodule