`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:47:05 05/26/2020 
// Design Name: 
// Module Name:    Processor_5 
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
module Processor_5(clk);
input clk;
wire [31:0] ins,ins_out,br_pc,br_pc_exe,im_ext,im_ext_in,r1_in,r2_in,r1,r2,alu_result_exe,alu_result_wb;
wire [31:0] Address,Write_data,Read_data,Read_data_out,Write_Back,pc_fet,pc_dec,pc_exe,im_addr_dec,im_addr_exe;
wire br,br_exe,write_en;
wire [4:0] r_dest_dec,r_dest_exe,r_dest_mem,r_dest_wb,rs_in,rt_in,rs_out,rt_out;
wire [5:0] func_in,func;
wire [8:0] ctrl_sig_dec,ctrl_sig_exe,ctrl_sig_mem,ctrl_sig_wb;
wire [1:0] cmp;

// Fetch
	Fetch F1(clk,ins,br,br_pc,pc_fet);  
	//Fetch(clk,ins,br,br_pc,pc);

// IF_ID
	IF_ID I1(br,pc_fet,clk,ins,ins_out,pc_dec);   
	//IF_ID(flush,pc_in,clk,ins,ins_out,pc_out);
	
// Decode
	Decode D1(clk,r_dest_wb,write_en,Write_Back,ins_out,r1_in,r2_in,im_ext_in,im_addr_dec,ctrl_sig_dec,func_in,r_dest_dec,rs_in,rt_in);  
	//Decode(clk,rd_wb,w_en_wb,d_in_wb,ins,r1,r2,im_ext,im_addr,ctrl_sig,func,WriteRegister,rs_out,rt_out);

// ID_IE
	ID_IE I2(br,pc_dec,clk,r1_in,r2_in,im_ext_in,im_addr_dec,func_in,ctrl_sig_dec,r_dest_dec,rs_in,rt_in,rs_out,rt_out,ctrl_sig_exe,r1,r2,im_ext,im_addr_exe,func,r_dest_exe,pc_exe);
	//ID_IE(flush,pc_in,clk,Read_data1_in,Read_data2_in,im_ext_in,im_addr_in,func_in,ctrl_sig_in,rd_in,rs_in,rt_in,rs_out,rt_out,ctrl_sig,Read_data1,Read_data2,im_ext,im_addr_out,func,rd,pc_out);

// Execute
	Execute E1(pc_exe,r1,r2,r_dest_mem,r_dest_wb,rs_out,rt_out,im_addr_exe,im_ext,func,ctrl_sig_exe,Write_Back,Address,alu_result_exe,cmp,br_pc,br);
	//Execute(pc_exe,Read_data1,Read_data2,mem_rd,wb_rd,rs,rt,im_addr1,im_ext,funcy,ctrl_sig,mem_wb_data,ex_mem_data,alu_result,cmp,br_pc,br);

// IE_IM
	IE_IM I3(clk,alu_result_exe,ctrl_sig_exe,r_dest_exe,r2,Address,Write_data,ctrl_sig_mem,r_dest_mem);
	//IE_IM(clk,ALU_result,ctrl_sig_in,rd_in,Read_data2,Address,Write_data,ctrl_sig,rd);
	
// Memory
	Data_Mem M1(clk,Address,Write_data,ctrl_sig_mem,Read_data);
	//Data_Mem(CLK,Address,Write_data,ctrl_sig,Read_data);

// IM_IW
	IM_IW I4(clk,Read_data,Address,ctrl_sig_mem,r_dest_mem,Read_data_out,alu_result_wb,ctrl_sig_wb,write_en,r_dest_wb);
	//IM_IW(CLK,Read_data_in,ALU_result_in,ctrl_sig_in,rd_in,Read_data_out,ALU_result_out,ctrl_sig_out,write_en,rd);

// Write-Back
	Write_Back W1(Read_data_out,alu_result_wb,ctrl_sig_wb,Write_Back);
	//Write_Back(Read_data,ALU_result,ctrl_sig,Write_Back);	
endmodule
