`include "./register.sv"

module reg_tb;

    syncReg4 uut (d, clk, r, q);
	
	reg [3:0] d;
	reg clk;
	reg r;
	wire [3:0] q;
	
	integer i;
                
    initial
   
   	   $monitor ("d = %d, clk = %b, q = %d, r = %b", d, clk, q, r);
   
   
    initial begin
   
   		r = 0;
		clk = 0;
		d = 0;
   
        for (i = 0; i < 15; i = i + 1) begin
			
			#10 clk = 0; d = i;
			
			#10 clk = 1;
			
		end
		
		#10 r = 1; clk = 0;
		
		#10 clk = 1; 
		
		#10 r = 0;
		
   end
   

endmodule