`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:44:13 02/27/2016 
// Design Name: 
// Module Name:    Digitos_display 
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
module Digitos_display( /////Pensar como hacerlo.
    input wire clkm,
    input wire [9:0] datodis,
    input wire [7:0] in0,in1,in2,in3
    );

in3<=0;

always @(posedge clkm)
	if (datodis==166) begin
      in0<=6;
		in1<=6;
		in
   end
   else if (<condition>) begin
      <statement>;
   end
   else begin
      <statement>;
   end



endmodule
