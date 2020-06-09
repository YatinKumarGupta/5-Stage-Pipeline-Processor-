`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:54:29 06/08/2020 
// Design Name: 
// Module Name:    Forwading_unit 
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
module Forwading_unit(mem_rd,wb_rd,rs,rt,ForA,ForB);
input [4:0] mem_rd,wb_rd,rs,rt;
output reg [1:0] ForA,ForB;

always@(*)
begin
	if(rs == mem_rd)
		ForA = 2'b10;
	else if(rs == wb_rd)
		ForA = 2'b01;
	else
		ForA = 2'b00;

	if(rt == mem_rd)
		ForB = 2'b10;
	else if(rt == wb_rd)
		ForB = 2'b01;
	else
		ForB = 2'b00;
end
endmodule
