// Testbench module for the Wallace Tree Multiplier fixed and commented by Ian Kenny(122339163)
module tb;

    // Inputs
    reg [3:0] A;  // 4-bit input A
    reg [3:0] B;  // 4-bit input B

    // Outputs
    wire [7:0] prod;  // 8-bit output product

    // Testbench variables
    integer i, j;     // Loop counters for iterating through all possible values of A and B
    integer error;    // Counter to track the number of errors during simulation

    // Instantiate the Unit Under Test (UUT) - the Wallace Tree Multiplier
    wallace uut (
        .A(A),  // Connect input A to the multiplier
        .B(B),  // Connect input B to the multiplier
        .prod(prod)  // Connect output prod to the multiplier
    );

    // Initial block to drive the simulation
    initial begin
        // Create a waveform dump file for debugging
        $dumpfile("waveform.vcd");  // Specify the name of the waveform file
        $dumpvars(0, tb);          // Dump all signals in the testbench module for debugging

        // Initialize error counter to zero
        error = 0;

        // Apply all possible inputs to A and B (4-bit inputs: 0 to 15)
        for (i = 0; i <= 15; i = i + 1) begin  // Loop through all values of A (0 to 15)
            for (j = 0; j <= 15; j = j + 1) begin  // Loop through all values of B (0 to 15)
                A = i;  // Assign current value of i to A
                B = j;  // Assign current value of j to B
                #10;    // Wait for 10 time units to allow the multiplier to stabilize

                // Check if the output product is correct
                if (prod != A * B) begin  // Compare the multiplier output with the expected result
                    error = error + 1;  // Increment error counter if the result is incorrect
                    $display("Error: A = %d, B = %d, Expected = %d, Actual = %d", A, B, A * B, prod);  // Display error details
                end
            end
        end

        // Report simulation results
        if (error == 0) begin  // If no errors were found
            $display("Simulation completed successfully with no errors.");  // Display success message
        end else begin  // If errors were found
            $display("Simulation completed with %d errors.", error);  // Display the number of errors
        end

        // Terminate simulation
        $finish;  // End the simulation
    end

endmodule
