`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:01:51 02/29/2016 
// Design Name: 
// Module Name:    Divisordefrecuencia 
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
module Divisordefrecuencia(
    input wire clkm,
	 input wire reset,
    input wire [6:0] division,
    output reg Fr
    );
reg signed [6:0] frec;

	always@(posedge clkm, posedge reset) 
	if (reset)begin
		frec <=7'b0000000;
		Fr <=0; 
		end
	else 
		if (frec==division)begin
		frec<=7'b0000000;
		Fr <= ~ Fr;
		end
		else
		frec<=frec+ 7 'd1;
		
endmodule
