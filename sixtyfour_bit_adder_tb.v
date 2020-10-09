`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2020 08:53:08 PM
// Design Name: 
// Module Name: sixtyfour_bit_adder_tb
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


module sixtyfour_bit_adder_tb; 
	
	wire Cout,Coutselect; 
	wire [63:0] S,Carryselectsum;
	// Inputs
	reg  [63:0] A, B;
	reg Cin;
	reg clk;
	
	wire Cout_verify;
	wire [63:0] Sum_verify;
	wire error_flag;
	
	// Instantiate the Unit Under Test (UUT)
	sixtyfour_bit_adder sixtyfourFA (
		.Cout(Cout), 
		.S(S), 
        //.A(A[0]), .A(A[1]), .A(A[2]), .A(A[3]), 
		//.B(B[0]), .B(B[1]), .B(B[2]), .B(B[3]),  
		.A(A),
		.B(B),
		.Cin(Cin)
	);
	
		// Instantiate the Unit Under Test (UUT)
	twostage_carryselect_adder carryselectFA ( 
	    .Cout(Coutselect), 
		.S(Carryselectsum), 
        //.A(A[0]), .A(A[1]), .A(A[2]), .A(A[3]), 
		//.B(B[0]), .B(B[1]), .B(B[2]), .B(B[3]),  
		.A(A),
		.B(B),
		.Cin(Cin)  
	);
	
	// Verification module
	sixtyfour_verification Verification (
		.Cout(Cout_verify), 
		.S(Sum_verify), 
		.A(A), 
		.B(B), 
		.Cin(Cin)
	);
	
	// Assign Error_flag
	assign error_flag = (Cout != Cout_verify || S[0] != Sum_verify[0]|| S[1] != Sum_verify[1]|| S[2] != Sum_verify[2]|| S[3] != Sum_verify[3]);
	
	assign error_flag_twostage = (Coutselect != Cout_verify || Carryselectsum[0] != Sum_verify[0]|| Carryselectsum[1] != Sum_verify[1]|| Carryselectsum[2] != Sum_verify[2]|| Carryselectsum[3] != Sum_verify[3]);	

	always #10 clk = ~clk; 

	initial begin
		// Initialize Inputs
//		clk = 0;
//		A[0] = 0; A[1] = 0;	A[2] = 0; A[3] = 0;
//		B[0] = 0; B[1] = 0; B[2] = 0; B[3] = 0;
//		Cin = 1;
		#1 clk = 1;
		#20 A = 64'b0000000000000000001000000000001000000000000100000000000100000000; B = 64'b1010101010101010101010101010101010101010101010101010101010101010; Cin = 0;
		#40 A = 64'b1111111111111111101111011111111111111011111111111101111111111111; B = 64'b1111111110111111111111111110111111111111110111111111111111111111; Cin = 0;
		#60 A = 64'b1111110111111110111111111111011111111111111101111111111111111111; B = 64'b0110111111111111111110111111111111101111111111111111111111111111; Cin = 1;
		#20 A = 64'hFFFFFFFFFFFFFFFF; B = 64'h0000000000000001; Cin = 1;
		#20 A = 64'hFFFFFFFFFFFFFFAA; B = 64'h0000000000000111; Cin = 1;
		#20 A = 64'h0000000001110111; B = 64'h0000000000000111; Cin = 0;
		#20 A = 64'h0000000000000001; B = 64'h0000000000000001; Cin = 0;
		#10 A = 64'h1782838692869386; B = 64'habc497bde754957f; Cin = 1;
		#10 A = 64'h17828aefbca69386; B = 64'habc491234567897f; Cin = 1;
		#10 A = 64'h17828a9876543216; B = 64'habc49fedcba7897f; Cin = 0;
//		#80 A = 4'b1010; B = 4'b1110; Cin = 0;
//		#100 A = 4'b1010; B = 4'b1110; Cin = 1;
	end
	
//	always @ (posedge clk)
//	begin
//		#100 {B[0], B[1], B[2], B[3], Cin} = {B[0], B[1], B[2], B[3], Cin} + 1;
//		#100 {A[0], A[1], A[2], A[3]} = {A[0], A[1], A[2], A[3]} + 1;
//	end
endmodule
