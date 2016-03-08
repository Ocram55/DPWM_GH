`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:06:55 02/29/2016 
// Design Name: 
// Module Name:    Dmux 
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
module Dmux(
	input wire clkm,
	input wire reset,
	input wire [1:0] ad,
   input sel,//selecciona la entrada
   output reg [1:0] cont3, 
   output reg [1:0] cont10
   );

	always@(posedge clkm, posedge reset) 
	begin
		if (reset)
		begin
		cont3 = 2'b00;
		cont10 = 2'b00;
		end
		else begin
			if(sel) begin 
				cont3 = ad;
				cont10 = cont10;
		
				end
			else begin 
				cont3 = cont3; 
				cont10 = ad;
			end
		end
		end
endmodule		