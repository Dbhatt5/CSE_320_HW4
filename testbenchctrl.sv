// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module testctrl ();
 parameter N = 4;
  
  //inputs to reg
  reg CLK,Start,Reset,M,K;
  
  //outputs to wire
  wire Load,Rshift,AddRshift,Cm,Done;
  
  initial begin
    $monitor("Load=%d,Rshift=%d,AddRshift=%d,Cm=%d,Done=%d\n",$time,Load,Rshift,AddRshift,Cm,Done );
		 end
  
  always @(*) begin
     #100 CLK <= ~CLK
  end
  
  initial begin
    #100 CLK=1'b0, Start=1'b0, Reset=1'b1,M = 1'b0,K=1'b0;
    @(negedge CLK),Start=1'b1, Reset=1'b0,M = 1'b0,K=1'b0;
    @(negedge CLK),Start=1'b1, Reset=1'b0,M = 1'b1,K=1'b0;
    @(negedge CLK),Start=1'b1, Reset=1'b0,M = 1'b0,K=1'b1;
    @(negedge CLK),Start=1'b1, Reset=1'b0,M = 1'b1,K=1'b1;
    @(negedge CLK),Start=1'b1, Reset=1'b0,M = 1'b0,K=1'b1;
    @(negedge CLK),Start=1'b1, Reset=1'b0,M = 1'b1,K=1'b1;
    @(negedge CLK),Start=1'b1, Reset=1'b0,M = 1'b0,K=1'b0;
    
  end
endmodule
     
       
 
 