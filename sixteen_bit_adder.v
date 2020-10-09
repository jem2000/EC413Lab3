`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2020 08:44:43 PM
// Design Name: 
// Module Name: sixteen_bit_adder
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

//We designed this 16 bit adder for the 64 bit adder. In this adder, we instantiated four 4 bit adders. 

module sixteen_bit_adder(Cout, S, A, B, Cin);
    
    input [15:0] A, B;
    input Cin;
    output [15:0] S;
    output Cout;

    wire w1, w2, w3;

    fourbit_FA_str      FA1     (w1, S[3:0], A[3:0], B[3:0], Cin);
    fourbit_FA_str      FA2     (w2, S[7:4], A[7:4], B[7:4], w1);
    fourbit_FA_str      FA3     (w3, S[11:8], A[11:8], B[11:8], w2);
    fourbit_FA_str      FA4     (Cout, S[15:12], A[15:12], B[15:12], w3); 
    
endmodule
