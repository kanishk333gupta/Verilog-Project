`timescale 1ns / 1ps

module CFSRtest;
	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] CFSR;

	// Instantiate the Unit Under Test (UUT)
	CFSR4bit uut (
		.CFSR(CFSR), 
		.clk(clk), 
		.rst(rst)
	);

	initial
		begin
			 clk = 0; // setting intial clock 0 intially
			 rst = 1; // setting reset 1 
			 #15;     // delay of 15 unit of time
			 rst = 0; // setting reset 0  
			 #200;	 // delay of 200 unit of time
		end

	always
		begin
			 #5;
			 clk = ~ clk; // changing clock every 5 ns
		end
		CFSR4bit DUT(CFSR,clk,rst); //DUT->Device Under Test
endmodule

