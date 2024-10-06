`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 16:00:17
// Design Name: 
// Module Name: pipo_a
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


module pipo_a(
    data_in,                                                                                                                                // data input
    clk,
    loada,
    data_out
);

    // input declarations
    input [15:0] data_in;
    input clk, loada;
    
    // output declarations
    output reg [15:0] data_out;

    // function
    always @ (posedge clk)
        begin
            if(loada)
             begin
                data_out <= data_in;
             end
        end
endmodule
