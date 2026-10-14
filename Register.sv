module Register #(
    parameter N = 32
)(
    input wire clk,
    input wire rst,
    input wire [N-1:0] d,
    output reg [N-1:0] q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= {N{1'b0}};
        else
            q <= d;
    end
endmodule
