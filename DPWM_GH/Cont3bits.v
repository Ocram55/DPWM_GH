`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:10:56 02/27/2016 
// Design Name: 
// Module Name:    Cont3bits 
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
module Cont3bits(
	 input wire  Aumentar,
    input wire Disminuir,
	 input wire reset,
    input wire clkm,
    output wire  [2:0] outcont3
    );
reg signed [2:0] cuenta;
  
 always @(posedge clkm , posedge reset)
	if (reset)
		begin
		cuenta <= 3'b000;
		end
	
	else begin
      if (Aumentar==1'b1)
		begin
         cuenta <= cuenta + 1'b1;
			if (cuenta > 8)begin
			cuenta <= 0;
			end
		end 
		else if(Disminuir==1'b1) 
		begin
         cuenta <= cuenta - 1'b1;
			if (cuenta < 0)begin
			cuenta <= 7;
			end			
		end 
		else  cuenta <=cuenta;
		end
assign outcont3=cuenta;

endmodule
