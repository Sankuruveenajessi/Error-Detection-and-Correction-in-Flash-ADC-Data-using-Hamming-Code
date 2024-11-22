`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2024 21:57:42
// Design Name: 
// Module Name: tpm
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


module topmodule( 
    input [7:0] Vin,
    input parity_type,
    output [7:1] outdata
);
    wire [2:0] fdata;    // 3-bit output from flash ADC
    wire [4:1] hamming_input; // 4-bit data for Hamming Encoder
    wire [7:1] encoded_data; // 7-bit Hamming encoded output
    
    wire [4:1] decoded_data; // 4-bit data output from Hamming Decoder
    wire [7:1] corrected_data; // 7-bit corrected data output

    // Flash ADC
    flash_adc f1 (
        .Vin(Vin), 
        .binary_out(fdata)
    );

    // Extend 3-bit ADC output to 4-bit for Hamming Encoder
    assign hamming_input = {1'b0, fdata};

    // Hamming Encoder
    hamming_code_encoder hcm (
        .data_in(hamming_input),
        .parity_type(parity_type),
        .code_out(encoded_data)
    );

    // Hamming Decoder
    hamming_code_decoder hcd (
        .code_in(encoded_data),
        .parity_type(parity_type),
        .data_out(decoded_data)
         // Error flag not connected in this case
    );

    // Hamming Error Correction
    hamming_error_correction hed (
        .code_in(encoded_data+1'b1),
        .parity_type(parity_type),
        .data_out(corrected_data)
        // Error flag not connected in this case
    );

    // Output the corrected data
    assign outdata = corrected_data;

endmodule

/*module topmodule( 
input [7:0] Vin,
input parity_type,
output [6:0] outdata

 );
  wire fdata;
 flash_adc f1 (
     .Vin(Vin),        // Scaled input voltage (e.g., 33 for 3.3V)
     .binary_out(fdata) // 3-bit binary output
);
  wire data;  
hamming_code_encoder hcm(
    .data_in(fdata),   
    .parity_type(parity_type),    
    .code_out(data)  
    );
    wire data1;
 hamming_code_decoder hcd(
     .code_in(data),   // 7-bit Hamming code input
     .parity_type(parity_type),     // Parity type: 0 for even, 1 for odd
    .data_out(data1) // 4-bit message bits data output
          // Error flag
    );
    
   hamming_error_correction hed(
     .code_in(data1),   // 7-bit Hamming code input
    .parity_type(parity_type),     // Parity type: 0 for even, 1 for odd
    .data_out(outdata) // 7-bit corrected data output
           // Error flag
    );
endmodule*/
