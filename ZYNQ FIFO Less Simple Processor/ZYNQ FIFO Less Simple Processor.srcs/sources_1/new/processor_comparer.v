`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2024 15:08:06
// Design Name: 
// Module Name: processor_comparer
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

module processor_comparer(
    
    // control inputs
    input [(`buswidth - 1):0] processor_comparer_control_in_selcompbito,
    input [(`buswidth - 1):0] processor_comparer_control_in_selcomp,

    // data inputs
    input [(`buswidth - 1):0] comparer_mux_comp_data_in_acc,
    input [0:0] comparer_mux_comp_data_in_inp,

    // control outputs

    // data outputs
    output [(`buswidth - 1):0] comparer_mux_comp_data_out_main
);

    // declarations
    wire [0:0] comparer_comp;
    wire [0:0] comparer_compbit_andgate_orgate;
    wire [0:0] comparer_andgate_comp;
    wire [0:0] comparer_orgate_comp;

    // assigns
    assign comparer_mux_comp_data_out_main = comparer_comp;

    // instantiation
    comparer_mux_compbit processor_comparer_mux_compbit_instance_1(
        .comparer_mux_compbit_control_in_select (processor_comparer_control_in_selcompbito),
        .comparer_mux_compbit_data_in_main (comparer_mux_comp_data_in_acc),
        .comparer_mux_compbit_data_out_main (comparer_compbit_andgate_orgate)
    );
    comparer_andgate processor_comparer_andgate_instance_1(
        .comparer_andgate_data_in_compbit (comparer_compbit_andgate_orgate),
        .comparer_andgate_data_in_input (comparer_mux_comp_data_in_inp),
        .comparer_andgate_data_out_main (comparer_andgate_comp)
    );
    comparer_orgate processor_comparer_orgate_instance_1(
        .comparer_orgate_data_in_compbit (comparer_compbit_andgate_orgate),
        .comparer_orgate_data_in_input (comparer_mux_comp_data_in_inp),
        .comparer_orgate_data_out_main (comparer_orgate_comp)
    );
    comparer_mux_comp processor_comparer_mux_comp_instance_1(
        .comparer_mux_comp_control_in_select (processor_comparer_control_in_selcomp),
        .comparer_mux_comp_data_in_and (comparer_andgate_comp),
        .comparer_mux_comp_data_in_or (comparer_orgate_comp),
        .comparer_mux_comp_data_out_main (comparer_comp)
    );

endmodule
