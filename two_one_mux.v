`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 07:55:37 PM
// Design Name: 
// Module Name: two_one_mux
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


module two_one_mux(D0,D1,S,Y); 

input wire D0,D1,S; 
output reg Y; 

always@(D0 or D1 or S) 
begin 

if(S)
Y=D1; 
else 
Y=D0; 

end 


endmodule
