`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2023 01:23:40 PM
// Design Name: 
// Module Name: 2_sequence_detector
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


module sequence_detector_010_1001(
    input clk,
    input reset,
    input x,
    output y
    );
    
    localparam s0 = 3'b000;
    localparam s1 = 3'b001;
    localparam s2 = 3'b010;
    localparam s3 = 3'b011;
    localparam s4 = 3'b100;
    localparam s5 = 3'b101;
    
    reg [2:0] state_reg,state_next;
    
    always @(posedge clk,negedge reset) begin
        if(!reset)
            state_reg <= 0;
        else
            state_reg <= state_next;
    end 
    
    always @(*) begin
        case(state_reg)
            s0: begin
                if(x)
                    state_next = s4;
                else
                    state_next = s1;
            end                    
            
            s1: begin
                if(x)
                    state_next = s2;
                else
                    state_next = state_reg;
            end 
            
            s2: begin
                if(x)
                    state_next = s4;
                else
                    state_next = s3;
            end                    
            
            s3: begin
                if(x)
                    state_next = s2;
                else
                    state_next = s5;
            end 
            
            s4: begin
                if(x)
                    state_next = s4;
                else
                    state_next = s3;
            end                    
            
            s5: begin
                if(x)
                    state_next = s2;
                else
                    state_next = s1;
            end
            
            default: state_next = state_reg; 
        endcase
    end 
    
    assign y = ((state_next == s3) & (state_reg == s2))|((state_next == s2) & (state_reg == s5));
    
endmodule
