
module RegisterFile (
    input clk, rst,
    input write_enable,
    input   [4:0] read_reg1, read_reg2, write_reg,
    input  [31:0] write_data,
    output [31:0] data1, data2
);
    reg [31:0] regs [31:0];

    genvar q;
    generate
        for(q = 0; q < 32; q = q +1) begin
            wire [31:0] w;
            assign w = regs[q];
        end
    endgenerate

    assign data1 = regs[read_reg1];
    assign data2 = regs[read_reg2];
     
    integer i;
    always @(posedge clk or posedge rst) begin
        
        if (rst) begin
        
            for (i = 0; i < 32; i = i + 1)
                regs[i] <= 32'b0;
        end

        else if (write_enable)
            if (write_reg != 0 )
                regs[write_reg] <= write_data;
            else 
                regs[write_reg] <= 32'b0; 
    end

endmodule
