`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.07.2024 15:08:06
// Design Name: 
// Module Name: processor_complimentor
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

module processor_complimentor(
    
    // control inputs

    // data inputs
    input [(`buswidth - 1):0] processor_complimentor_data_in_main,

    // control outputs

    // data outputs
    output [(`buswidth - 1):0] processor_complimentor_data_out_main
);

    // declarations
    wire [(`buswidth - 1):0] complimentor_notter_incrementor;

    // instantiation
    complimentor_notter processor_complimentor_notter_instance_1(
        .complimentor_notter_data_in_main (processor_complimentor_data_in_main),
        .complimentor_notter_data_out_main (complimentor_notter_incrementor)
    );
    complimentor_incrementor processor_complimentor_incrementor_instance_1(
        .complimentor_incrementor_data_in_main (complimentor_notter_incrementor),
        .complimentor_incrementor_data_out_main (processor_complimentor_data_out_main)
    );

endmodule
