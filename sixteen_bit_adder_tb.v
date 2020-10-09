`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 01:23:22 AM
// Design Name: 
// Module Name: sixteen_bit_adder_tb
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

//Testbench for the 16 bit adder. 

module sixteen_bit_adder_tb;
	// Outputs
	wire Cout;
	wire [15:0] S;
	// Inputs
	reg  [15:0] A, B;
	reg Cin;
	reg clk;
	
	wire Cout_verify;
	wire [15:0] Sum_verify;
	wire error_flag;

	
	// Instantiate the Unit Under Test (UUT)
	sixteen_bit_adder sixteen_bit_Adder (
		.Cout(Cout), 
		.S(S), 
        //.A(A[0]), .A(A[1]), .A(A[2]), .A(A[3]), 
		//.B(B[0]), .B(B[1]), .B(B[2]), .B(B[3]),  
		.A(A),
		.B(B),
		.Cin(Cin)
	);
	
	// Verification module
	fourbit_verification Verification (
		.Cout(Cout_verify), 
		.S(Sum_verify), 
		.A(A), 
		.B(B), 
		.Cin(Cin)
	);
	
	// Assign Error_flag
	assign error_flag = (Cout != Cout_verify || S[0] != Sum_verify[0]|| S[1] != Sum_verify[1]|| S[2] != Sum_verify[2]|| S[3] != Sum_verify[3]);
	
	
	always #10 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		//A[0] = 0; A[1] = 0;	A[2] = 0; A[3] = 0;
		//B[0] = 0; B[1] = 0; B[2] = 0; B[3] = 0;
		Cin = 1;
		
		#20 A = 16'b0000000000000000; B = 16'b1010101010101010; Cin = 0;
		#40 A = 16'b1111111111111111; B = 16'b1111111111111111; Cin = 0;
		#60 A = 16'b1111111111111111; B = 16'b1111111111111111; Cin = 1;
		#80 A = 16'b1010101010101010; B = 16'b1110111011101110; Cin = 0;
		#100 A = 16'b1010101010101010; B = 16'b1110111011101110; Cin = 1;
	end
	
	always @ (posedge clk)
	begin
		#100 {B[0], B[1], B[2], B[3], Cin} = {B[0], B[1], B[2], B[3], Cin} + 1;
		#100 {A[0], A[1], A[2], A[3]} = {A[0], A[1], A[2], A[3]} + 1;
		
		#100 {B[4], B[5], B[6], B[7]} = {B[4], B[5], B[6], B[7]} + 1;
		#100 {A[4], A[5], A[6], A[7]} = {A[4], A[5], A[6], A[7]} + 1;
		
		#100 {B[8], B[9], B[10], B[11]} = {B[8], B[9], B[10], B[11]} + 1;
		#100 {A[8], A[9], A[10], A[11]} = {A[8], A[9], A[10], A[11]} + 1;
		
		#100 {B[12], B[13], B[14], B[15]} = {B[12], B[13], B[14], B[15]} + 1;
		#100 {A[12], A[13], A[14], A[15]} = {A[12], A[13], A[14], A[15]} + 1;
	end
  
endmodule











