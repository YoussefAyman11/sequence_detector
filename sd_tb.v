`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2023 01:36:06 PM
// Design Name: 
// Module Name: sd_tb
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


module sd_tb();

parameter clk_period = 10;
reg clk = 0;
always #(clk_period/2) clk = ~clk;

integer i;
reg reset,x;
wire y;
reg [21:0] arr;
sequence_detector_010_1001 dut(
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y)
);

initial begin
    reset = 0;
    #(clk_period);
    reset = 1;
    
    arr = 22'b0111001010100100010010;
    for(i = 0; i < 22; i = i + 1) begin
        repeat(1) @(posedge clk); 
        x = arr[21-i];
        
    end
    #(clk_period);
    $finish();
end 

endmodule
