`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:49:24 02/25/2016 
// Design Name: 
// Module Name:    Multiplexor 
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
module Multiplexor(
    input wire clkm, reset,
    input wire [9:0] DecoFre,
    input wire [9:0] Conta10,
    input wire SM,
    output wire [9:0] datodis
    );
	 
	 reg [9:0] dato;
	 
	 
   always @(posedge clkm, posedge reset)
		if (reset) 
			dato <= 10'b0000000000;
		else begin
			if (SM) 
				dato <= DecoFre;
			else
				dato <= Conta10;
		end
		
assign datodis= dato;

endmodule
