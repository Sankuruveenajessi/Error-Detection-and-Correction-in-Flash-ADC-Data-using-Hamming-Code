`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2024 03:04:41
// Design Name: 
// Module Name: priority_encoder
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

module priority_encoder (
    input [7:0] cmp,
    output reg [2:0] binary_out
);
    always @(*) begin
        casex(cmp)
            8'b1xxxxxxx: binary_out = 3'b111;
            8'b01xxxxxx: binary_out = 3'b110;
            8'b001xxxxx: binary_out = 3'b101;
            8'b0001xxxx: binary_out = 3'b100;
            8'b00001xxx: binary_out = 3'b011;
            8'b000001xx: binary_out = 3'b010;
            8'b0000001x: binary_out = 3'b001;
            8'b00000001: binary_out = 3'b000;
            default: binary_out = 3'b000;
        endcase
    end
endmodule

