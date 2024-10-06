`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2024 10:19:45
// Design Name: 
// Module Name: Source1
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

`include "Header1.vh"

module main
(
    input clk_in1_p,
    input clk_in1_n
);

    //input output
    wire [3:0] inps;    //opcode + regs input
    wire [(`buswidth - 1):0] constinps;    //constants input
    wire [(`buswidth - 1):0] outs;    //output
    
    //internal architecture
    reg [(`buswidth - 1):0] outp;    //changing output
    reg [(`buswidth - 1):0] ACC;    //Accumulator
    reg [(`buswidth - 1):0] regs [3:0];    //intermediary storage registors

    //state storage
    reg enable;    //enable
    reg enable2;    //enable storer
    wire enabler;    //input enable
    wire clok;    //IP clock (100 MHz)
    reg [2:0] prstate;    //processor state
    reg [7:0] counter;    //write/read counter
    reg [3:0] instate;    //instate state counter
        
    //Inputs/Outputs
    vio_0 VIO1 (
        .clk(clok),                           // input wire clk
        .probe_in0(outs),                     // input wire [3 : 0] probe_in0
        .probe_out0(inps),                    // output wire [3 : 0] probe_out0
        .probe_out1(constinps),               // output wire [3 : 0] probe_out1
        .probe_out2(enabler)                   // output wire [0 : 0] probe_out2
    );
    ila_0 ILA1 (
	    .clk(clok),                           // input wire clk
	    .probe0(ACC),                         // input wire [3:0]  probe0  
	    .probe1(regs[0]),                     // input wire [3:0]  probe1 
	    .probe2(regs[1]),                     // input wire [3:0]  probe2 
	    .probe3(regs[2]),                     // input wire [3:0]  probe3 
	    .probe4(regs[3])                      // input wire [3:0]  probe4
    );

    //modules
    clk_wiz_0 Clock1(
        .clk_out1(clok),                     // output clk_out1
        .clk_in1_p(clk_in1_p),               // input clk_in1_p
        .clk_in1_n(clk_in1_n)                // input clk_in1_n
    );

    //Arithmer
    //Arther AXI
    reg [7:0] artherReadAddress;
    reg artherReadAddressEnable;
    wire artherReadAddressReady;
    wire [7:0] artherReadData;
    wire artherReadDataEnable;
    reg artherReadDataReady;
    reg [7:0] artherWriteAddress;
    reg artherWriteAddressEnable;
    wire artherWriteAddressReady;
    reg [7:0] artherWriteData;
    reg artherWriteDataEnable;
    wire artherWriteDataReady;
    wire [1:0] artherWriteBack;
    wire artherWriteBackEnable;
    reg artherWriteBackReady;
    //Arithmer Instantiation
    Arithmer Arther(
        .clk (clok),
        .readAddress (artherReadAddress),
        .readAddressEnable (artherReadAddressEnable),
        .readAddressReady (artherReadAddressReady),
        .readData (artherReadData),
        .readDataEnable (artherReadDataEnable),
        .readDataReady (artherReadDataReady),
        .writeAddress (artherWriteAddress),
        .writeAddressEnable (artherWriteAddressEnable),
        .writeAddressReady (artherWriteAddressReady),
        .writeData (artherWriteData),
        .writeDataEnable (artherWriteDataEnable),
        .writeDataReady (artherWriteDataReady),
        .writeBack (artherWriteBack),
        .writeBackEnable (artherWriteBackEnable),
        .writeBackReady (artherWriteBackReady)
    );
    //Arithmer IO
    always @ (posedge clok) begin
        if (prstate != 2) begin end
        else if (instate == 0) begin
            
        end
    end
    
    always @ (posedge clok) begin
        if (enabler != enable2 && !enable) begin       //enable enable
            enable = 1;
            enable2 = enabler;
        end
        if (!enable) begin end                   //Check enable
        else if ()
    end

endmodule