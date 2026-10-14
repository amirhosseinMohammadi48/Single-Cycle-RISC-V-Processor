`include "Adder.sv"
`include "ALU.sv"
`include "Controller.sv"
`include "DataMemory.sv"
`include "ImmediateGenerator.sv"
`include "InstructionMemory.sv"
`include "MUX.sv"
`include "Register.sv"
`include "RegisterFile.sv"

module CPU (
    input clk,rst
);

wire [31:0] instruction, PC, PC_next, PC_plus4, reg_data1, reg_data2, immediate, PC_target, alu_result, memory_data, reg_write_data, ALU_in1, ALU_in2;
wire [2:0] ALU_select;
wire [1:0] PCSrc,writeSrc;
wire memory_write_enable, register_write_enable,ALUSrc_in2 , zero, less;

Controller control_unit(
    .opcode(instruction[6:0]),
    .func3(instruction[14:12]),
    .func7(instruction[31:25]),
    .zero(zero),
    .less(less),
    .ALU_select(ALU_select),
    .ALUSrc_in2(ALUSrc_in2),
    .PCSrc(PCSrc),
    .writeSrc(writeSrc),
    .memory_write_enable(memory_write_enable),
    .register_write_enable(register_write_enable)
);

MUX #(32, 2) PC_mux (
    .in( {32'd0, alu_result, PC_target, PC_plus4} ),
    .sel(PCSrc),
    .out(PC_next)
);

wire [31:0] alu_sign_bit = {31'b0, alu_result[31]};
MUX #(32, 2) reg_write_mux(
    .in( {alu_sign_bit, PC_plus4, memory_data, alu_result} ),
    .sel(writeSrc),
    .out(reg_write_data)
);

MUX #(32, 1) alu_in2_mux(
    .in( {immediate, reg_data2} ),
    .sel(ALUSrc_in2),
    .out(ALU_in2)
);

Register #(32) PC_reg(
    .clk(clk),
    .rst(rst),
    .d(PC_next),
    .q(PC)
);

Adder next_PC(
    .a(PC),
    .b(32'd4),
    .carry_in(1'b0),
    .sum(PC_plus4),
    .carry() 
);


Adder PC_jump(
    .a(PC),
    .b(immediate),
    .carry_in(1'b0),
    .sum(PC_target),
    .carry()
);

InstructionMemory IM(
    .pc(PC),
    .instruction(instruction)
);


RegisterFile RF(
    .clk(clk),
    .rst(rst),
    .write_enable(register_write_enable),
    .read_reg1(instruction[19:15]),
    .read_reg2(instruction[24:20]),
    .write_reg(instruction[11:7]),
    .write_data(reg_write_data),
    .data1(reg_data1),
    .data2(reg_data2)
);

DataMemory DM(
    .clk(clk),
    .rst(rst),
    .addr(alu_result),
    .write_data(reg_data2),
    .write_enable(memory_write_enable),
    .read_data(memory_data)
);

ImmediateGenerator extend(
    .instruction(instruction),
    .immediate(immediate)
);

assign ALU_in1 = reg_data1;
ALU computation_unit(
    .a(ALU_in1),
    .b(ALU_in2),
    .select(ALU_select),
    .result(alu_result),
    .less(less),
    .zero(zero)
);

endmodule
