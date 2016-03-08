`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:36 03/03/2016 
// Design Name: 
// Module Name:    FF_D 
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
module FF_D(
    input wire clkm,reset, 
    input wire dato,
    output wire salida
    );
	 
 reg interno;
 
   always @(posedge clkm)
      if (reset) begin
         interno <= 1'b0;
      end else begin
         interno <= dato;
      end

assign salida=interno;
endmodule
