`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2024 15:08:06
// Design Name: 
// Module Name: processor_adder
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

module processor_adder(
    
    // control inputs

    // data inputs
    input [(`buswidth - 1):0] processor_adder_data_in_accumulator,
    input [(`buswidth - 1):0] processor_adder_data_in_mux_addsub,

    // control outputs

    // data outputs
    output [(`buswidth - 1):0] processor_adder_data_out_main
);

    // assigns
    assign processor_adder_data_out_main = processor_adder_data_in_accumulator + processor_adder_data_in_mux_addsub;

endmodule
