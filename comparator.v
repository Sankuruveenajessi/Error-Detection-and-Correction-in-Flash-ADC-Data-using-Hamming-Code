`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2024 02:47:40
// Design Name: 
// Module Name: comparator
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


module comparator (
    input [7:0] Vin,  // Scaled voltage input (multiplied by 10)
    input [7:0] Vref, // Scaled reference voltage
    output reg cmp_out
);
    always @(*) begin
        if (Vin > Vref)
            cmp_out = 1;
        else
            cmp_out = 0;
    end
endmodule


