// ==============================================================
// Generated by Vitis HLS v2024.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="SpMV_SpMV,hls_ip_2024_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=6.912000,HLS_SYN_LAT=1341,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=545,HLS_SYN_LUT=431,HLS_VERSION=2024_1}" *)

module SpMV (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        values_address0,
        values_ce0,
        values_q0,
        columnIndexes_address0,
        columnIndexes_ce0,
        columnIndexes_q0,
        rowPointers_address0,
        rowPointers_ce0,
        rowPointers_q0,
        rowPointers_address1,
        rowPointers_ce1,
        rowPointers_q1,
        numOfRows,
        numOfCols,
        vector_address0,
        vector_ce0,
        vector_q0,
        output_r_address0,
        output_r_ce0,
        output_r_we0,
        output_r_d0
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_state2 = 5'd2;
parameter    ap_ST_fsm_state3 = 5'd4;
parameter    ap_ST_fsm_state4 = 5'd8;
parameter    ap_ST_fsm_state5 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [6:0] values_address0;
output   values_ce0;
input  [31:0] values_q0;
output  [6:0] columnIndexes_address0;
output   columnIndexes_ce0;
input  [4:0] columnIndexes_q0;
output  [3:0] rowPointers_address0;
output   rowPointers_ce0;
input  [8:0] rowPointers_q0;
output  [3:0] rowPointers_address1;
output   rowPointers_ce1;
input  [8:0] rowPointers_q1;
input  [4:0] numOfRows;
input  [4:0] numOfCols;
output  [3:0] vector_address0;
output   vector_ce0;
input  [31:0] vector_q0;
output  [3:0] output_r_address0;
output   output_r_ce0;
output   output_r_we0;
output  [31:0] output_r_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [3:0] add_ln15_fu_138_p2;
reg   [3:0] add_ln15_reg_199;
wire    ap_CS_fsm_state2;
wire   [0:0] icmp_ln16_fu_154_p2;
reg   [0:0] icmp_ln16_reg_204;
reg   [3:0] output_r_addr_reg_208;
reg   [8:0] j_reg_223;
wire    ap_CS_fsm_state3;
reg   [8:0] rowPointers_load_reg_228;
wire   [0:0] icmp_ln19_fu_164_p2;
reg   [0:0] icmp_ln19_reg_233;
wire    grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_start;
wire    grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_done;
wire    grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_idle;
wire    grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_ready;
wire   [6:0] grp_SpMV_Pipeline_spmv_loop_internal_fu_109_values_address0;
wire    grp_SpMV_Pipeline_spmv_loop_internal_fu_109_values_ce0;
wire   [6:0] grp_SpMV_Pipeline_spmv_loop_internal_fu_109_columnIndexes_address0;
wire    grp_SpMV_Pipeline_spmv_loop_internal_fu_109_columnIndexes_ce0;
wire   [3:0] grp_SpMV_Pipeline_spmv_loop_internal_fu_109_vector_address0;
wire    grp_SpMV_Pipeline_spmv_loop_internal_fu_109_vector_ce0;
wire   [31:0] grp_SpMV_Pipeline_spmv_loop_internal_fu_109_add7_out;
wire    grp_SpMV_Pipeline_spmv_loop_internal_fu_109_add7_out_ap_vld;
reg    grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_start_reg;
wire    ap_CS_fsm_state4;
wire   [63:0] zext_ln15_fu_144_p1;
wire   [0:0] icmp_ln15_fu_132_p2;
wire   [63:0] conv_i21_fu_159_p1;
reg   [3:0] i_fu_56;
wire    ap_CS_fsm_state5;
reg    output_r_we0_local;
reg   [31:0] output_r_d0_local;
reg    output_r_ce0_local;
reg   [3:0] output_r_address0_local;
reg    rowPointers_ce1_local;
reg    rowPointers_ce0_local;
wire   [4:0] zext_ln15_1_fu_150_p1;
reg   [4:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
wire    ap_ST_fsm_state5_blk;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_start_reg = 1'b0;
#0 i_fu_56 = 4'd0;
end

SpMV_SpMV_Pipeline_spmv_loop_internal grp_SpMV_Pipeline_spmv_loop_internal_fu_109(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_start),
    .ap_done(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_done),
    .ap_idle(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_idle),
    .ap_ready(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_ready),
    .zext_ln19(j_reg_223),
    .wide_trip_count(rowPointers_load_reg_228),
    .values_address0(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_values_address0),
    .values_ce0(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_values_ce0),
    .values_q0(values_q0),
    .columnIndexes_address0(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_columnIndexes_address0),
    .columnIndexes_ce0(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_columnIndexes_ce0),
    .columnIndexes_q0(columnIndexes_q0),
    .vector_address0(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_vector_address0),
    .vector_ce0(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_vector_ce0),
    .vector_q0(vector_q0),
    .add7_out(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_add7_out),
    .add7_out_ap_vld(grp_SpMV_Pipeline_spmv_loop_internal_fu_109_add7_out_ap_vld)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_start_reg <= 1'b1;
        end else if ((grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_ready == 1'b1)) begin
            grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_fu_56 <= 4'd0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        i_fu_56 <= add_ln15_reg_199;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        add_ln15_reg_199 <= add_ln15_fu_138_p2;
        icmp_ln16_reg_204 <= icmp_ln16_fu_154_p2;
        output_r_addr_reg_208 <= zext_ln15_fu_144_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        icmp_ln19_reg_233 <= icmp_ln19_fu_164_p2;
        j_reg_223 <= rowPointers_q1;
        rowPointers_load_reg_228 <= rowPointers_q0;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

assign ap_ST_fsm_state5_blk = 1'b0;

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln15_fu_132_p2 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln15_fu_132_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        output_r_address0_local = output_r_addr_reg_208;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        output_r_address0_local = zext_ln15_fu_144_p1;
    end else begin
        output_r_address0_local = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state5))) begin
        output_r_ce0_local = 1'b1;
    end else begin
        output_r_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        output_r_d0_local = grp_SpMV_Pipeline_spmv_loop_internal_fu_109_add7_out;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        output_r_d0_local = 32'd0;
    end else begin
        output_r_d0_local = 'bx;
    end
end

always @ (*) begin
    if ((((icmp_ln19_reg_233 == 1'd1) & (icmp_ln16_reg_204 == 1'd1) & (1'b1 == ap_CS_fsm_state5)) | ((icmp_ln16_fu_154_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln15_fu_132_p2 == 1'd0)))) begin
        output_r_we0_local = 1'b1;
    end else begin
        output_r_we0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        rowPointers_ce0_local = 1'b1;
    end else begin
        rowPointers_ce0_local = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        rowPointers_ce1_local = 1'b1;
    end else begin
        rowPointers_ce1_local = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln15_fu_132_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else if (((icmp_ln16_fu_154_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2) & (icmp_ln15_fu_132_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln15_fu_138_p2 = (i_fu_56 + 4'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign columnIndexes_address0 = grp_SpMV_Pipeline_spmv_loop_internal_fu_109_columnIndexes_address0;

assign columnIndexes_ce0 = grp_SpMV_Pipeline_spmv_loop_internal_fu_109_columnIndexes_ce0;

assign conv_i21_fu_159_p1 = add_ln15_fu_138_p2;

assign grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_start = grp_SpMV_Pipeline_spmv_loop_internal_fu_109_ap_start_reg;

assign icmp_ln15_fu_132_p2 = ((i_fu_56 == 4'd10) ? 1'b1 : 1'b0);

assign icmp_ln16_fu_154_p2 = ((zext_ln15_1_fu_150_p1 < numOfRows) ? 1'b1 : 1'b0);

assign icmp_ln19_fu_164_p2 = ((rowPointers_q1 < rowPointers_q0) ? 1'b1 : 1'b0);

assign output_r_address0 = output_r_address0_local;

assign output_r_ce0 = output_r_ce0_local;

assign output_r_d0 = output_r_d0_local;

assign output_r_we0 = output_r_we0_local;

assign rowPointers_address0 = conv_i21_fu_159_p1;

assign rowPointers_address1 = zext_ln15_fu_144_p1;

assign rowPointers_ce0 = rowPointers_ce0_local;

assign rowPointers_ce1 = rowPointers_ce1_local;

assign values_address0 = grp_SpMV_Pipeline_spmv_loop_internal_fu_109_values_address0;

assign values_ce0 = grp_SpMV_Pipeline_spmv_loop_internal_fu_109_values_ce0;

assign vector_address0 = grp_SpMV_Pipeline_spmv_loop_internal_fu_109_vector_address0;

assign vector_ce0 = grp_SpMV_Pipeline_spmv_loop_internal_fu_109_vector_ce0;

assign zext_ln15_1_fu_150_p1 = i_fu_56;

assign zext_ln15_fu_144_p1 = i_fu_56;

endmodule //SpMV
