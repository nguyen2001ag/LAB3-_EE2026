`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2020 08:52:42 AM
// Design Name: 
// Module Name: speed_selection
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


module speed_selection(
    input CLOCK,
    input A,
    input B,
    input C,
    output reg [6:0] LED,
    output reg [7:0] segments
    );
    
    wire [27:0] freq;
    wire current_freq;
    wire high_freq, medium_freq, low_freq;
    
    gen_freq get_freq(CLOCK, freq);
    assign high_freq = freq[22];
    assign medium_freq = freq[25];
    assign low_freq = freq[27];
    assign current_freq = C? high_freq : (B? medium_freq : (A? low_freq: medium_freq));
    
    reg[2:0] count = 3'b0;
    reg[4:0] cycle = 1;
    
    initial begin
        segments =8'b1100_0000;
    end
    
//    always @(posedge CLOCK)
//        begin 
//            if (cycle == 1)    begin segments <= 7'b100_0000; dp <= 1;
//        end
    always @ (posedge current_freq) 
        begin
        if (cycle == 1 ) segments <= 8'b1100_0000;
            count <= count +1;
            case (count)
                3'b000: 
                    begin
                        LED[0] <=1;
                        LED[6:1] <= 0;
                    end
                3'b001: 
                    begin
                        LED[1] <=1;
                        LED[6:2] <= 0;
                        LED[0] <= 0;
                    end
                3'b010: 
                    begin
                        LED[2] <=1;
                        LED[6:3] <= 0;
                        LED[1:0] <= 0;
                    end
                 3'b011: 
                    begin
                        LED[3] <=1;
                        LED[6:4] <= 0;
                        LED [2:0] <= 0;
                    end
                 3'b100: 
                    begin
                        LED[4] <=1;
                        LED[6:5] <= 0;
                        LED[3:0] <= 0;
                    end
                 3'b101: 
                    begin
                        LED[5] <=1;
                        LED[6] <= 0;
                        LED[4:0] <= 0;
                    end
                 3'b110: 
                    begin
                        LED[6] <=1;
                        LED[5:0] <= 0;
                    end
                default : 
                    begin
                        count <= 3'b001;
                        LED[0] <=1;
                        LED[6:1] <= 0;
                        cycle <= cycle +1;
                        case (cycle)
                            0: segments <= 8'b1100_0000; 
                            1: segments <= 8'b1111_1001; 
                            2: segments <= 8'b1010_0100; 
                            3: segments <= 8'b1011_0000; 
                            4: segments <= 8'b1001_1001; 
                            5: segments <= 8'b1001_0010; 
                            6: segments <= 8'b1000_0010; 
                            7: segments <= 8'b1111_1000; 
                            8: segments <= 8'b1000_0000; 
                            9: segments <= 8'b1001_0000; 
                            10:segments <= 8'b1010_1011; 
                            11:segments <= 8'b1001_0000; 
                            12:segments <= 8'b1100_0001;
                            13:segments <= 8'b1001_0001; 
                            14:segments <= 8'b1000_0110; 
                            15:segments <= 8'b1010_1011; 
                            16:segments <= 8'b0111_1111; 
                            default: begin segments <= 8'b1010_1011; cycle <= 11;end
                        endcase
                    end
            endcase
          end

endmodule
