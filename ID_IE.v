`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:50 05/26/2020 
// Design Name: 
// Module Name:    ID_IE 
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
module ID_IE(flush,pc_in,clk,Read_data1_in,Read_data2_in,im_ext_in,im_addr_in,func_in,ctrl_sig_in,rd_in,rs_in,rt_in,rs_out,rt_out,ctrl_sig,Read_data1,Read_data2,im_ext,im_addr_out,func,rd,pc_out);
input clk,flush;
input [4:0] rd_in,rs_in,rt_in;
input [8:0] ctrl_sig_in;
input [31:0] Read_data1_in,Read_data2_in,im_ext_in,pc_in,im_addr_in;
input [5:0] func_in;
output reg[31:0] Read_data1,Read_data2,im_ext,pc_out,im_addr_out;
output reg[5:0] func;
output reg[8:0] ctrl_sig;
output reg[4:0] rd,rs_out,rt_out;

always@(clk)
begin
	if(clk)
	begin 
		if(flush)  // if branch is taken then data will be flushed out from the latch
		begin
			Read_data1 <= 32'bx;
			Read_data2 <= 32'bx;
			im_ext <= 32'bx;
			func <= 6'bx;
			ctrl_sig <= 9'bx;
			rd <= 5'bx;
			pc_out <= 32'bx;
			im_addr_out <= 32'bx;
			rs_out <= 5'bx;
			rs_out <= 5'bx;
		end
		else
		begin
			Read_data1 <= Read_data1_in;
			Read_data2 <= Read_data2_in;
			im_ext <= im_ext_in;
			func <= func_in;
			ctrl_sig <= ctrl_sig_in;
			rd <= rd_in;
			pc_out <= pc_in;
			im_addr_out <= im_addr_in;
			rs_out <= rs_in;
			rt_out <= rt_in;
		end
	end
end


endmodule
