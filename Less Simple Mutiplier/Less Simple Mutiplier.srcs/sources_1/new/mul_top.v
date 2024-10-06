`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 16:00:17
// Design Name: 
// Module Name: mul_top
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


module mul_top(
                clk,
                data_in,
                mrst,
                ready,
                data_out
                );

input clk, mrst;
input [15:0] data_in;

output ready;
output [15:0] data_out;



mul_ctrl MC (
                .clk(clk),
                .mrst(mrst),
                .zerob,
                .loada,
                .loadb,
                .loadp,
                .rstp,
                .decb,
                .ready
            );

mul_data MD (
                .clk(clk),
                .data_in(data_in),
                .loada,
                .loadb,
                .loadp,
                .rstp,
                .decb,
                .zerob,
            );

endmodule
