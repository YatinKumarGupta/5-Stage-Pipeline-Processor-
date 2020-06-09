`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:17 06/03/2020 
// Design Name: 
// Module Name:    Data_Mem 
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
module Data_Mem(CLK,Address,Write_data,ctrl_sig,Read_data);
input [31:0] Address,Write_data;
input [8:0] ctrl_sig;
input CLK;
output reg[31:0] Read_data;
reg [31:0]Mem[31:0];
always@(negedge CLK) 
	if(ctrl_sig[4])
		Read_data = Mem[Address];
always@(posedge CLK)
	if(ctrl_sig[3])
		Mem[Address] = Write_data;
endmodule
