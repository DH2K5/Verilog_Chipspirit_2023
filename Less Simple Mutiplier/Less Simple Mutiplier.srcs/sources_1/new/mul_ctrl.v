`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2024 16:00:17
// Design Name: 
// Module Name: mul_ctrl
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


module mul_ctrl(
                clk,
                mrst,
                zerob,
                loada,
                loadb,
                loadp,
                rstp,
                decb,
                ready
                );

input clk, zerob, mrst;

output loada, loadb, loadp, rstp, decb, ready;

reg [1:0] state;

parameter S0 = 'b00, S1 = 'b01, S2 = 'b10, S3 = 'b11;

always @(posedge clk)
    begin
        case(state)
            S0: if(mrst)
                state <= S1:
            S1: state <= S2;
            S2: state <= S3;
            S3: if(zerob)
                state <= S0;
            default: state <= S0;
        endcase
    end

always @(state)
    begin
        case(state)
        S0: loada = 0;
            loadb = 0;
            loadp = 0;
            rstp = 0;
            decb = 0;
            ready = 1;
        S1: loada = 1;
            ready = 0;
        S2: loada = 0;
            loadb = 1;
            rstp = 1;
        S3: loadb = 0;
            rstp = 0;
            loadp = 1;
        default: loada = 0;
                loadb = 0;
                loadp = 0;
                rstp = 0;
                decb = 0;
                ready = 1;
        endcase  
    end

endmodule
