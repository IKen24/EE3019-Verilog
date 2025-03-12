// Testbench module for the multiplier created by Ian Kenny(12233963)
module tb_multiplier;
    parameter WIDTH = 4;  // Define the bit-width of inputs (default is 4)

    // Testbench signals
    reg  [WIDTH-1:0] A;  // Input A with WIDTH bits
    reg  [WIDTH-1:0] B;  // Input B with WIDTH bits
    wire [2*WIDTH-1:0] Product;  // Output Product with 2*WIDTH bits (to hold the multiplication result)

    // Instantiate the multiplier module
    multiplier #(WIDTH) uut (  // Instantiate the multiplier with the specified WIDTH
        .A(A),       // Connect input A of the multiplier to testbench signal A
        .B(B),       // Connect input B of the multiplier to testbench signal B
        .Product(Product)  // Connect output Product of the multiplier to testbench signal Product
    );

    // Testbench stimulus
    initial begin
        // Test case 1: Multiply 3 (0011) by 2 (0010)
        A = 4'b0011; // Assign A = 3 in binary
        B = 4'b0010; // Assign B = 2 in binary
        #10;         // Wait for 10 time units to allow the multiplier to compute the result
        $display("A = %b, B = %b, Product = %b", A, B, Product);  // Display inputs and output

        // Test case 2: Multiply 5 (0101) by 3 (0011)
        A = 4'b0101; // Assign A = 5 in binary
        B = 4'b0011; // Assign B = 3 in binary
        #10;         // Wait for 10 time units
        $display("A = %b, B = %b, Product = %b", A, B, Product);  // Display inputs and output

        // Test case 3: Multiply 15 (1111) by 15 (1111)
        A = 4'b1111; // Assign A = 15 in binary
        B = 4'b1111; // Assign B = 15 in binary
        #10;         // Wait for 10 time units
        $display("A = %b, B = %b, Product = %b", A, B, Product);  // Display inputs and output

        // Test case 4: Multiply 0 (0000) by 15 (1111)
        A = 4'b0000; // Assign A = 0 in binary
        B = 4'b1111; // Assign B = 15 in binary
        #10;         // Wait for 10 time units
        $display("A = %b, B = %b, Product = %b", A, B, Product);  // Display inputs and output

        // Test case 5: Multiply 10 (1010) by 5 (0101)
        A = 4'b1010; // Assign A = 10 in binary
        B = 4'b0101; // Assign B = 5 in binary
        #10;         // Wait for 10 time units
        $display("A = %b, B = %b, Product = %b", A, B, Product);  // Display inputs and output

        // End simulation
        $stop;  // Stop the simulation
    end
endmodule
