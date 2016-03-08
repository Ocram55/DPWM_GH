`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:44:24 03/07/2016 
// Design Name: 
// Module Name:    Entradas 
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
module Entradas(
    input wire clkm,
    input wire reset,
    input wire [1:0] datoin,
    input wire selin,
    output wire [1:0] datoout,
    output wire selout
    );
wire cbl1,cbl2;

Entrada_sincronizar s1 (
    .clkm(clkm), 
    .reset(reset), 
    .IN(selin), 
    .IN_SYNC(selout)
    );
Entrada_sincronizar s2 (
    .clkm(clkm), 
    .reset(reset), 
    .IN(datoin[0]), 
    .IN_SYNC(cbl1)
    );
	 
Entrada_sincronizar s3 (
    .clkm(clkm), 
    .reset(reset), 
    .IN(datoin[1]), 
    .IN_SYNC(cbl2)
    );
	 
Control_dato cd1 (
    .clkm(clkm), 
    .reset(reset), 
    .IN(cbl1), 
    .Dato(datoout[0])
    );
	 
Control_dato cd2 (
    .clkm(clkm), 
    .reset(reset), 
    .IN(cbl2), 
    .Dato(datoout[1])
    );
endmodule
