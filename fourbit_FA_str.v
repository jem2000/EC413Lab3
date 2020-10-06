`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 09:43:05 PM
// Design Name: 
// Module Name: fourbit_FA_str
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


module fourbit_FA_str(S, Cout, A, B, Cin);

input [3:0] A, B, Cin;
output [3:0] S;
output Cout;

wire w1, w2, w3;

FA_str      FA1     (w1, S[0], A[0], B[0], Cin[0]);
FA_str      FA2     (w2, S[1], A[1], B[1], Cin[1]);
FA_str      FA3     (w3, S[2], A[2], B[2], Cin[2]);
FA_str      FA4     (Cout, S[3], A[3], B[3], Cin[3]);

endmodule




