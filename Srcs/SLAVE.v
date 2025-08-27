`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2025 02:15:12 PM
// Design Name: 
// Module Name: SLAVE
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


module SLAVE(
input wire internal_clk,
input wire input_data,
output reg output_data,
input wire enable,
output  reg [7:0] storage_slave,
input wire MODE

    );
    localparam READ=0;
    localparam WRITE=1;
    reg[2:0] count=7;
   
    always @(negedge  internal_clk)begin
    if(enable==0)begin
    case(MODE)
    WRITE: begin 
    storage_slave[7-count] <= input_data;
                if (count == 0) count <= 7;
                else count <= count - 1;
    end
    READ:begin
   output_data <= storage_slave[7-count];
                if (count == 0) count <= 7;
                else count <= count - 1;
    end
    endcase
    
    end
    end
endmodule
