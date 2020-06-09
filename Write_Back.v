`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:38 06/04/2020 
// Design Name: 
// Module Name:    Write_Back 
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
module Write_Back(Read_data,ALU_result,ctrl_sig,Write_Back);
input [31:0] Read_data,ALU_result;
input [8:0] ctrl_sig;
output reg[31:0] Write_Back;
always@(*)
	if(ctrl_sig[6]) // If MemtoReg goes high
		Write_Back = Read_data;  // read_data is written back to register bank
	else
		Write_Back = ALU_result; // otherwise result from ALU unit is written back to register bank

endmodule
