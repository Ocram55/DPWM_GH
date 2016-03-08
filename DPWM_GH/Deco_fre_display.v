`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:22:32 02/25/2016 
// Design Name: 
// Module Name:    Deco_fre_display 
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
module Deco_fre_display(
    input wire [2:0] outcont3,
    output wire [9:0] displayfre
    );

reg [9:0] salida2;


always @*
         case (outcont3)
            3'b000  : salida2 = 10'b0000011110;
            3'b001  : salida2 = 10'b0000110010;
            3'b010  : salida2 = 10'b0001001011;
            3'b011  : salida2 = 10'b0001100100;
            3'b100  : salida2 = 10'b0001111101;
            3'b101  : salida2 = 10'b0010010110;
            3'b110  : salida2 = 10'b0010101111;
            3'b111  : salida2 = 10'b0011001000;
            default : salida2 = 10'b0000000000;
         endcase
		
assign displayfre=salida2;

endmodule
