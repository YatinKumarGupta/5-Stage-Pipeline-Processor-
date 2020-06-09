`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:04:02 05/25/2020 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(opcode,control_sig);
input [5:0] opcode;
output reg [8:0] control_sig;
always@(opcode)
begin
	if (opcode == 6'b0) // R-type
	begin
		control_sig = 9'b_1_0_0_1_0_0_0_10;
	end
	
	// I-type
	else if(opcode == 6'b001000) //ADDI	001000
	begin
		control_sig =	9'b_0_1_0_1_0_0_0_00;														
	end
	
	else if(opcode == 6'b001100) //ANDI	001100
	begin
		control_sig =	9'b_0_1_0_1_0_0_0_00;														
	end
	
	else if(opcode == 6'b001101) //ORI		001101
	begin
		control_sig =	9'b_0_1_0_1_0_0_0_00;														
	end						
	
	else if(opcode == 6'b001110) //XORI	001110
	begin
		control_sig =	9'b_0_1_0_1_0_0_0_00;														
	end						
	
	else if(opcode == 6'b001001) //MOVI	001001
	begin
		control_sig =	9'b_0_1_0_1_0_0_0_00;														
	end						
	
	else if(opcode == 6'b000010) //JUMP	000010
	begin
		control_sig =	9'b_x_0_0_0_0_0_1_11;														
	end					
	
	else if(opcode == 6'b000011) //JC		000011
	begin
		control_sig =	9'b_x_0_0_0_0_0_1_00;
	end						
	
	else if(opcode == 6'b000100) //JZ		000100
	begin
		control_sig =	9'b_x_0_0_0_0_0_1_00;														
	end						
	
	else if(opcode == 6'b100011) //LW		100011
	begin
		control_sig =	9'b_0_1_1_1_1_0_0_00;														
	end	

	else if(opcode == 6'b101011) //SW		101011
	begin
		control_sig =	9'b_x_1_x_0_0_1_0_00;														
	end
	else
		control_sig =	9'b_x_x_x_x_x_x_x_xx;
end
endmodule
