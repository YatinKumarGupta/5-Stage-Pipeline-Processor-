`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:48:23 06/06/2020 
// Design Name: 
// Module Name:    Branch 
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
module Branch(ALU_ctrl,im_addr,im_ext,pc,br_ctrl,ALUOp,flag,br_pc,br);
input [31:0] im_ext,pc,im_addr;
input br_ctrl;
input [3:0] ALU_ctrl;
input [1:0] flag;
input [1:0] ALUOp;
output reg[31:0] br_pc;
output  reg br;
reg [2:0] x;
always@(*)
begin
	if(ALUOp[1] & ALUOp[0]) 		//Whenever AND operation of both bits of ALUOp is high 
	begin 
		br_pc = im_addr;   		//Immediate address will go to br_pc variable
		br = 1; 			// 'br'(select line in Fetch stage) goes high
	end
	else
	begin
		br_pc = im_ext + pc;   		// if above condition fails then, immediate extended value is added to PC and assigned to br_pc
	if(ALU_ctrl == 4'd10) 			//when ALU_ctrl is 10(decimal)
		br = flag[1] & br_ctrl;  	//we check whether there is a branching instruction or not and also carry is generating or not. if yes, then br goes high
	else if(ALU_ctrl == 4'd11) 		// if ALU_ctrl has a value 11(dec) then,
		br = flag[0] & br_ctrl; 	// again checking if instruction is a branch and also zero flag is generating or not, if yes, then br goes high
	else
		br = 0;				//If nothing satisfies then 'br' remains low.
	end 
end
endmodule
