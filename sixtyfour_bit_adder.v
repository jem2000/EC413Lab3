`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2020 08:48:08 PM
// Design Name: 
// Module Name: sixtyfour_bit_adder
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


module sixtyfour_bit_adder(S, Cout, A, B, Cin); 

    input [63:0] A, B;
    input Cin;
    output [63:0] S;
    output Cout;
    
    wire w1, w2, w3;
    
    sixteen_bit_adder      FA1     (w1, S[15:0], A[15:0], B[15:0], Cin);
    sixteen_bit_adder      FA2     (w2, S[31:16], A[31:16], B[31:16], w1);
    sixteen_bit_adder      FA3     (w3, S[47:32], A[47:32], B[47:32], w2);
    sixteen_bit_adder      FA4     (Cout, S[63:48], A[63:48], B[63:48], w3); 
    
endmodule
