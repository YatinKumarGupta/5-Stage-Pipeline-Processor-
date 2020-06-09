`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:45 05/25/2020 
// Design Name: 
// Module Name:    IF_ID 
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
module IF_ID(flush,pc_in,clk,ins,ins_out,pc_out);
input clk,flush;
input [31:0] ins,pc_in;
output reg [31:0] ins_out,pc_out;

always@(clk)
begin
	if(clk)
	begin 
		if(flush)	// if branch is taken then data will be flush out from latch
		begin
				ins_out = 32'bx;
				pc_out = 32'bx;
		end
		else
		begin
			ins_out <= ins;	
			pc_out <= pc_in;
		end
	end
end

endmodule
