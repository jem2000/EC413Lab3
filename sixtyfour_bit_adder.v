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

    input [3:0] A, B;
    input Cin;
    output [3:0] S;
    output Cout;
    
    wire w1, w2, w3;
    
    sixteen_bit_adder      FA1     (w1, S[0], A[0], B[0], Cin);
    sixteen_bit_adder      FA2     (w2, S[1], A[1], B[1], w1);
    sixteen_bit_adder      FA3     (w3, S[2], A[2], B[2], w2);
    sixteen_bit_adder      FA4     (Cout, S[3], A[3], B[3], w3); 
    
endmodule
