`include "./jkFlop.sv"

module tb_jk;
   reg j;
   reg k;
   reg r;
   reg clk;

   //always #5 clk = ~clk;

   jk_ff    jk0 ( .j(j),
                  .k(k),
                  .clk(clk),
				  .r(r),
                  .q(q));

   initial begin
   	  clk = 0;
	  #10 
      j = 0;
      k = 0;
	  r = 0;
	  #10
	  clk = 1;
	  
	  #10 
	  clk = 0;
      j = 1;
      k = 1;
	  r = 0;
	  #10
	  clk = 1;
	  
	  #10 
	  clk = 0;
      j = 1;
      k = 1;
	  r = 1;
	  #10
	  clk = 1;
	  
	  #10 
	  clk = 0;
      j = 0;
      k = 0;
	  r = 0;
	  #10
	  clk = 1;
	  
	  #10 
	  clk = 0;
      j = 0;
      k = 1;
	  r = 0;
	  #10
	  clk = 1;
	  
	  
	  #10 
	  clk = 0;
      j = 0;
      k = 0;
	  r = 0;
	  #10
	  clk = 1;
	  
	  #10 
	  clk = 0;
      j = 1;
      k = 1;
	  r = 0;
	  #10
	  clk = 1;
	  
	  #10 
	  clk = 0;
      j = 1;
      k = 1;
	  r = 0;
	  #10
	  clk = 1;
	  
	  #10 
	  clk = 0;
      j = 1;
      k = 1;
	  r = 1;
	  #10
	  clk = 1;
	  
	  #10 
	  clk = 0;
      j = 1;
      k = 1;
	  r = 1;
	  #10
	  clk = 1;
	  
	  #10 
	  clk = 0;
      j = 1;
      k = 0;
	  r = 1;
	  #10
	  clk = 1;
	  
	  #10 
	  clk = 0;
      j = 0;
      k = 0;
	  r = 0;
	  #10
	  clk = 1;
	  
      #20 $finish;
   end

   initial
      $monitor ("j=%0d k=%0d q=%0d clk=%b r=%b", j, k, q, clk, r);
endmodule