`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:00:50 02/29/2016 
// Design Name: 
// Module Name:    Display_MUX 
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
module Display_MUX(
	input wire clk, reset,
	input wire  [9:0] number,
	output reg [3:0] an,
	output reg [6:0] sseg
    );
	 
wire [6:0] in0,in1,in2,in3;
wire [3:0] mil,hundreds,tens,ones;

Convertidor_binario_BCD convertidor1 (
    .number(number), 
    .mil(mil), 
    .hundreds(hundreds), 
    .tens(tens), 
    .ones(ones)
    );
	 
Display display1 (
    .ones(ones), 
    .tens(tens), 
    .hundreds(hundreds), 
    .mil(mil), 
    .in0(in0), 
    .in1(in1), 
    .in2(in2), 
    .in3(in3)
    );


// Refrescamiento alrededor de 800 Hz
localparam N=18; //Era 18
reg signed [N-1:0] q_reg;


always @(posedge clk,posedge reset)
	if(reset)
		q_reg <=0;
	else
		q_reg <= q_reg + 1'b1;

always @*
	case(q_reg[N-1:N-2])
		2'b00:
			begin
				an=4'b1110;
				sseg=in0;
			end

		2'b01:
			begin
				an=4'b1101;
				sseg=in1;
			end

		2'b10:
			begin
				an=4'b1011;
				sseg=in2;
			end
			
		default :
			begin
				an = 4'b0111;
				sseg = in3;
			end
	endcase
	
	
endmodule
