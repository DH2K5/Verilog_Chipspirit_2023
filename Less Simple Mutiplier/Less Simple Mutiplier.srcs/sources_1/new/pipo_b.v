`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 16:00:17
// Design Name: 
// Module Name: pipo_b
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


module pipo_b(
    data_in,                                                                                                                                // data input
    clk,
    loadb,
    decb,
    data_out
);

    // input declarations
    input [15:0] data_in;
    input clk, loadb, decb;
    
    // output declarations
    output reg [15:0] data_out;

    // function
    always @ (posedge clk)
        begin
            if(loadb)
             begin
                data_out <= data_in;
             end
            else if(decb)
                    data_out <= data_out - 1;
        end
endmodule
