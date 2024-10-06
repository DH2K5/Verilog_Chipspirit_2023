`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:             Chipspirit Technologies Pvt. Ltd.
// Engineer:            Akul Jindal
// 
// Create Date:         25.07.2024 15:08:06
// Design Name:         Processor Module Accumulator Registor
// Module Name:         processor_accumulator
// Project Name:        FIFO Less Simple Processor
// Target Devices:      ZYNQ Ultrascale+ ZCU106
//////////////////////////////////////////////////////////////////////////////////

`include "definition_buswidth.vh"

module processor_accumulator(

    // control inputs
    input clk,
    input [0:0] processor_accumulator_control_in_reset_accumultor,
    input [1:0] processor_accumulator_control_in_select_accumulator,

    // data inputs
    input [(`buswidth - 1):0] processor_accumulator_data_in_fifo_input,
    input [(`buswidth - 1):0] processor_accumulator_data_in_select_main,
    input [(`buswidth - 1):0] processor_accumulator_data_in_registors,

    // control outputs

    // data outputs
    output [(`buswidth - 1):0] processor_accumulator_data_out_registors,
    output [(`buswidth - 1):0] processor_accumulator_data_out_main
);

    // declarations
    reg [(`buswidth - 1):0] processor_accumulator_internal_data;

    // assigns
    assign processor_accumulator_data_out_registors = processor_accumulator_internal_data;
    assign processor_accumulator_data_out_main = processor_accumulator_internal_data;

    // perform asynchronous reset
    always @ (posedge processor_accumulator_control_in_reset_accumultor) begin
        processor_accumulator_internal_data = 0;
    end

    // clock functions
    always @ (posedge clk) begin

        // reset
        if (processor_accumulator_control_in_reset_accumultor == 'b1) begin
            processor_accumulator_internal_data = 0;
        end

        // not reset
        else begin
            case (processor_accumulator_control_in_select_accumulator)

                // accumulator input disabled
                2'b00: begin
                    processor_accumulator_internal_data = processor_accumulator_internal_data;
                end

                // accumulator input fifo
                2'b01: begin
                    processor_accumulator_internal_data = processor_accumulator_data_in_fifo_input;
                end

                // accumulator input main
                2'b10: begin
                    processor_accumulator_internal_data = processor_accumulator_data_in_select_main;
                end

                // accumulator input registors
                2'b11: begin
                    processor_accumulator_internal_data = processor_accumulator_data_in_registors;
                end
            endcase
        end
    end

endmodule
