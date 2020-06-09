`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:22:42 06/02/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(ALU_ctrl,r1,r2,r0,flag,cmp);
input [3:0] ALU_ctrl;
input [31:0] r1,r2;
reg [32:0] r0_dum;
output reg [1:0] cmp;
reg zero;
output reg[31:0] r0;
output reg [1:0]flag;
always@(*)
begin
case(ALU_ctrl)
	4'd0:   r0_dum = 0; 
	4'd1:   r0_dum = r1 + r2;
	4'd2:   r0_dum = r1 - r2;
	4'd3:   r0_dum = r1 & r2;
	4'd4:   r0_dum = r1 | r2;
	4'd5:   r0_dum = r1 ^ r2;
	4'd6:   r0_dum = ~r1;
	4'd7: if ( r1 > r2 ) 
				cmp = 2'b10;
			else if ( r1 < r2 )
				cmp = 2'b01;
			else if ( r1 == r2 )
				cmp = 2'b00;
			else 
				cmp = 2'b11;
	4'd8: r0_dum = r1 | r2;
	4'd9: r0_dum = 33'b0;
	4'd10: r0_dum = r1 + r2;
	4'd11: r0_dum = r1 - r2;
endcase

if (r0_dum)
	zero = 0;
else 
	zero = 1;

assign flag = {r0_dum[32],zero};  // {carry,zero}
assign r0 = r0_dum[31:0];

end
endmodule
