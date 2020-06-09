`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:47:00 06/04/2020 
// Design Name: 
// Module Name:    IM_IW 
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
module IM_IW(CLK,Read_data_in,ALU_result_in,ctrl_sig_in,rd_in,Read_data_out,ALU_result_out,ctrl_sig_out,write_en,rd);
input [31:0] Read_data_in,ALU_result_in;
input [8:0] ctrl_sig_in;
input CLK;
input [4:0] rd_in;
output reg[31:0] Read_data_out,ALU_result_out;
output reg[8:0] ctrl_sig_out;
output reg write_en;
output reg [4:0] rd;
always@(posedge CLK)
	if(CLK)
	begin
		Read_data_out <= Read_data_in;
		ALU_result_out <= ALU_result_in;
		ctrl_sig_out <= ctrl_sig_in;
		write_en <= ctrl_sig_in[5];
		rd <= rd_in;
	end
endmodule
