// Code your design here
// Code your design here

  `define S0 2'b00;
  `define S1 2'b01;
  `define S2 2'b10;
  `define S3 2'b11;

module MultC_CTRL (CLK, Start,Reset,M, K, Product, Done,AddRshift,Cm,Rshift);
  
input CLK;
input Start;
input Reset;
input M;
input K;

  
output reg Load,Rshift,AddRshift,Cm,Done;
  
//output wire[2:0] state_out;
//output wire[2:0] nextstate_out;
  
  reg[2:0] PS,NS;
  
  
  //assign state_out = PS;
 // assign nextState_out=NS;
    
    always @(posedge CLK)
      begin
        if(Reset) begin
          PS <= `S0;
        end
        else begin
          PS<=NS;
        end
      end
        
  
  
  //control logic
  always @(*)
    begin
  CLK = 1'b0;
  Start = 1'b0;
  Reset = 1'b0;
   M = 1'b0;
   K = 1'b0;
  Cm = 1'b0;
  
    case (PS)
      `S0 : begin
        if(Start == 1) begin
          Load = 1'b1;
          NS = `S1;
        end
        else begin
          NS = `S0;
      end
      end //end os S0
      
      `S1 : begin
        if(M == 1) begin
        
          AddRshift = 1'b1;
        end
        else begin
          Rshift = 1'b1;
      end
     
     
        if(K == 1) begin
        Cm = 1'b0;
        NS = `S2;
       Done = 1'b1;
      end
      end//end of S1
      
 `S2 : begin
   Done = 1'b0;
   NS = `S2;
 end //end of S2
      
    endcase //case end
    end //always end 
endmodule //end of module
      
           
          
        
  