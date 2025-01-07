// ==============================================================
// Generated by Vitis HLS v2024.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module SpMV_SpMV_Pipeline_spmv_loop_internal4 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        zext_ln22_8,
        zext_ln22_9,
        values_address0,
        values_ce0,
        values_q0,
        columnIndexes_address0,
        columnIndexes_ce0,
        columnIndexes_q0,
        vector_address0,
        vector_ce0,
        vector_q0,
        sum_12_out,
        sum_12_out_ap_vld,
        grp_fu_1072_p_din0,
        grp_fu_1072_p_din1,
        grp_fu_1072_p_dout0,
        grp_fu_1072_p_ce
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [8:0] zext_ln22_8;
input  [8:0] zext_ln22_9;
output  [6:0] values_address0;
output   values_ce0;
input  [31:0] values_q0;
output  [6:0] columnIndexes_address0;
output   columnIndexes_ce0;
input  [4:0] columnIndexes_q0;
output  [3:0] vector_address0;
output   vector_ce0;
input  [31:0] vector_q0;
output  [31:0] sum_12_out;
output   sum_12_out_ap_vld;
output  [31:0] grp_fu_1072_p_din0;
output  [31:0] grp_fu_1072_p_din1;
input  [31:0] grp_fu_1072_p_dout0;
output   grp_fu_1072_p_ce;

reg ap_idle;
reg sum_12_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_idle_pp0;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln22_fu_130_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [63:0] zext_ln22_9_cast_fu_108_p1;
reg   [63:0] zext_ln22_9_cast_reg_183;
reg   [63:0] j_6_reg_188;
reg   [0:0] icmp_ln22_reg_193;
reg   [0:0] icmp_ln22_reg_193_pp0_iter2_reg;
reg   [0:0] icmp_ln22_reg_193_pp0_iter3_reg;
reg   [0:0] icmp_ln22_reg_193_pp0_iter4_reg;
reg  signed [31:0] matrix_value_reg_212;
reg  signed [31:0] vector_value_reg_217;
reg   [31:0] temp_reg_222;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln29_fu_146_p1;
reg   [31:0] sum_fu_38;
wire   [31:0] sum_6_fu_154_p2;
wire    ap_loop_init;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg   [63:0] j_fu_42;
wire   [63:0] add_ln22_fu_135_p2;
wire   [63:0] zext_ln22_8_cast_fu_112_p1;
wire    ap_block_pp0_stage0_01001;
reg    columnIndexes_ce0_local;
reg    values_ce0_local;
reg    vector_ce0_local;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ready_sig;
wire    ap_done_sig;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 sum_fu_38 = 32'd0;
#0 j_fu_42 = 64'd0;
#0 ap_done_reg = 1'b0;
end

SpMV_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready_sig),
    .ap_done(ap_done_sig),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter5_reg == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            j_fu_42 <= zext_ln22_8_cast_fu_112_p1;
        end else if (((icmp_ln22_fu_130_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            j_fu_42 <= add_ln22_fu_135_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_loop_init == 1'b1))) begin
            sum_fu_38 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter6 == 1'b1)) begin
            sum_fu_38 <= sum_6_fu_154_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
        icmp_ln22_reg_193 <= icmp_ln22_fu_130_p2;
        j_6_reg_188 <= j_fu_42;
        zext_ln22_9_cast_reg_183[8 : 0] <= zext_ln22_9_cast_fu_108_p1[8 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        icmp_ln22_reg_193_pp0_iter2_reg <= icmp_ln22_reg_193;
        icmp_ln22_reg_193_pp0_iter3_reg <= icmp_ln22_reg_193_pp0_iter2_reg;
        icmp_ln22_reg_193_pp0_iter4_reg <= icmp_ln22_reg_193_pp0_iter3_reg;
        matrix_value_reg_212 <= values_q0;
        temp_reg_222 <= grp_fu_1072_p_dout0;
        vector_value_reg_217 <= vector_q0;
    end
end

always @ (*) begin
    if (((icmp_ln22_fu_130_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_loop_exit_ready_pp0_iter5_reg == 1'b1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        columnIndexes_ce0_local = 1'b1;
    end else begin
        columnIndexes_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_loop_exit_ready_pp0_iter5_reg == 1'b1) & (icmp_ln22_reg_193_pp0_iter4_reg == 1'd0))) begin
        sum_12_out_ap_vld = 1'b1;
    end else begin
        sum_12_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        values_ce0_local = 1'b1;
    end else begin
        values_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        vector_ce0_local = 1'b1;
    end else begin
        vector_ce0_local = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln22_fu_135_p2 = (j_fu_42 + 64'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_ready = ap_ready_sig;

assign columnIndexes_address0 = j_fu_42;

assign columnIndexes_ce0 = columnIndexes_ce0_local;

assign grp_fu_1072_p_ce = 1'b1;

assign grp_fu_1072_p_din0 = vector_value_reg_217;

assign grp_fu_1072_p_din1 = matrix_value_reg_212;

assign icmp_ln22_fu_130_p2 = ((j_fu_42 < zext_ln22_9_cast_reg_183) ? 1'b1 : 1'b0);

assign sum_12_out = sum_fu_38;

assign sum_6_fu_154_p2 = (temp_reg_222 + sum_fu_38);

assign values_address0 = j_6_reg_188;

assign values_ce0 = values_ce0_local;

assign vector_address0 = zext_ln29_fu_146_p1;

assign vector_ce0 = vector_ce0_local;

assign zext_ln22_8_cast_fu_112_p1 = zext_ln22_8;

assign zext_ln22_9_cast_fu_108_p1 = zext_ln22_9;

assign zext_ln29_fu_146_p1 = columnIndexes_q0;

always @ (posedge ap_clk) begin
    zext_ln22_9_cast_reg_183[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
end

endmodule //SpMV_SpMV_Pipeline_spmv_loop_internal4
