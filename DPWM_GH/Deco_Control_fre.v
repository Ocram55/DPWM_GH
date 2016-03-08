`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:18:32 02/25/2016 
// Design Name: 
// Module Name:    Deco_Control_fre 
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
module Deco_Control_fre(
    input wire [2:0] outcont3,
    output wire [6:0] Paradiv
    );
	 
   reg [6:0] salida;
	
	
	
   always @*
				case (outcont3)
					3'b000  : salida = 7'b0101001;// Cuenta a efectuar 41
					3'b001  : salida = 7'b0011001;//25 
					3'b010  : salida = 7'b0010000;//16
					3'b011  : salida = 7'b0001100;// 12
					3'b100  : salida = 7'b0001010;//10
					3'b101  : salida = 7'b0001000;//8
					3'b110  : salida = 7'b0000111;//7
					3'b111  : salida = 7'b0000110;//6
					default : salida = 7'b0000000;
				endcase
				
	
			
	assign Paradiv=salida;
	
endmodule
