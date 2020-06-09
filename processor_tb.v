`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:44:31 06/03/2020
// Design Name:   Processor_5
// Module Name:   D:/DAIICT/Sem 2/ARB/LAB/Processor_5_1.0/processor_tb.v
// Project Name:  Processor_5_1.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Processor_5
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module processor_tb;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	Processor_5 uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
	always #5 clk = ~clk;
	
endmodule

