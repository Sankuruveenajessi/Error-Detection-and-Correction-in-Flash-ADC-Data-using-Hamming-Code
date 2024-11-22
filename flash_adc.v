`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2024 02:47:15
// Design Name: 
// Module Name: flash_adc
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


module flash_adc (
    input [7:0] Vin,        // Scaled input voltage (e.g., 33 for 3.3V)
    output [3:0] binary_out // 3-bit binary output
);
    reg [7:0] Vref [7:0];  // Array of reference voltages, scaled by 10
    wire [7:0] cmp_out;

    // Initialize reference voltages (e.g., 10 for 1.0V, 20 for 2.0V, ...)
    initial begin
        Vref[0] = 10;  // 1.0V
        Vref[1] = 20;  // 2.0V
        Vref[2] = 30;  // 3.0V
        Vref[3] = 40;  // 4.0V
        Vref[4] = 50;  // 5.0V
        Vref[5] = 60;  // 6.0V
        Vref[6] = 70;  // 7.0V
        Vref[7] = 80;  // 8.0V
    end

    // Instantiate comparators
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            comparator comp (
                .Vin(Vin),
                .Vref(Vref[i]),
                .cmp_out(cmp_out[i])
            );
        end
    endgenerate

    // Instantiate the priority encoder
    priority_encoder encoder (
        .cmp(cmp_out),
        .binary_out(binary_out)
    );

endmodule

