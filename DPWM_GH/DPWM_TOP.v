`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:29 03/02/2016 
// Design Name: 
// Module Name:    DPWM_TOP 
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
module DPWM_TOP(
    input wire clkm,
    input wire reset,
    input wire selein,
    input wire [1:0] entAD,
    output wire salidaPWM,
	 output wire [3:0] an,
	 output wire [6:0] sseg
    );

wire [2:0] outcont3;
wire [9:0] outcont10,displayfre,cuenta10,datodis; 
wire [1:0] cont10;
wire [1:0] cont3;
wire [6:0] Paradiv;
wire FrOuput,SM;
wire [1:0] ad;

Entradas u0 (
    .clkm(clkm), 
    .reset(reset), 
    .datoin(entAD), 
    .selin(selein), 
    .datoout(ad), 
    .selout(SM)
    );


Dmux u1 (
    .clkm(clkm), 
    .reset(reset), 
    .ad(ad), 
    .sel(SM), 
    .cont3(cont3),//sale 
    .cont10(cont10)//sale
    );
	 
Cont3bits u2 (
    .Aumentar(cont3[0]), 
    .Disminuir(cont3[1]), 
    .reset(reset), 
    .clkm(clkm), 
    .outcont3(outcont3)//sale
    );
	 
Cont10bits u3 (
    .Aumentarc(cont10[0]), 
    .Disminuirc(cont10[1]), 
    .clkm(clkm), 
    .reset(reset), 
    .outcont10(outcont10)//Sale
    );
	 
Deco_Control_fre u4 ( 
    .outcont3(outcont3), 
    .Paradiv(Paradiv)//Sale
    );

Deco_fre_display u5 ( 
    .outcont3(outcont3), 
    .displayfre(displayfre)//Sale
    );
	 
Divisordefrecuencia u6 (
    .clkm(clkm), 
    .reset(reset), 
    .division(Paradiv), 
    .Fr(Fr) //Sale
    );
 
   BUFG BUFG_inst (
      .O(FrOuput), // 1-bit output: Clock buffer output
      .I(Fr)  // 1-bit input: Clock buffer input
   );
	
ContXbits u7 (
    .clkFC(FrOuput), 
    .reset(reset), 
    .cuenta10(cuenta10)//Sale
    );

Comparador u8 ( 
    .Contaprin(cuenta10), 
    .Conta10(outcont10), 
    .Gatebuck(salidaPWM) //SALIDA PRINCIPAL DEL PWM
    );
	 
Multiplexor u9 (
    .clkm(clkm), 
    .reset(reset), 
    .DecoFre(displayfre), 
    .Conta10(outcont10), 
    .SM(SM), 
    .datodis(datodis) //Sale
    );
	 
Display_MUX u10 (
    .clk(clkm), 
    .reset(reset), 
    .number(datodis), 
    .an(an),//Sale 
    .sseg(sseg)//Sale
    );

endmodule
