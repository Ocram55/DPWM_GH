`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:10:19 02/25/2016 
// Design Name: 
// Module Name:    Comparador 
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
module Comparador(
    input wire [9:0] Contaprin,
    input wire [9:0] Conta10,
    output wire Gatebuck
    );

   reg salida;

   always @* //Preguntar cual reloj se debe poner aqui
		if (Contaprin < Conta10)
         salida <= 1'b1;
      else if (Conta10==10'b1111111111)
			salida <= 1'b1;
		else
         salida <= 1'b0;

assign Gatebuck=salida;
endmodule
