`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2024 10:19:45
// Design Name: 
// Module Name: Source2
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

module Arithmer
(
    input clk,
    
    input [7:0] readAddress,
    input readAddressEnable,
    output reg readAddressReady,
    
    output reg [7:0] readData,
    output reg readDataEnable,
    input readDataReady,
    
    input [7:0] writeAddress,
    input writeAddressEnable,
    output reg writeAddressReady,
    
    input [7:0] writeData,
    input writeDataEnable,
    output reg writeDataReady,
    
    output reg [1:0] writeBack,
    output reg writeBackEnable,
    input writeBackReady
);

    reg [(`buswidth - 1):0] ACC;
    reg [(`buswidth - 1):0] REG;
    reg mode;
    wire [(`buswidth - 1):0] out;
    
    //AXI regs
    reg [2:0] rwstate;
    reg [7:0] address;
    reg [7:0] counter;
        
    assign out = mode? (ACC - REG) : (ACC + REG);
    
    always @ (posedge clk) begin
        if (rwstate == 0) begin
            readAddressReady = 1;
            writeAddressReady = 1;
            writeBack = 0;
            readData = 0;
            writeBackEnable = 0;
            writeDataReady = 0;
            readDataEnable = 0;
            rwstate = 1;
        end
        else if (rwstate == 1 && writeAddressEnable == 1) begin
            address = writeAddress;
            writeAddressReady = 0;
            readAddressReady = 0;
            writeDataReady = 1;
            counter = 0;
            rwstate = 2;
        end
        else if (rwstate == 1 && readAddressEnable == 1) begin
            address = readAddress;
            writeAddressReady = 0;
            readAddressReady = 0;
            readDataEnable = 1;
            counter = 0;
            rwstate = 4;
        end
        else if (rwstate == 2) begin
            if (counter > address[5:0]) begin
                writeBackEnable = 1;
                writeBack = 'b00;
                rwstate = 3;
            end
            else if (writeDataReady == 0) begin
                writeDataReady = 1;
            end
            else if (writeDataEnable == 1) begin
                counter = counter + 1;
                if (address[7:6] == 0) begin
                    ACC = (ACC << 8) + writeData;
                end
                if (address[7:6] == 1) begin
                    REG = (REG << 8) + writeData;
                end
                if (address[7:6] == 2) begin
                    mode = writeData;
                end
                else begin
                    writeBackEnable = 1;
                    writeBack = 'b01;
                    rwstate = 3;
                end
                writeDataReady = 0;
            end
        end
        else if (rwstate == 3) begin
            if (writeBackReady == 1) begin
                rwstate = 0;
            end
        end
        else if (rwstate == 4) begin
            if (counter > address[5:0]) begin
                if (readDataReady == 1) begin
                    rwstate = 0;
                end
            end
            else if (readDataReady == 1) begin
                readDataEnable = 0;
            end
            else if (readDataReady == 1) begin
                if (address[7:6] == 0) begin
                    readData = out >> (((`buswidth / 8) - counter) * 8);
                end
                else begin
                    readData = 0;
                end
                counter = counter + 1;
                readDataEnable = 1;
            end
        end
    end
    
endmodule