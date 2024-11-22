`timescale 1ns/1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2024 22:35:01
// Design Name: 
// Module Name: tpm_tb
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


module topmodule_tb;
    reg [7:0] Vin;          // Input analog voltage (scaled)
    reg parity_type;        // Parity type: 0 for even, 1 for odd
    wire [7:1] outdata;     // Output data

    // Instantiate the top module
    topmodule uut (
        .Vin(Vin),
        .parity_type(parity_type),
        .outdata(outdata)
    );

    initial begin
        $dumpfile("topmodule_tb.vcd");
        $dumpvars(0, topmodule_tb);

        // Initialize inputs
        parity_type = 0;

        // Apply test cases
        // Test Case 1: Vin = 25 (2.5V scaled), Parity = Even
        Vin = 8'd25;
        #10;
        $display("Vin = %d, Outdata = %b", Vin, outdata);

        // Test Case 2: Vin = 45 (4.5V scaled), Parity = Odd
        Vin = 8'd55;
        parity_type = 1;
        #10;
        $display("Vin = %d, Outdata = %b", Vin, outdata);

        // Test Case 3: Vin = 75 (7.5V scaled), Parity = Even
        Vin = 8'd75;
        parity_type = 0;
        #10;
        $display("Vin = %d, Outdata = %b", Vin, outdata);

        // Test Case 4: Vin = 15 (1.5V scaled), Parity = Odd
        Vin = 8'd78;
        parity_type = 0;
        #10;
        $display("Vin = %d, Outdata = %b", Vin, outdata);

        $finish;
    end
endmodule

