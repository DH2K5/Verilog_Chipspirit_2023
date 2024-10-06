`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2024 15:08:06
// Design Name: 
// Module Name: comparer_orgate
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

module comparer_orgate(
  
    // control inputs

    // data inputs
    input [0:0] comparer_orgate_data_in_compbit,
    input [0:0] comparer_orgate_data_in_input,

    // control outputs

    // data outputs
    output [0:0] comparer_orgate_data_out_main
);

    // assigns
    assign comparer_orgate_data_out_main = comparer_orgate_data_in_input | comparer_orgate_data_in_compbit;

endmodule
