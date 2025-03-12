// Wallace Tree Multiplier module fixed and commented by Ian Kenny(122339163)
module wallace(A, B, prod);
    // Inputs and outputs
    input [3:0] A, B;  // 4-bit inputs A and B
    output [7:0] prod; // 8-bit output product

    // Internal variables
    wire s11, s12, s13, s14, s15, s22, s23, s24, s25, s26, s32, s33, s34, s35, s36, s37; // Sum signals
    wire c11, c12, c13, c14, c15, c22, c23, c24, c25, c26, c32, c33, c34, c35, c36, c37; // Carry signals
    wire [3:0] p0, p1, p2, p3; // Partial products

    // Generate partial products by multiplying A with each bit of B
    assign p0 = A & {4{B[0]}}; // p0 = A * B[0]
    assign p1 = A & {4{B[1]}}; // p1 = A * B[1]
    assign p2 = A & {4{B[2]}}; // p2 = A * B[2]
    assign p3 = A & {4{B[3]}}; // p3 = A * B[3]

    // Assign final product bits
    assign prod[0] = p0[0]; // LSB of the product
    assign prod[1] = s11;   // Bit 1 of the product
    assign prod[2] = s22;   // Bit 2 of the product
    assign prod[3] = s32;   // Bit 3 of the product
    assign prod[4] = s34;   // Bit 4 of the product
    assign prod[5] = s35;   // Bit 5 of the product
    assign prod[6] = s36;   // Bit 6 of the product
    assign prod[7] = s37 ^ c37; // MSB of the product (final sum XOR final carry)

    // First stage of adders: Reduce partial products using half adders (HA) and full adders (FA)
    half_adder ha11(p0[1], p1[0], s11, c11); // HA for p0[1] and p1[0]
    full_adder fa12(p0[2], p1[1], p2[0], s12, c12); // FA for p0[2], p1[1], p2[0]
    full_adder fa13(p0[3], p1[2], p2[1], s13, c13); // FA for p0[3], p1[2], p2[1]
    full_adder fa14(p1[3], p2[2], p3[1], s14, c14); // FA for p1[3], p2[2], p3[1]
    half_adder ha15(p2[3], p3[2], s15, c15); // HA for p2[3] and p3[2]

    // Second stage of adders: Further reduce intermediate sums and carries
    half_adder ha22(c11, s12, s22, c22); // HA for c11 and s12
    full_adder fa23(p3[0], c12, s13, s23, c23); // FA for p3[0], c12, s13
    full_adder fa24(c13, c32, s14, s24, c24); // FA for c13, c32, s14
    full_adder fa25(c14, c24, s15, s25, c25); // FA for c14, c24, s15
    full_adder fa26(c15, c25, p3[3], s26, c26); // FA for c15, c25, p3[3]

    // Third stage of adders: Final compression of sums and carries
    half_adder ha32(c22, s23, s32, c32); // HA for c22 and s23
    half_adder ha34(c23, s24, s34, c34); // HA for c23 and s24
    half_adder ha35(c34, s25, s35, c35); // HA for c34 and s25
    half_adder ha36(c35, s26, s36, c36); // HA for c35 and s26
    half_adder ha37(c36, c26, s37, c37); // HA for c36 and c26 (final sum and carry)
endmodule

// Half adder module: Adds two bits and produces sum and carry
module half_adder(input a, b, output sum, carry);
    assign sum = a ^ b;  // Sum = a XOR b
    assign carry = a & b; // Carry = a AND b
endmodule

// Full adder module: Adds three bits and produces sum and carry
module full_adder(input a, b, cin, output sum, carry);
    assign sum = a ^ b ^ cin; // Sum = a XOR b XOR cin
    assign carry = (a & b) | (b & cin) | (cin & a); // Carry = (a AND b) OR (b AND cin) OR (cin AND a)
endmodule
