`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2025 08:37:40 PM
// Design Name: 
// Module Name: Connection
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


module Connection(
 input wire clk,
    input wire start_bit,
    input wire [7:0] data_sent,
    input wire MODE,
    output wire [7:0] data_received,     
    output wire [7:0] data_from_master   
    );
  
     
  wire MOSI_line;
    wire SS_line;
    wire internal_clk_line;
    wire MISO_line;                      

    SPI spi_master (
        .clk(clk),
        .start_bit(start_bit),
        .input_data(data_sent),
        .MODE(MODE),
        .MOSI(MOSI_line),
        .SS(SS_line),
        .MISO(MISO_line),                
        .internal_clk(internal_clk_line),
        .storage_master(data_from_master)
    );

   SLAVE spi_slave (
        .internal_clk(internal_clk_line),
        .input_data(MOSI_line),
        .enable(SS_line),
        .MODE(MODE),
        .storage_slave(data_received),
        .output_data(MISO_line)
    );
endmodule
