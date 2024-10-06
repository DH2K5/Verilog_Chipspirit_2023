`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:             Chipspirit Technologies Pvt. Ltd.
// Engineer:            Akul Jindal
// 
// Create Date:         25.07.2024 15:08:06
// Design Name:         Processor Module Registors Controller
// Module Name:         processor_registors
// Project Name:        FIFO Less Simple Processor
// Target Devices:      ZYNQ Ultrascale+ ZCU106
//////////////////////////////////////////////////////////////////////////////////

`include "definition_buswidth.vh"

module processor_registors(

    // control inputs
    input clk,
    input [0:0] processor_registors_control_in_reset_registors,
    input [1:0] processor_registors_control_in_select_registors,

    // data inputs
    input [(`buswidth - 1):0] processor_registors_data_in_fifo_input,
    input [(`buswidth - 1):0] processor_registors_data_in_accumulator,

    // control outputs

    // data outputs
    output [(`buswidth - 1):0] processor_registors_data_out_main
);

    // declarations
    reg [(`buswidth - 1):0] processor_registors_internal_data;

    // assigns
    assign processor_registors_data_out_main = processor_registors_internal_data;

    // perform asynchronous reset
    always @ (posedge processor_registors_control_in_reset_registors) begin
        processor_registors_internal_data = 0;
    end

    // clock functions
    always @ (posedge clk) begin

        // reset
        if (processor_registors_control_in_reset_registors == 'b1) begin
            processor_registors_internal_data = 0;
        end

        // not reset
        else begin
            case (processor_registors_control_in_select_registors)

                // accumulator input disabled
                2'b00: begin
                    processor_registors_internal_data = processor_registors_internal_data;
                end

                // accumulator input fifo
                2'b01: begin
                    processor_registors_internal_data = processor_registors_data_in_fifo_input;
                end

                // accumulator input main
                2'b10: begin
                    processor_registors_internal_data = processor_registors_data_in_accumulator;
                end

                // invalid input
                2'b11: begin
                    processor_registors_internal_data = processor_registors_internal_data;
                end
            endcase
        end
    end

endmodule
