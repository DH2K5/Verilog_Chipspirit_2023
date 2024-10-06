`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 16:00:17
// Design Name: 
// Module Name: pipo_p
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


module pipo_p(
    data_in,                                                                                                                                // data input
    clk,
    loadp,
    rstp,
    data_out
);

    // input declarations
    input [15:0] data_in;
    input clk, loadp, rstp;
    
    // output declarations
    output reg [15:0] data_out;

    // function
    always @ (posedge clk)
        begin
            if(rstp)
             begin
                data_out <= 0;
             end
            else if(loadp)
                    data_out <= data_in;
        end
endmodule
