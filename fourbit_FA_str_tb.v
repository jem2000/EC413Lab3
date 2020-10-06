`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2020 10:11:54 PM
// Design Name: 
// Module Name: fourbit_FA_str_tb
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


module fourbit_FA_str_tb;
	// Outputs
	wire Cout;
	wire [3:0] S;
	// Inputs
	reg  [3:0] A, B;
	reg Cin;
	reg clk;
	
	// Instantiate the Unit Under Test (UUT)
	fourbit_FA_str fourbit_FA (
		.Cout(Cout), 
		.S(S), 
        //.A(A[0]), .A(A[1]), .A(A[2]), .A(A[3]), 
		//.B(B[0]), .B(B[1]), .B(B[2]), .B(B[3]),  
		.A(A),
		.B(B),
		.Cin(Cin)
	);
	
	always #10 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		A[0] = 0; A[1] = 0;	A[2] = 0; A[3] = 0;
		B[0] = 0; B[1] = 0; B[2] = 0; B[3] = 0;
		Cin = 1;
		
		#20 A = 4'b0000; B = 4'b1010; Cin = 0;
		#40 A = 4'b1111; B = 4'b1111; Cin = 0;
		#60 A = 4'b1111; B = 4'b1111; Cin = 1;
		#80 A = 4'b1010; B = 4'b1110; Cin = 0;
		#100 A = 4'b1010; B = 4'b1110; Cin = 1;
	end
	
	always @ (posedge clk)
	begin
		#100 {B[0], B[1], B[2], B[3], Cin} = {B[0], B[1], B[2], B[3], Cin} + 1;
		#100 {A[0], A[1], A[2], A[3]} = {A[0], A[1], A[2], A[3]} + 1;
	end
  
endmodule










