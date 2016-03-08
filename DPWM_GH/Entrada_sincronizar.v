`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:53 03/03/2016 
// Design Name: 
// Module Name:    Entrada_sincronizar 
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
module Entrada_sincronizar(
    input wire clkm,reset,
	 input wire IN,
    output wire IN_SYNC
    );

wire c1,c2,c3,c4;
reg salida;
reg salidaactual;

 FF_D d1 (.clkm(clkm), .reset(reset), .dato(IN), .salida(c1));
 FF_D d2 (.clkm(clkm), .reset(reset), .dato(c1), .salida(c2));
 FF_D d3 (.clkm(clkm), .reset(reset), .dato(c2), .salida(c3));
 FF_D d4 (.clkm(clkm), .reset(reset), .dato(c3), .salida(c4));

always @*
	if (c1==1'b1 & c2==1'b1 & c3==1'b1 & c4==1'b1)
		salida = 1'b1;
	else
		salida=1'b0;

assign IN_SYNC=salida;

endmodule
