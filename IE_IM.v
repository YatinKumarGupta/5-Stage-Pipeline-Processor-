`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:26 06/03/2020 
// Design Name: 
// Module Name:    IE_IM 
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
module IE_IM(clk,ALU_result,ctrl_sig_in,rd_in,Read_data2,Address,Write_data,ctrl_sig,rd);
input clk;
input [4:0] rd_in;
input [31:0] ALU_result,Read_data2;
input [8:0] ctrl_sig_in;
output reg [8:0] ctrl_sig;
output reg [31:0] Address,Write_data;
output reg [4:0] rd;
always@(clk)
	if(clk)
	begin
		Address <= ALU_result;
		Write_data <= Read_data2;
		ctrl_sig <= ctrl_sig_in;
		rd <= rd_in;
	end
endmodule
