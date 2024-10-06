`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 16:00:17
// Design Name: 
// Module Name: mul_data
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


module mul_data(
                clk,
                data_in,
                loada,
                loadb,
                loadp,
                rstp,
                decb,
                zerob,
                );

input clk, loada, loadb, loadp, rstp, decb;
input [15:0] data_in;

wire [15:0] a1, b1, p1, p2;

output zerob;

pipo_a P1 (
            .data_in (data_in), 
            .clk (clk), 
            .loada (loada), 
            .data_out (a1)
            );

pipo_b P2 (
            .data_in (data_in), 
            .clk (clk), 
            .loadb (loadb),
            .decb (decb), 
            .data_out (b1)
            );

pipo_p P3 (
            .data_in (p2), 
            .clk (clk), 
            .loadb (loadb),
            .rstp (rstp), 
            .data_out (p1)
            );

adder_ap A1 (
             .ain(a1),
             .bin(p1),
             .sout(p2)
            );

zerob Z1 (
          .in (b1),
          .zero (zerob)
         ); 

endmodule
