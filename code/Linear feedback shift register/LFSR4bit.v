`timescale 1ns / 1ps

module LFSR4bit(   //----> Interface
    output reg [3:0] LFSR, // Note that reg is keyword in Verilog and can not be variable name (System output) 
    input clk, // System clock
    input rst // Asynchronous reset
    );

wire feedback = LFSR[0];
always @(posedge clk, posedge rst)
	begin
		if (rst)  // Asynchronous clear
			LFSR <= 4'b1000;
		 else begin
		  LFSR[3] <= feedback; // Use non-blocking assignment
		  LFSR[2] <= LFSR[3] ^ feedback; // XOR GATE between feedback and first flipflop
		  LFSR[1] <= LFSR[2];
		  LFSR[0] <= LFSR[1];
		end
	end

endmodule
