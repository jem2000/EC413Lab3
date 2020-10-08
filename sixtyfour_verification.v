`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2020 08:56:36 PM
// Design Name: 
// Module Name: sixtyfour_verification
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


module sixtyfour_verification(Cout, S, A, B, Cin); 
    input [63:0] A, B;
    input Cin;
    output Cout;
    output [63:0] S;
    
    assign {Cout, S} = A + B + Cin;
endmodule
