module Adder (
    input [31:0] a, b,
    input carry_in,
    output [31:0] sum,
    output carry

);
    assign {carry,sum} = a + b + carry_in;

endmodule
