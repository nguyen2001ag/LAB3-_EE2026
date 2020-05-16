`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 05:07:03 AM
// Design Name: 
// Module Name: gen_freq
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


module gen_freq (
    input CLOCK,
    output [27:0] freq
    );
    
    reg [27:0] COUNT = 'b0;
    always @ (posedge CLOCK)
    begin
        COUNT <= COUNT+1;
    end
    
    assign freq = COUNT;
endmodule
