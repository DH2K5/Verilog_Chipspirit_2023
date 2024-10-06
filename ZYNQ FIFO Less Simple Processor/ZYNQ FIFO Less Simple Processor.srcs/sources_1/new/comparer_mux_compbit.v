`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2024 15:08:06
// Design Name: 
// Module Name: comparer_mux_compbit
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

module comparer_mux_compbit(
    
    // control inputs
    input [(`buswidth - 1):0] comparer_mux_compbit_control_in_select,

    // data inputs
    input [(`buswidth - 1):0] comparer_mux_compbit_data_in_main,

    // control outputs

    // data outputs
    output [0:0] comparer_mux_compbit_data_out_main
);

    // assigns
    assign comparer_mux_compbit_data_out_main = comparer_mux_compbit_data_in_main[comparer_mux_compbit_control_in_select];

endmodule
