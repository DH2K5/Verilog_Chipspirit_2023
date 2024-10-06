`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2024 15:08:06
// Design Name: 
// Module Name: processor_mux_addsub
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

module processor_mux_addsub(

    // control inputs
    input [0:0] processor_mux_addsub_control_in_select,

    // data inputs
    input [(`buswidth - 1):0] processor_mux_addsub_data_in_positive_input,
    input [(`buswidth - 1):0] processor_mux_addsub_data_in_negative_input,

    // control outputs

    // data outputs
    output [(`buswidth - 1):0] processor_mux_addsub_data_out_main
);

    // assigns
    assign processor_mux_addsub_data_out_main = (processor_mux_addsub_control_in_select)? (processor_mux_addsub_data_in_positive_input) : (processor_mux_addsub_data_in_negative_input);

endmodule
