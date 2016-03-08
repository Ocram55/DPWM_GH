`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:21:20 02/27/2016 
// Design Name: 
// Module Name:    ContXbits 
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
module ContXbits(
 
    input wire clkFC,
	 input wire reset,
    output wire  [9:0] cuenta10
    );
reg signed [9:0] num;
 
 
   always @(posedge clkFC, posedge reset)
      if (reset)begin
			num <= 10'b0000000000;
		end
		
		else
			begin
			if (num == 10'd1000)begin
				num <= 10'b0000000000;
			end
         else
				num <= num + 10'd 25;
		end 
		
assign cuenta10=num;

endmodule
