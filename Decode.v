`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:01:37 04/10/2020 
// Design Name: 
// Module Name:    Decode 
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
module Decode(clk,rd_wb,w_en_wb,d_in_wb,ins,r1,r2,im_ext,im_addr,ctrl_sig,func,WriteRegister,rs_out,rt_out);
input clk,w_en_wb;
input [4:0] rd_wb;	// location
input [31:0] d_in_wb; // Value from Write Back Stage
input[31:0] ins;
output [31:0] im_ext,r1,r2,im_addr;
output [8:0] ctrl_sig;
output [5:0] func;
output [4:0] WriteRegister,rs_out,rt_out;
wire [8:0] ctrl_sig_in; // Control Signal: {RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,AlUOp_1,ALUOp_0}
wire [4:0] rs,rt,rd;
wire [5:0] opcode;
wire RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,AlUOp_1,ALUOp_0;
wire [1:0] ALUOp;
wire [15:0] im;
wire [25:0] pc_jump;
wire z;
assign opcode = ins[31:26];
control_unit C1(opcode,ctrl_sig_in);
assign {RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp_1,ALUOp_0} = ctrl_sig;
assign ALUOp = {ALUOp_1,ALUOp_0};
assign ctrl_sig = ctrl_sig_in;
	
// R-Type:opcode+rs+rt+rd+shmt+func
assign z = ins[31] | ins[30] | ins[29] | ins[28] | ins[27] | ins[26];
assign rd = ins[15:11];
assign func = z ? ins[31:26] : ins[5:0];  // Yatin func is a VARIABLE!!!!!!!!! 
	
// I-Type:opcode+rs+rt+im 
assign im = ins[15:0];
assign im_ext = {{16{ins[15]}},im};  // sign extended value 
	
// J-Type:opcode+imm
assign im_addr = {{6{ins[25]}},ins[25:0]};

// common 
assign rs = ins[25:21];
assign rt = ins[20:16];

// Write Register (MUX)
																													
assign WriteRegister = RegDst? rd : rt;																
assign rs_out = rs;
assign rt_out = rt;

reg_bank re1(clk,r1,r2,rs,rt,rd_wb,w_en_wb,d_in_wb);
//reg_bank(clk,r1,r2,rs1,rs2,rd,w_en,d_in);
endmodule
