`include "./tFlop.sv"

module tFlop_tb;

   reg t;
   reg r;
   reg clk;
   
   wire q;
   
   integer i;
   
   tFlop uut (t, clk, r, q);
   
   initial begin
   	  r = 1;
   	  clk = 0;
	  #10 
      t = 0;
	  r = 1;
	  #10
	  clk = 1;
	  
	  r = 1;
   	  clk = 0;
	  #10 
      t = 0;
	  r = 1;
	  #10
	  clk = 1;
	  
   end
   
   initial
      $monitor ("t = %b q=%b clr=%b clk=%b", t, q, r, clk);

endmodule