`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2020 10:10:41 PM
// Design Name: 
// Module Name: thirtytwo_mux
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


module thirtytwo_mux(D0,D1,S,Y); 

input wire [31:0]D0,D1; 
input wire S;  
output reg [31:0]Y; 

always@(D0 or D1 or S) 
begin 

if(S)
Y=D1; 
else 
Y=D0; 

end 

endmodule
