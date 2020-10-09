`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 08:16:17 PM
// Design Name: 
// Module Name: twostage_carryselect_adder
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

//We designed a 2 Stage Carry Select Adder by instantiating 32 bit adders 3 times. Then we made 2 MUXes to 
//make a Cout for the 2 Stage Carry Select Adder and the other was for the output. 

module twostage_carryselect_adder(Cin,A,B,S,Cout); 

input [63:0]A,B; 
input Cin;   
output [63:0]S; 
output Cout; 

wire w1,w4,w5;   
wire [31:0]w2,w3;   
 
thirtytwo_bitadder FA1(S[31:0],w1,A[31:0],B[31:0],Cin); 
thirtytwo_bitadder FA2(w2[31:0],w4,A[63:32],B[63:32],0);
thirtytwo_bitadder FA3(w3[31:0],w5,A[63:32],B[63:32],1); 

thirtytwo_mux MUX1(w2[31:0],w3[31:0],w1,S[63:32]); 
two_one_mux MUX2(w4,w5,w1,Cout); 

endmodule
