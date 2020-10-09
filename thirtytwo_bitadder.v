`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 07:51:58 PM
// Design Name: 
// Module Name: thirtytwo_bitadder
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


module thirtytwo_bitadder(S, Cout, A, B, Cin); 

    input [31:0] A, B;
    input Cin;
    output [31:0] S;
    output Cout;
    
    wire w1;
    
    sixteen_bit_adder      FA1     (w1, S[15:0],A[15:0], B[15:0], Cin);
    sixteen_bit_adder      FA2     (Cout, S[31:16], A[31:16], B[31:16], w1); 

endmodule
