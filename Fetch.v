`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:32:22 04/10/2020 
// Design Name: 
// Module Name:    Fetch 
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
module Fetch(clk,ins,br,br_pc,pc);
input clk;
input [31:0] br_pc;
input br;
output reg [31:0] pc;
output reg [31:0] ins;
reg count;
reg [31:0] instr_mem[31:0];   // 128 Byte Instruction Memory 
initial begin
	pc = 0;
	count = 0;
	instr_mem[0] = 32'b001001_00000_00001_0000000000000100; // MVI R1,R0,#4 (r1)
	instr_mem[1] = 32'b001001_00000_00010_0000000000110111; // MVI R2,R0,#55 (r2)
	instr_mem[2] = 32'b001001_00000_00011_0000000000000000; // MVI R3,R0,#0 (Counter)	
	instr_mem[3] = 32'b000000_00000_00010_00100_00000_101000; // MOV R4,R0,R2
	instr_mem[4] = 32'b000000_00100_00001_00100_00000_100010; // SUB R4,R4,R1 ( LOOP)
	instr_mem[5] = 32'b000011_00100_00100_0000000000000100; // BC R4,R4,LOOP1 (PC+4)
	instr_mem[6] = 32'b001000_00011_00011_0000000000000001; // ADDI R3,R3,#1	
	instr_mem[7] = 32'b000000_00000_00100_00101_00000_101000; // MOV R5,R0,R4
	instr_mem[8] = 32'b000010_00000000000000000000000100; // JMP LOOP (PC = 4)
	instr_mem[9] = 32'b000000_00000_00000_00000_00000_000000; // NOP (LOOP1)
end

always@(posedge clk)begin
	if(br)
		pc = br_pc;  // Jump to branch address
	else
	begin 
		if(count)
			pc = pc + 32'd1; // PC = PC + 1
		else
			count = 1;
	end
end

always@(posedge clk)begin
	ins = instr_mem[pc];
end

endmodule
