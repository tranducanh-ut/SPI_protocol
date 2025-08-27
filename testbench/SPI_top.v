`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 01:38:12 PM
// Design Name: 
// Module Name: SPI_top
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


module SPI_top;
reg clk;
reg [7:0] input_data;
reg MISO;
wire MOSI;
wire SS;
reg start_bit;
wire internal_clk;
SPI uut(.clk(clk),.input_data(input_data),.MISO(MISO),.MOSI(MOSI),.SS(SS),.start_bit(start_bit),. internal_clk( internal_clk));
initial begin
$monitor("AT TIME %t: clk=%b,input_data=%b,MISO=%b,MOSI=%b,SS=%b,start_bit=%b, internal_clk=%b",$time,clk,input_data,MISO,MOSI,SS,start_bit, internal_clk);

end
initial begin
#5 clk<=0;
 forever #5 clk<=~clk;
 end
 initial begin
 #5 start_bit<=0;
#5 input_data<= 8'b00110010; start_bit<=1;
#2000 input_data<= 8'b10101010; 
#1000
$finish;
end

    
endmodule
