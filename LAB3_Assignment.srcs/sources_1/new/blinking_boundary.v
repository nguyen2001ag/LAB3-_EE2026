`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 04:13:59 AM
// Design Name: 
// Module Name: blinking_boundary
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


module blinking_boundary(
    input CLOCK,
    output  LED
    );
    
    reg [23:0] COUNT;
        
    always @ (posedge CLOCK) begin
        COUNT <= COUNT +1;
    end
    
    assign LED = COUNT[23];
endmodule
