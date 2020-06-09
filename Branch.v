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
	if(ALUOp[1] & ALUOp[0])
	begin 
		br_pc = im_addr;
		br = 1;
	end
	else
	begin
		br_pc = im_ext + pc;
		if(ALU_ctrl == 4'd10)
			br = flag[1] & br_ctrl;
		else if(ALU_ctrl == 4'd11)
			br = flag[0] & br_ctrl;
		else
			br = 0;
	end 
end
endmodule
