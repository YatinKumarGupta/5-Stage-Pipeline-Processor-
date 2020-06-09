`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:23 06/02/2020 
// Design Name: 
// Module Name:    ALU_control 
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
module ALU_control(func,ALU_Op,ALU_ctrl);
input [5:0] func;
input [1:0] ALU_Op;
output reg [3:0] ALU_ctrl;
always@(ALU_Op,func)
begin
case(ALU_Op)
	2'b10: case(func)
				6'b100000: ALU_ctrl = 4'd1; // ADD
				6'b100010: ALU_ctrl = 4'd2; // SUB
				6'b100100: ALU_ctrl = 4'd3; // AND
				6'b100101: ALU_ctrl = 4'd4; // OR
				6'b100110: ALU_ctrl = 4'd5; // XOR
				6'b100011: ALU_ctrl = 4'd6; // NOT
				6'b100111: ALU_ctrl = 4'd7; // CMPs
				6'b101000: ALU_ctrl = 4'd8; // MOV
				6'b000000: ALU_ctrl = 4'd0; // NOP
			endcase
	2'b00: case(func)
				6'b001000:  ALU_ctrl = 4'd1;  // ADDI
				6'b001100:  ALU_ctrl = 4'd3;  // ANDI
				6'b001101:  ALU_ctrl = 4'd4;  // ORI
				6'b001110:  ALU_ctrl = 4'd5;  // XORI
				6'b001001:  ALU_ctrl = 4'd8;  // MOVI
				6'b100011:  ALU_ctrl = 4'd1;  // LW
				6'b101011:  ALU_ctrl = 4'd1;  // SW
				6'b000011: ALU_ctrl = 4'd10; 	// JC
				6'b000100: ALU_ctrl = 4'd11;	// JZ
			endcase 
	2'b11: 
			ALU_ctrl = 4'd9; 
endcase
end
endmodule
