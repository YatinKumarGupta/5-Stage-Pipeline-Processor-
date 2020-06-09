`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:54:34 05/26/2020 
// Design Name: 
// Module Name:    Execute 
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
module Execute(pc_exe,Read_data1,Read_data2,mem_rd,wb_rd,rs,rt,im_addr1,im_ext,funcy,ctrl_sig,mem_wb_data,ex_mem_data,alu_result,cmp,br_pc,br);
input [31:0] pc_exe,Read_data1,Read_data2,im_ext,im_addr1,mem_wb_data,ex_mem_data;
input [5:0] funcy;
input [4:0] mem_rd,wb_rd,rs,rt;
input [8:0] ctrl_sig;
output [1:0] cmp;
output [31:0] alu_result;
output [31:0] br_pc;
output br;
wire [1:0] flag,ForA,ForB;
wire [3:0] ALU_ctrl;
wire [31:0] r2,x1,x2;
Forwading_unit F1(mem_rd,wb_rd,rs,rt,ForA,ForB); // Forwading Unit
mux_4x1 m1(Read_data1,mem_wb_data,ex_mem_data,ForA,x1); // Mux for selecting the first operand 
mux_4x1 m2(Read_data2,mem_wb_data,ex_mem_data,ForB,x2); // Mux for selecting the second operand 
ALU_control A1(funcy,ctrl_sig[1:0],ALU_ctrl);
assign r2 = ctrl_sig[7] ? im_ext : x2;  
ALU A2(ALU_ctrl,x1,r2,alu_result,flag,cmp);
Branch B1(ALU_ctrl,im_addr1,im_ext,pc_exe,ctrl_sig[2],{ctrl_sig[1],ctrl_sig[0]},flag,br_pc,br); 
endmodule
