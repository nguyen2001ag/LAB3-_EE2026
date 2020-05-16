`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 09:48:02 AM
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main(
    input CLOCK,
    input A,
    input B,
    input C,
    output [6:0] LED,
    output [7:0] seg,
    output [3:0] AN);
    
    assign AN = 4'b0110;
    
    
    blinking_boundary blinking_led(CLOCK, LED[7]);
    speed_selection trailing_LED_and_seven_segment(CLOCK,A,B,C, LED[6:0], seg[7:0]);

endmodule
