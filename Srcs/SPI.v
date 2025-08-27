`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 12:57:07 PM
// Design Name: 
// Module Name: SPI
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SPI(
input wire [7:0] input_data,
input wire clk,
input wire  MISO,
output reg  MOSI,
output reg SS=1,
input wire start_bit,
output  reg internal_clk=0,
 input wire MODE,
 output reg[7:0] storage_master=8'b000000000


    );
   reg[2:0] count=7;
    
    localparam READ =1'b1;
    localparam WRITE =1'b0;
   
   
 always @(*) begin
 
 SS<=~start_bit;
 
 end
   
   always @(posedge clk)begin
  if(SS==0) internal_clk<=~internal_clk;
  else internal_clk<=0; 
   end
   
    always @(posedge internal_clk) begin
    // read mode
  
    case(MODE)
    READ:begin
    if(SS==0) begin
    MOSI<=input_data[count];
   
    if(count ==0) begin
    internal_clk<=0;
    count<=7;
  
    end
      else count<=count-1;
     end
   
   
    end
    // write mode
     WRITE: begin
    if(SS==0) begin
  storage_master[count]<=MISO;
    if(count ==0) begin
    count<=7;
     internal_clk<=0;
    end
    else count<=count-1;
    end
    end
    endcase
   end
   
endmodule
