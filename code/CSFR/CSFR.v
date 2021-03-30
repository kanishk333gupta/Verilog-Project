`timescale 1ns / 1ps

module CFSR4bit( //----> Interface
    output reg [3:0] CFSR, //System output
    input clk, // System clock
    input rst // Asynchronous reset
    );
wire feedback =((~CFSR[3])&(~CFSR[2])&(~CFSR[1]))^ CFSR[0];

always @(posedge clk, posedge rst)
	begin
		if (rst)           // Asynchronous clear
			CFSR <= 4'b1111; // Initial seed
		 else begin
		  CFSR[3] <= feedback; // Use non-blocking assignment
		  CFSR[2] <= CFSR[3] ^ feedback; // XOR GATE between feedback and first flipflop
		  CFSR[1] <= CFSR[2];
		  CFSR[0] <= CFSR[1];
		end
	end

endmodule
