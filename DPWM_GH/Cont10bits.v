`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:18:51 02/27/2016 
// Design Name: 
// Module Name:    Cont10bits 
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
module Cont10bits(
    input wire  Aumentarc,
    input wire Disminuirc,
    input wire clkm,
	 input wire reset,
    output wire  [9:0] outcont10
    );
reg signed[9:0] cont;


   always @(posedge clkm, posedge reset)
		
		if (reset)
			begin
			cont <= 10'b0000000000;
			end

		else begin
			if (Aumentarc==1'b1)
				begin
					if (cont == 10'd 1000)begin
						cont <= 10'd 1000;
						end
					else cont <= cont + 10'd 25;
				end 
			else if(Disminuirc==1'b1)
				begin
					if (cont == 10'b0000000000)begin
						cont <= 10'd0;
					end
					else cont <= cont - 10'd 25;
				end 
			else  
				begin
					cont <= cont;
				end	
		end
			
assign outcont10=cont;

endmodule 