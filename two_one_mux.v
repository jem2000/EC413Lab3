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

//We designed this MUX using by checking if S is 1 go to D1 and if S is 0 go to D0. 

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
