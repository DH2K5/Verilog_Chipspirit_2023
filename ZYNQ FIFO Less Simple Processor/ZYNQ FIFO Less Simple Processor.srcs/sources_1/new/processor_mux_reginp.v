`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:             Chipspirit Technologies Pvt. Ltd.
// Engineer:            Akul Jindal
// 
// Create Date:         25.07.2024 15:08:06
// Design Name:         Processor Module Registors Input Mux
// Module Name:         processor_mux_reginp
// Project Name:        FIFO Less Simple Processor
// Target Devices:      ZYNQ Ultrascale+ ZCU106
//////////////////////////////////////////////////////////////////////////////////

`include "definition_buswidth.vh"

module processor_mux_reginp(

    // control inputs
    input [0:0] processor_mux_reginp_control_in_select,

    // data inputs
    input [(`buswidth - 1):0] processor_mux_reginp_data_in_registors,
    input [(`buswidth - 1):0] processor_mux_reginp_data_in_fifo_input,

    // control outputs

    // data outputs
    output [(`buswidth - 1):0] processor_mux_reginp_data_out_main
);

    // assigns
    assign processor_mux_reginp_data_out_main = (processor_mux_reginp_control_in_select)? (processor_mux_reginp_data_in_registors) : (processor_mux_reginp_data_in_fifo_input);

endmodule
