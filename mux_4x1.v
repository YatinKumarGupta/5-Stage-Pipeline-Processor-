`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:29:44 06/08/2020 
// Design Name: 
// Module Name:    mux_4x1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux_4x1(a,b,c,sel,out);
input [31:0] a,b,c;
input [1:0] sel;
output reg [31:0] out;
always@(*)
begin
	case(sel)
		2'b00: out = a;
		2'b01: out = b;
		2'b10: out = c;
		default: out = 32'bx;
	endcase
end	
endmodule
