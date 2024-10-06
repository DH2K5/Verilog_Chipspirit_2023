`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 16:00:17
// Design Name: 
// Module Name: adder_ap
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


module adder_ap(
    ain,                                                                                                                                    // A Input
    bin,                                                                                                                                    // B Input
    sout                                                                                                                                    // Sum Output
);

    // input declarations
    input [15:0] ain, bin;
    // output declarations
    output reg [15:0] sout;

    // function
    always @(*) 
        begin
            sout = ain + bin;
        end

endmodule
