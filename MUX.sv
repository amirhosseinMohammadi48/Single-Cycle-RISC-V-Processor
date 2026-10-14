module MUX #(
    parameter N = 32,
    parameter select = 2
)(
    input  wire [(2**select)*N-1 : 0] in,
    input  wire [select-1:0] sel,        
    output wire [N-1:0] out
);
    assign out = in[sel*N +: N];
endmodule
