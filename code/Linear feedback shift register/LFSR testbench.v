`timescale 1ns / 1ps

module LFSRtest;
	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] LFSR;
	// Instantiate the Unit Under Test (UUT)
	LFSR4bit uut (
		.LFSR(LFSR), 
		.clk(clk), 
		.rst(rst)
	);

	initial
		begin
			 clk = 0; // setting intial clock 0 intially
			 rst = 1; // setting reset 1			 
			 #15; // 15 unit time delay
			 rst = 0; //setting reset 0  
			 #200;	// 200 unit time delay
		end

	always
		begin
			 #5;
			 clk = ~ clk; // changing clock every 5 ns
		end
		LFSR4bit DUT(LFSR,clk,rst);//DUT->Device Under Test
endmodule

