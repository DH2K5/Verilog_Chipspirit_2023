`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2024 10:19:45
// Design Name: 
// Module Name: Source3
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

module Compirer
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
    reg [(`buswidth/2):0] sel;
    reg mode;
    reg inp;
    reg ou;
    
    assign out = mode? (ACC[sel] || inp) : (ACC[sel] && inp);
    
endmodule
