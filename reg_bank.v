`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:21:26 05/14/2020 
// Design Name: 
// Module Name:    reg_bank 
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
module reg_bank(clk,r1,r2,rs1,rs2,rd,w_en,d_in);
input clk,w_en;
input [4:0] rs1,rs2,rd;
input [31:0] d_in;
output reg [31:0] r1,r2;
reg [31:0] bank [31:0]; // 128 Byte Data Memory

initial begin
	bank[0] <= 32'd0;
	bank[1] <= 32'd0;
	bank[2] <= 32'd0;
	bank[3] <= 32'd0;
	bank[4] <= 32'd0;
	bank[5] <= 32'd0;
	bank[6] <= 32'd0;
	bank[7] <= 32'd0;
	bank[8] <= 32'd0;
	bank[9] <= 32'd0;
end

always@(*)
	if(clk)
	begin
// Write Back
		if(w_en)
			bank[rd] <= d_in;
	end
	else
	begin
// Register Access Stage
	r1 <= bank[rs1];
	r2 <= bank[rs2];
	end
	
endmodule
