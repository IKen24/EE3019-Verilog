// multiplier module created by Ian Kenny(122339163)
module multiplier #(parameter WIDTH = 4) ( // Parameter WIDTH defines the bit-width of inputs (default is 4)
    input  wire [WIDTH-1:0] A,  // Input A with WIDTH bits
    input  wire [WIDTH-1:0] B,  // Input B with WIDTH bits
    output reg  [2*WIDTH-1:0] Product  // Output Product with 2*WIDTH bits (to hold the result of multiplication)
);

    // Combinational logic block
    always @(*) begin  // Sensitive to changes in A or B
        Product = A * B;  // Perform multiplication and assign the result to Product
    end

endmodule
