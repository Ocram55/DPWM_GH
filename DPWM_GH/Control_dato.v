`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:51 03/07/2016 
// Design Name: 
// Module Name:    Control_dato 
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
module Control_dato(
    input wire clkm, reset,
    input wire IN,
    output wire Dato
    );

   parameter a	= 2'b00;
   parameter b = 2'b01;
   parameter c = 2'b10;
   parameter d = 2'b11;
 
	reg [1:0] state = a;
	reg salida;

   always@(posedge clkm)
      if (reset) begin
         state <= a;
      end
      else begin
          case (state)
            a : begin
               if (IN) begin
                  state <= b;
						salida <=1'b1; end
               else begin
                  state <= a;
						salida <=1'b0; end
            end
            b : begin
               if (IN) begin
                  state <= c;
						salida <=1'b0; end
               else begin
                  state <= a;
						salida <=1'b0; end
            end
            c : begin
               if (IN) begin
                  state <= c;
						salida <=1'b0; end
               else begin
                  state <= d;
						salida <=1'b0; end
            end
            d : begin
               if (~IN) begin
                  state <= a;
						salida <=1'b0; end
               else begin
                  state <= a;
						salida <=1'b0; end
            end
         endcase
end
   
	assign Dato= salida;



endmodule
