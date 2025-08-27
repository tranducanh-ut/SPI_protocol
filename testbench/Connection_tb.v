`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2025 11:14:29 AM
// Design Name: 
// Module Name: Connection_tb
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


module Connection_tb;

    reg clk;
    reg start_bit;
    reg [7:0] data_sent;
    reg MODE;  
    
    wire [7:0] data_received;
    wire [7:0] data_from_master;

    // Kết nối module chính
    Connection uut (
        .clk(clk),
        .start_bit(start_bit),
        .data_sent(data_sent),
        .MODE(MODE),
        .data_received(data_received),
        .data_from_master(data_from_master)
    );

    // Tạo xung clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
// Monitor quan sát các tín hiệu chính
    initial begin
        $monitor("TIME %t: clk=%b , start_bit=%b , MODE=%b , data_sent=%b , data_received=%b , data_from_master=%b",
                 $time, clk, start_bit, MODE, data_sent, data_received, data_from_master);
    end

   
    initial begin
     #10  data_sent = 8'b10101011;
    #5 start_bit = 1;
    MODE = 1; 
 
    #500; // Chạy chế độ READ một thời gian
    
    // Chuyển sang chế độ WRITE
    start_bit = 0;
    #10;
    start_bit = 1;
    MODE = 0;

   

        
     
#1000
      
        $finish;
    end

    
endmodule
