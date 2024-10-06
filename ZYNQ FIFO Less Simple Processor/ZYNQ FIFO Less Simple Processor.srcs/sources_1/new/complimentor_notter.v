`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2024 15:08:06
// Design Name: 
// Module Name: complimentor_notter
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

`include "definition_buswidth.vh"

module complimentor_notter(
    
    // control inputs

    // data inputs
    input [(`buswidth - 1):0] complimentor_notter_data_in_main,

    // control outputs

    // data outputs
    output [(`buswidth - 1):0] complimentor_notter_data_out_main
);

    assign complimentor_notter_data_out_main = ~complimentor_notter_data_in_main;

endmodule
