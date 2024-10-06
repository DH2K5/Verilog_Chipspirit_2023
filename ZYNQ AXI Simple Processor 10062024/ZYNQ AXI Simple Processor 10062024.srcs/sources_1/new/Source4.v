`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2024 10:21:06
// Design Name: 
// Module Name: Source4
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

module Multer
#(parameter betterwidth = (`buswidth / 2))
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

    reg [betterwidth:0] counter;                    //passes num counter
    reg [(`buswidth - 1):0] out;                    //internal out
    reg complete;                                   //internal complete
    reg [betterwidth:0] ACC;                        //internal acc
    reg [betterwidth:0] REG;                        //internal reg
    reg enable;                                     //internal enable
     
    //multiplier operation
    always @ (posedge clk) begin
        if(!enable) begin                           //unenabled
            complete = 0;
            out = 0;
            counter = 0;
        end
        else if(counter >= `buswidth) begin         //finish multiplication
            out = out >> 1;
            complete = 1;
        end
        else begin                                  //in multiplication
            out = (REG[`buswidth - 1 - counter])? ((ACC + out) << 1) : (out << 1);
            counter = counter + 1;
        end
    end
    
    //AXI operation
    always @ (posedge clk) begin
    end
    
endmodule
