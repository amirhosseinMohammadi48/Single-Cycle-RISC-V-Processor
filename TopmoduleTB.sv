`timescale 1ns/1ns
`include "Topmodule.sv"

module TopmoduleTB;
    reg clk, rst;


    CPU cpu(
        .clk(clk),
        .rst(rst)
    );

    initial begin
        $dumpfile("Topmodule.vcd");
        $dumpvars(0, TopmoduleTB);
        clk = 0;
        rst = 1;
        #5 rst = 0;
        #20000 $finish;
    end

    always #1 clk = ~clk;

endmodule
