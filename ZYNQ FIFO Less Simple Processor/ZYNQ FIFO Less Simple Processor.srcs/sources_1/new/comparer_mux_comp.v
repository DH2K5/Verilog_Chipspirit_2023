`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2024 15:08:06
// Design Name: 
// Module Name: comparer_mux_comp
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

module comparer_mux_comp(
    
    // control inputs
    input [0:0] comparer_mux_comp_control_in_select,

    // data inputs
    input [0:0] comparer_mux_comp_data_in_and,
    input [0:0] comparer_mux_comp_data_in_or,

    // control outputs

    // data outputs
    output [0:0] comparer_mux_comp_data_out_main
);

    // assigns
    assign comparer_mux_comp_data_out_main = (comparer_mux_comp_control_in_select)? (comparer_mux_comp_data_in_and) : (comparer_mux_comp_data_in_or);

endmodule
