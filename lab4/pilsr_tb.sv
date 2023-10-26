`include "./pilsr.sv"

module pilsr_tb;
	
	reg c;
	reg [3:0] parallelIn;
	reg load;
	reg shiftEn;
	reg shiftIn;
	reg r;
	wire [3:0] regContent;
	wire shiftOut;
	wire clk;
	
	pilsr uut (c, parallelIn, load, shiftEn, shiftIn, r, regContent, shiftOut, clk);
	
	integer i;
                
    initial
   
   	   $monitor ("parallelIn = %d, load = %b, shiftEn = %d, shiftIn = %b, regContent = %d, shiftOut = %b, c = %b, r = %b, clk = %b", parallelIn, load, shiftEn, shiftIn, regContent, shiftOut, c, r, clk);
   
    initial begin
   
   		//initial values
		#10
		c = 0;
		parallelIn = 0;
		load = 0;
		shiftEn = 0;
		shiftIn = 0;
		r = 0;
		
		//load 4
		#10
		c = 0;
		parallelIn = 4;
		load = 1;
		shiftEn = 0;
		shiftIn = 0;
		r = 0;
		#10
		c = 1;
		
		//load 5
		#10
		c = 0;
		parallelIn = 5;
		load = 1;
		shiftEn = 0;
		shiftIn = 0;
		r = 0;
		#10
		c = 1;
		
		//dont load 14
		#10
		c = 0;
		parallelIn = 14;
		load = 0;
		shiftEn = 0;
		shiftIn = 0;
		r = 0;
		#10
		c = 1;
		
		//load 7
		#10
		c = 0;
		parallelIn = 7;
		load = 1;
		shiftEn = 0;
		shiftIn = 0;
		r = 0;
		#10
		c = 1;
		
		//do nothing
		#10
		c = 0;
		parallelIn = 0;
		load = 0;
		shiftEn = 0;
		shiftIn = 0;
		r = 0;
		#10
		c = 1;
		
		//shift 7 -> 14
		#10
		c = 0;
		parallelIn = 0;
		load = 0;
		shiftEn = 1;
		shiftIn = 0;
		r = 0;
		#10
		c = 1;
		
		//shift 14 -> 12
		#10
		c = 0;
		parallelIn = 0;
		load = 0;
		shiftEn = 1;
		shiftIn = 0;
		r = 0;
		#10
		c = 1;
		
		//shift 12 -> 9
		#10
		c = 0;
		parallelIn = 0;
		load = 0;
		shiftEn = 1;
		shiftIn = 1;
		r = 0;
		#10
		c = 1;
		
		//RESET
		#10
		c = 0;
		parallelIn = 0;
		load = 0;
		shiftEn = 1;
		shiftIn = 1;
		r = 1;
		#10
		c = 1;
		
		//load 6
		#10
		c = 0;
		parallelIn = 6;
		load = 1;
		shiftEn = 1;
		shiftIn = 0;
		r = 0;
		#10
		c = 1;
		
		//shift 6 -> 13
		#10
		c = 0;
		parallelIn = 6;
		load = 0;
		shiftEn = 1;
		shiftIn = 1;
		r = 0;
		#10
		c = 1;
		
		
   end
   

endmodule