`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:56:35 02/29/2016 
// Design Name: 
// Module Name:    Convertidor_binario_BCD 
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
module Convertidor_binario_BCD(
   input  [9:0] number,
	output reg [3:0] mil,
   output reg [3:0] hundreds,
   output reg [3:0] tens,
   output reg [3:0] ones
   );
   // Internal variable for storing bits
   reg [25:0] shift;
   integer i;
   
   always @(number)
   begin
      // Clear previous number and store new number in shift register
      shift[25:10] = 0;
      shift[9:0] = number;
      
      // Loop eight times
      for (i=0; i<10; i=i+1) begin
         if (shift[13:10] >= 5)
            shift[13:10] = shift[13:10] + 4'b0011;
            
         if (shift[17:14] >= 5)
            shift[17:14] = shift[17:14] + 4'b0011;
            
         if (shift[21:18] >= 5)
            shift[21:18] = shift[21:18] + 4'b0011;
         
			if (shift[25:22] >= 5)
            shift[25:22] = shift[25:22] + 4'b0011;
				
         // Shift entire register left once
         shift = shift << 1;
      end
      
      // Push decimal numbers to output
		mil      = shift[25:22];
      hundreds = shift[21:18];
      tens     = shift[17:14];
      ones     = shift[13:10];
   end

endmodule
