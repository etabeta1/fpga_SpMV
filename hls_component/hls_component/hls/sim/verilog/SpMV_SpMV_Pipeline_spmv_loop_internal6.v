// ==============================================================
// Generated by Vitis HLS v2024.1
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

module SpMV_SpMV_Pipeline_spmv_loop_internal6 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_gmem1_AWVALID,
        m_axi_gmem1_AWREADY,
        m_axi_gmem1_AWADDR,
        m_axi_gmem1_AWID,
        m_axi_gmem1_AWLEN,
        m_axi_gmem1_AWSIZE,
        m_axi_gmem1_AWBURST,
        m_axi_gmem1_AWLOCK,
        m_axi_gmem1_AWCACHE,
        m_axi_gmem1_AWPROT,
        m_axi_gmem1_AWQOS,
        m_axi_gmem1_AWREGION,
        m_axi_gmem1_AWUSER,
        m_axi_gmem1_WVALID,
        m_axi_gmem1_WREADY,
        m_axi_gmem1_WDATA,
        m_axi_gmem1_WSTRB,
        m_axi_gmem1_WLAST,
        m_axi_gmem1_WID,
        m_axi_gmem1_WUSER,
        m_axi_gmem1_ARVALID,
        m_axi_gmem1_ARREADY,
        m_axi_gmem1_ARADDR,
        m_axi_gmem1_ARID,
        m_axi_gmem1_ARLEN,
        m_axi_gmem1_ARSIZE,
        m_axi_gmem1_ARBURST,
        m_axi_gmem1_ARLOCK,
        m_axi_gmem1_ARCACHE,
        m_axi_gmem1_ARPROT,
        m_axi_gmem1_ARQOS,
        m_axi_gmem1_ARREGION,
        m_axi_gmem1_ARUSER,
        m_axi_gmem1_RVALID,
        m_axi_gmem1_RREADY,
        m_axi_gmem1_RDATA,
        m_axi_gmem1_RLAST,
        m_axi_gmem1_RID,
        m_axi_gmem1_RFIFONUM,
        m_axi_gmem1_RUSER,
        m_axi_gmem1_RRESP,
        m_axi_gmem1_BVALID,
        m_axi_gmem1_BREADY,
        m_axi_gmem1_BRESP,
        m_axi_gmem1_BID,
        m_axi_gmem1_BUSER,
        m_axi_gmem3_AWVALID,
        m_axi_gmem3_AWREADY,
        m_axi_gmem3_AWADDR,
        m_axi_gmem3_AWID,
        m_axi_gmem3_AWLEN,
        m_axi_gmem3_AWSIZE,
        m_axi_gmem3_AWBURST,
        m_axi_gmem3_AWLOCK,
        m_axi_gmem3_AWCACHE,
        m_axi_gmem3_AWPROT,
        m_axi_gmem3_AWQOS,
        m_axi_gmem3_AWREGION,
        m_axi_gmem3_AWUSER,
        m_axi_gmem3_WVALID,
        m_axi_gmem3_WREADY,
        m_axi_gmem3_WDATA,
        m_axi_gmem3_WSTRB,
        m_axi_gmem3_WLAST,
        m_axi_gmem3_WID,
        m_axi_gmem3_WUSER,
        m_axi_gmem3_ARVALID,
        m_axi_gmem3_ARREADY,
        m_axi_gmem3_ARADDR,
        m_axi_gmem3_ARID,
        m_axi_gmem3_ARLEN,
        m_axi_gmem3_ARSIZE,
        m_axi_gmem3_ARBURST,
        m_axi_gmem3_ARLOCK,
        m_axi_gmem3_ARCACHE,
        m_axi_gmem3_ARPROT,
        m_axi_gmem3_ARQOS,
        m_axi_gmem3_ARREGION,
        m_axi_gmem3_ARUSER,
        m_axi_gmem3_RVALID,
        m_axi_gmem3_RREADY,
        m_axi_gmem3_RDATA,
        m_axi_gmem3_RLAST,
        m_axi_gmem3_RID,
        m_axi_gmem3_RFIFONUM,
        m_axi_gmem3_RUSER,
        m_axi_gmem3_RRESP,
        m_axi_gmem3_BVALID,
        m_axi_gmem3_BREADY,
        m_axi_gmem3_BRESP,
        m_axi_gmem3_BID,
        m_axi_gmem3_BUSER,
        m_axi_gmem0_AWVALID,
        m_axi_gmem0_AWREADY,
        m_axi_gmem0_AWADDR,
        m_axi_gmem0_AWID,
        m_axi_gmem0_AWLEN,
        m_axi_gmem0_AWSIZE,
        m_axi_gmem0_AWBURST,
        m_axi_gmem0_AWLOCK,
        m_axi_gmem0_AWCACHE,
        m_axi_gmem0_AWPROT,
        m_axi_gmem0_AWQOS,
        m_axi_gmem0_AWREGION,
        m_axi_gmem0_AWUSER,
        m_axi_gmem0_WVALID,
        m_axi_gmem0_WREADY,
        m_axi_gmem0_WDATA,
        m_axi_gmem0_WSTRB,
        m_axi_gmem0_WLAST,
        m_axi_gmem0_WID,
        m_axi_gmem0_WUSER,
        m_axi_gmem0_ARVALID,
        m_axi_gmem0_ARREADY,
        m_axi_gmem0_ARADDR,
        m_axi_gmem0_ARID,
        m_axi_gmem0_ARLEN,
        m_axi_gmem0_ARSIZE,
        m_axi_gmem0_ARBURST,
        m_axi_gmem0_ARLOCK,
        m_axi_gmem0_ARCACHE,
        m_axi_gmem0_ARPROT,
        m_axi_gmem0_ARQOS,
        m_axi_gmem0_ARREGION,
        m_axi_gmem0_ARUSER,
        m_axi_gmem0_RVALID,
        m_axi_gmem0_RREADY,
        m_axi_gmem0_RDATA,
        m_axi_gmem0_RLAST,
        m_axi_gmem0_RID,
        m_axi_gmem0_RFIFONUM,
        m_axi_gmem0_RUSER,
        m_axi_gmem0_RRESP,
        m_axi_gmem0_BVALID,
        m_axi_gmem0_BREADY,
        m_axi_gmem0_BRESP,
        m_axi_gmem0_BID,
        m_axi_gmem0_BUSER,
        zext_ln36_12,
        zext_ln36_13,
        sext_ln36_13,
        add_ln36_25,
        vector,
        sum_18_out,
        sum_18_out_ap_vld,
        grp_fu_3354_p_din0,
        grp_fu_3354_p_din1,
        grp_fu_3354_p_dout0,
        grp_fu_3354_p_ce
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem1_AWVALID;
input   m_axi_gmem1_AWREADY;
output  [63:0] m_axi_gmem1_AWADDR;
output  [0:0] m_axi_gmem1_AWID;
output  [31:0] m_axi_gmem1_AWLEN;
output  [2:0] m_axi_gmem1_AWSIZE;
output  [1:0] m_axi_gmem1_AWBURST;
output  [1:0] m_axi_gmem1_AWLOCK;
output  [3:0] m_axi_gmem1_AWCACHE;
output  [2:0] m_axi_gmem1_AWPROT;
output  [3:0] m_axi_gmem1_AWQOS;
output  [3:0] m_axi_gmem1_AWREGION;
output  [0:0] m_axi_gmem1_AWUSER;
output   m_axi_gmem1_WVALID;
input   m_axi_gmem1_WREADY;
output  [7:0] m_axi_gmem1_WDATA;
output  [0:0] m_axi_gmem1_WSTRB;
output   m_axi_gmem1_WLAST;
output  [0:0] m_axi_gmem1_WID;
output  [0:0] m_axi_gmem1_WUSER;
output   m_axi_gmem1_ARVALID;
input   m_axi_gmem1_ARREADY;
output  [63:0] m_axi_gmem1_ARADDR;
output  [0:0] m_axi_gmem1_ARID;
output  [31:0] m_axi_gmem1_ARLEN;
output  [2:0] m_axi_gmem1_ARSIZE;
output  [1:0] m_axi_gmem1_ARBURST;
output  [1:0] m_axi_gmem1_ARLOCK;
output  [3:0] m_axi_gmem1_ARCACHE;
output  [2:0] m_axi_gmem1_ARPROT;
output  [3:0] m_axi_gmem1_ARQOS;
output  [3:0] m_axi_gmem1_ARREGION;
output  [0:0] m_axi_gmem1_ARUSER;
input   m_axi_gmem1_RVALID;
output   m_axi_gmem1_RREADY;
input  [7:0] m_axi_gmem1_RDATA;
input   m_axi_gmem1_RLAST;
input  [0:0] m_axi_gmem1_RID;
input  [10:0] m_axi_gmem1_RFIFONUM;
input  [0:0] m_axi_gmem1_RUSER;
input  [1:0] m_axi_gmem1_RRESP;
input   m_axi_gmem1_BVALID;
output   m_axi_gmem1_BREADY;
input  [1:0] m_axi_gmem1_BRESP;
input  [0:0] m_axi_gmem1_BID;
input  [0:0] m_axi_gmem1_BUSER;
output   m_axi_gmem3_AWVALID;
input   m_axi_gmem3_AWREADY;
output  [63:0] m_axi_gmem3_AWADDR;
output  [0:0] m_axi_gmem3_AWID;
output  [31:0] m_axi_gmem3_AWLEN;
output  [2:0] m_axi_gmem3_AWSIZE;
output  [1:0] m_axi_gmem3_AWBURST;
output  [1:0] m_axi_gmem3_AWLOCK;
output  [3:0] m_axi_gmem3_AWCACHE;
output  [2:0] m_axi_gmem3_AWPROT;
output  [3:0] m_axi_gmem3_AWQOS;
output  [3:0] m_axi_gmem3_AWREGION;
output  [0:0] m_axi_gmem3_AWUSER;
output   m_axi_gmem3_WVALID;
input   m_axi_gmem3_WREADY;
output  [31:0] m_axi_gmem3_WDATA;
output  [3:0] m_axi_gmem3_WSTRB;
output   m_axi_gmem3_WLAST;
output  [0:0] m_axi_gmem3_WID;
output  [0:0] m_axi_gmem3_WUSER;
output   m_axi_gmem3_ARVALID;
input   m_axi_gmem3_ARREADY;
output  [63:0] m_axi_gmem3_ARADDR;
output  [0:0] m_axi_gmem3_ARID;
output  [31:0] m_axi_gmem3_ARLEN;
output  [2:0] m_axi_gmem3_ARSIZE;
output  [1:0] m_axi_gmem3_ARBURST;
output  [1:0] m_axi_gmem3_ARLOCK;
output  [3:0] m_axi_gmem3_ARCACHE;
output  [2:0] m_axi_gmem3_ARPROT;
output  [3:0] m_axi_gmem3_ARQOS;
output  [3:0] m_axi_gmem3_ARREGION;
output  [0:0] m_axi_gmem3_ARUSER;
input   m_axi_gmem3_RVALID;
output   m_axi_gmem3_RREADY;
input  [31:0] m_axi_gmem3_RDATA;
input   m_axi_gmem3_RLAST;
input  [0:0] m_axi_gmem3_RID;
input  [8:0] m_axi_gmem3_RFIFONUM;
input  [0:0] m_axi_gmem3_RUSER;
input  [1:0] m_axi_gmem3_RRESP;
input   m_axi_gmem3_BVALID;
output   m_axi_gmem3_BREADY;
input  [1:0] m_axi_gmem3_BRESP;
input  [0:0] m_axi_gmem3_BID;
input  [0:0] m_axi_gmem3_BUSER;
output   m_axi_gmem0_AWVALID;
input   m_axi_gmem0_AWREADY;
output  [63:0] m_axi_gmem0_AWADDR;
output  [0:0] m_axi_gmem0_AWID;
output  [31:0] m_axi_gmem0_AWLEN;
output  [2:0] m_axi_gmem0_AWSIZE;
output  [1:0] m_axi_gmem0_AWBURST;
output  [1:0] m_axi_gmem0_AWLOCK;
output  [3:0] m_axi_gmem0_AWCACHE;
output  [2:0] m_axi_gmem0_AWPROT;
output  [3:0] m_axi_gmem0_AWQOS;
output  [3:0] m_axi_gmem0_AWREGION;
output  [0:0] m_axi_gmem0_AWUSER;
output   m_axi_gmem0_WVALID;
input   m_axi_gmem0_WREADY;
output  [31:0] m_axi_gmem0_WDATA;
output  [3:0] m_axi_gmem0_WSTRB;
output   m_axi_gmem0_WLAST;
output  [0:0] m_axi_gmem0_WID;
output  [0:0] m_axi_gmem0_WUSER;
output   m_axi_gmem0_ARVALID;
input   m_axi_gmem0_ARREADY;
output  [63:0] m_axi_gmem0_ARADDR;
output  [0:0] m_axi_gmem0_ARID;
output  [31:0] m_axi_gmem0_ARLEN;
output  [2:0] m_axi_gmem0_ARSIZE;
output  [1:0] m_axi_gmem0_ARBURST;
output  [1:0] m_axi_gmem0_ARLOCK;
output  [3:0] m_axi_gmem0_ARCACHE;
output  [2:0] m_axi_gmem0_ARPROT;
output  [3:0] m_axi_gmem0_ARQOS;
output  [3:0] m_axi_gmem0_ARREGION;
output  [0:0] m_axi_gmem0_ARUSER;
input   m_axi_gmem0_RVALID;
output   m_axi_gmem0_RREADY;
input  [31:0] m_axi_gmem0_RDATA;
input   m_axi_gmem0_RLAST;
input  [0:0] m_axi_gmem0_RID;
input  [8:0] m_axi_gmem0_RFIFONUM;
input  [0:0] m_axi_gmem0_RUSER;
input  [1:0] m_axi_gmem0_RRESP;
input   m_axi_gmem0_BVALID;
output   m_axi_gmem0_BREADY;
input  [1:0] m_axi_gmem0_BRESP;
input  [0:0] m_axi_gmem0_BID;
input  [0:0] m_axi_gmem0_BUSER;
input  [8:0] zext_ln36_12;
input  [8:0] zext_ln36_13;
input  [61:0] sext_ln36_13;
input  [63:0] add_ln36_25;
input  [63:0] vector;
output  [31:0] sum_18_out;
output   sum_18_out_ap_vld;
output  [31:0] grp_fu_3354_p_din0;
output  [31:0] grp_fu_3354_p_din1;
input  [31:0] grp_fu_3354_p_dout0;
output   grp_fu_3354_p_ce;

reg ap_idle;
reg m_axi_gmem1_RREADY;
reg m_axi_gmem3_ARVALID;
reg m_axi_gmem3_RREADY;
reg m_axi_gmem0_RREADY;
reg sum_18_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
reg    ap_enable_reg_pp0_iter7;
reg    ap_enable_reg_pp0_iter8;
reg    ap_enable_reg_pp0_iter9;
reg    ap_enable_reg_pp0_iter10;
reg    ap_enable_reg_pp0_iter11;
reg    ap_enable_reg_pp0_iter12;
reg    ap_enable_reg_pp0_iter13;
reg    ap_enable_reg_pp0_iter14;
reg    ap_enable_reg_pp0_iter15;
reg    ap_idle_pp0;
reg    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_state13_pp0_stage0_iter12;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln36_fu_176_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    gmem3_blk_n_AR;
wire    ap_block_pp0_stage0;
reg    gmem3_blk_n_R;
reg    gmem1_blk_n_R;
reg    gmem0_blk_n_R;
reg    ap_block_pp0_stage0_11001;
wire   [63:0] zext_ln36_13_cast_fu_155_p1;
reg   [63:0] zext_ln36_13_cast_reg_291;
reg   [0:0] icmp_ln36_reg_296;
reg   [0:0] icmp_ln36_reg_296_pp0_iter2_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter3_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter4_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter5_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter6_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter7_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter8_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter9_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter10_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter11_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter12_reg;
reg   [0:0] icmp_ln36_reg_296_pp0_iter13_reg;
wire   [4:0] trunc_ln43_fu_198_p1;
reg   [4:0] trunc_ln43_reg_300;
reg   [63:0] gmem3_addr_reg_305;
reg  signed [31:0] matrix_value_reg_311;
reg  signed [31:0] vector_value_reg_316;
reg   [31:0] temp_reg_321;
wire  signed [63:0] sext_ln43_fu_228_p1;
reg   [31:0] sum_fu_80;
wire   [31:0] sum_4_fu_247_p2;
wire    ap_loop_init;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg    ap_loop_exit_ready_pp0_iter5_reg;
reg    ap_loop_exit_ready_pp0_iter6_reg;
reg    ap_loop_exit_ready_pp0_iter7_reg;
reg    ap_loop_exit_ready_pp0_iter8_reg;
reg    ap_loop_exit_ready_pp0_iter9_reg;
reg    ap_loop_exit_ready_pp0_iter10_reg;
reg    ap_loop_exit_ready_pp0_iter11_reg;
reg    ap_loop_exit_ready_pp0_iter12_reg;
reg    ap_loop_exit_ready_pp0_iter13_reg;
reg    ap_loop_exit_ready_pp0_iter14_reg;
reg   [63:0] j_fu_84;
wire   [63:0] add_ln36_fu_181_p2;
wire   [63:0] zext_ln36_12_cast_fu_159_p1;
reg    ap_block_pp0_stage0_01001;
wire   [6:0] shl_ln43_6_fu_202_p3;
wire   [63:0] zext_ln43_fu_209_p1;
wire   [63:0] add_ln43_fu_213_p2;
wire   [61:0] trunc_ln43_6_fu_218_p4;
reg    grp_fu_147_ce;
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
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter8 = 1'b0;
#0 ap_enable_reg_pp0_iter9 = 1'b0;
#0 ap_enable_reg_pp0_iter10 = 1'b0;
#0 ap_enable_reg_pp0_iter11 = 1'b0;
#0 ap_enable_reg_pp0_iter12 = 1'b0;
#0 ap_enable_reg_pp0_iter13 = 1'b0;
#0 ap_enable_reg_pp0_iter14 = 1'b0;
#0 ap_enable_reg_pp0_iter15 = 1'b0;
#0 sum_fu_80 = 32'd0;
#0 j_fu_84 = 64'd0;
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
        end else if (((ap_loop_exit_ready_pp0_iter14_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
        ap_enable_reg_pp0_iter10 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter11 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter11 <= ap_enable_reg_pp0_iter10;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter12 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter12 <= ap_enable_reg_pp0_iter11;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter13 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter13 <= ap_enable_reg_pp0_iter12;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter14 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter14 <= ap_enable_reg_pp0_iter13;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter15 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter15 <= ap_enable_reg_pp0_iter14;
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
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter8 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter9 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            j_fu_84 <= zext_ln36_12_cast_fu_159_p1;
        end else if (((icmp_ln36_fu_176_p2 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            j_fu_84 <= add_ln36_fu_181_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            sum_fu_80 <= 32'd0;
        end else if ((ap_enable_reg_pp0_iter15 == 1'b1)) begin
            sum_fu_80 <= sum_4_fu_247_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        ap_loop_exit_ready_pp0_iter10_reg <= ap_loop_exit_ready_pp0_iter9_reg;
        ap_loop_exit_ready_pp0_iter11_reg <= ap_loop_exit_ready_pp0_iter10_reg;
        ap_loop_exit_ready_pp0_iter12_reg <= ap_loop_exit_ready_pp0_iter11_reg;
        ap_loop_exit_ready_pp0_iter13_reg <= ap_loop_exit_ready_pp0_iter12_reg;
        ap_loop_exit_ready_pp0_iter14_reg <= ap_loop_exit_ready_pp0_iter13_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
        ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
        ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
        ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
        gmem3_addr_reg_305 <= sext_ln43_fu_228_p1;
        icmp_ln36_reg_296_pp0_iter10_reg <= icmp_ln36_reg_296_pp0_iter9_reg;
        icmp_ln36_reg_296_pp0_iter11_reg <= icmp_ln36_reg_296_pp0_iter10_reg;
        icmp_ln36_reg_296_pp0_iter12_reg <= icmp_ln36_reg_296_pp0_iter11_reg;
        icmp_ln36_reg_296_pp0_iter13_reg <= icmp_ln36_reg_296_pp0_iter12_reg;
        icmp_ln36_reg_296_pp0_iter2_reg <= icmp_ln36_reg_296;
        icmp_ln36_reg_296_pp0_iter3_reg <= icmp_ln36_reg_296_pp0_iter2_reg;
        icmp_ln36_reg_296_pp0_iter4_reg <= icmp_ln36_reg_296_pp0_iter3_reg;
        icmp_ln36_reg_296_pp0_iter5_reg <= icmp_ln36_reg_296_pp0_iter4_reg;
        icmp_ln36_reg_296_pp0_iter6_reg <= icmp_ln36_reg_296_pp0_iter5_reg;
        icmp_ln36_reg_296_pp0_iter7_reg <= icmp_ln36_reg_296_pp0_iter6_reg;
        icmp_ln36_reg_296_pp0_iter8_reg <= icmp_ln36_reg_296_pp0_iter7_reg;
        icmp_ln36_reg_296_pp0_iter9_reg <= icmp_ln36_reg_296_pp0_iter8_reg;
        matrix_value_reg_311 <= m_axi_gmem0_RDATA;
        temp_reg_321 <= grp_fu_3354_p_dout0;
        trunc_ln43_reg_300 <= trunc_ln43_fu_198_p1;
        vector_value_reg_316 <= m_axi_gmem3_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready;
        icmp_ln36_reg_296 <= icmp_ln36_fu_176_p2;
        zext_ln36_13_cast_reg_291[8 : 0] <= zext_ln36_13_cast_fu_155_p1[8 : 0];
    end
end

always @ (*) begin
    if (((icmp_ln36_fu_176_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter14_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter15 == 1'b0) & (ap_enable_reg_pp0_iter14 == 1'b0) & (ap_enable_reg_pp0_iter13 == 1'b0) & (ap_enable_reg_pp0_iter12 == 1'b0) & (ap_enable_reg_pp0_iter11 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
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
    if (((ap_enable_reg_pp0_iter12 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        gmem0_blk_n_R = m_axi_gmem0_RVALID;
    end else begin
        gmem0_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        gmem1_blk_n_R = m_axi_gmem1_RVALID;
    end else begin
        gmem1_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        gmem3_blk_n_AR = m_axi_gmem3_ARREADY;
    end else begin
        gmem3_blk_n_AR = 1'b1;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter12 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        gmem3_blk_n_R = m_axi_gmem3_RVALID;
    end else begin
        gmem3_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        grp_fu_147_ce = 1'b1;
    end else begin
        grp_fu_147_ce = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter12 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_gmem0_RREADY = 1'b1;
    end else begin
        m_axi_gmem0_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_gmem1_RREADY = 1'b1;
    end else begin
        m_axi_gmem1_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter4 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_gmem3_ARVALID = 1'b1;
    end else begin
        m_axi_gmem3_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter12 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_gmem3_RREADY = 1'b1;
    end else begin
        m_axi_gmem3_RREADY = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter14_reg == 1'b1) & (icmp_ln36_reg_296_pp0_iter13_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        sum_18_out_ap_vld = 1'b1;
    end else begin
        sum_18_out_ap_vld = 1'b0;
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

assign add_ln36_fu_181_p2 = (j_fu_84 + 64'd1);

assign add_ln43_fu_213_p2 = (zext_ln43_fu_209_p1 + vector);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = (((ap_enable_reg_pp0_iter12 == 1'b1) & (1'b1 == ap_block_state13_pp0_stage0_iter12)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state3_pp0_stage0_iter2)));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter12 == 1'b1) & (1'b1 == ap_block_state13_pp0_stage0_iter12)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (m_axi_gmem3_ARREADY == 1'b0)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state3_pp0_stage0_iter2)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter12 == 1'b1) & (1'b1 == ap_block_state13_pp0_stage0_iter12)) | ((ap_enable_reg_pp0_iter4 == 1'b1) & (m_axi_gmem3_ARREADY == 1'b0)) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b1 == ap_block_state3_pp0_stage0_iter2)));
end

always @ (*) begin
    ap_block_state13_pp0_stage0_iter12 = ((m_axi_gmem0_RVALID == 1'b0) | (m_axi_gmem3_RVALID == 1'b0));
end

always @ (*) begin
    ap_block_state3_pp0_stage0_iter2 = (m_axi_gmem1_RVALID == 1'b0);
end

assign ap_done = ap_done_sig;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign ap_ready = ap_ready_sig;

assign grp_fu_3354_p_ce = grp_fu_147_ce;

assign grp_fu_3354_p_din0 = vector_value_reg_316;

assign grp_fu_3354_p_din1 = matrix_value_reg_311;

assign icmp_ln36_fu_176_p2 = ((j_fu_84 < zext_ln36_13_cast_reg_291) ? 1'b1 : 1'b0);

assign m_axi_gmem0_ARADDR = 64'd0;

assign m_axi_gmem0_ARBURST = 2'd0;

assign m_axi_gmem0_ARCACHE = 4'd0;

assign m_axi_gmem0_ARID = 1'd0;

assign m_axi_gmem0_ARLEN = 32'd0;

assign m_axi_gmem0_ARLOCK = 2'd0;

assign m_axi_gmem0_ARPROT = 3'd0;

assign m_axi_gmem0_ARQOS = 4'd0;

assign m_axi_gmem0_ARREGION = 4'd0;

assign m_axi_gmem0_ARSIZE = 3'd0;

assign m_axi_gmem0_ARUSER = 1'd0;

assign m_axi_gmem0_ARVALID = 1'b0;

assign m_axi_gmem0_AWADDR = 64'd0;

assign m_axi_gmem0_AWBURST = 2'd0;

assign m_axi_gmem0_AWCACHE = 4'd0;

assign m_axi_gmem0_AWID = 1'd0;

assign m_axi_gmem0_AWLEN = 32'd0;

assign m_axi_gmem0_AWLOCK = 2'd0;

assign m_axi_gmem0_AWPROT = 3'd0;

assign m_axi_gmem0_AWQOS = 4'd0;

assign m_axi_gmem0_AWREGION = 4'd0;

assign m_axi_gmem0_AWSIZE = 3'd0;

assign m_axi_gmem0_AWUSER = 1'd0;

assign m_axi_gmem0_AWVALID = 1'b0;

assign m_axi_gmem0_BREADY = 1'b0;

assign m_axi_gmem0_WDATA = 32'd0;

assign m_axi_gmem0_WID = 1'd0;

assign m_axi_gmem0_WLAST = 1'b0;

assign m_axi_gmem0_WSTRB = 4'd0;

assign m_axi_gmem0_WUSER = 1'd0;

assign m_axi_gmem0_WVALID = 1'b0;

assign m_axi_gmem1_ARADDR = 64'd0;

assign m_axi_gmem1_ARBURST = 2'd0;

assign m_axi_gmem1_ARCACHE = 4'd0;

assign m_axi_gmem1_ARID = 1'd0;

assign m_axi_gmem1_ARLEN = 32'd0;

assign m_axi_gmem1_ARLOCK = 2'd0;

assign m_axi_gmem1_ARPROT = 3'd0;

assign m_axi_gmem1_ARQOS = 4'd0;

assign m_axi_gmem1_ARREGION = 4'd0;

assign m_axi_gmem1_ARSIZE = 3'd0;

assign m_axi_gmem1_ARUSER = 1'd0;

assign m_axi_gmem1_ARVALID = 1'b0;

assign m_axi_gmem1_AWADDR = 64'd0;

assign m_axi_gmem1_AWBURST = 2'd0;

assign m_axi_gmem1_AWCACHE = 4'd0;

assign m_axi_gmem1_AWID = 1'd0;

assign m_axi_gmem1_AWLEN = 32'd0;

assign m_axi_gmem1_AWLOCK = 2'd0;

assign m_axi_gmem1_AWPROT = 3'd0;

assign m_axi_gmem1_AWQOS = 4'd0;

assign m_axi_gmem1_AWREGION = 4'd0;

assign m_axi_gmem1_AWSIZE = 3'd0;

assign m_axi_gmem1_AWUSER = 1'd0;

assign m_axi_gmem1_AWVALID = 1'b0;

assign m_axi_gmem1_BREADY = 1'b0;

assign m_axi_gmem1_WDATA = 8'd0;

assign m_axi_gmem1_WID = 1'd0;

assign m_axi_gmem1_WLAST = 1'b0;

assign m_axi_gmem1_WSTRB = 1'd0;

assign m_axi_gmem1_WUSER = 1'd0;

assign m_axi_gmem1_WVALID = 1'b0;

assign m_axi_gmem3_ARADDR = gmem3_addr_reg_305;

assign m_axi_gmem3_ARBURST = 2'd0;

assign m_axi_gmem3_ARCACHE = 4'd0;

assign m_axi_gmem3_ARID = 1'd0;

assign m_axi_gmem3_ARLEN = 64'd1;

assign m_axi_gmem3_ARLOCK = 2'd0;

assign m_axi_gmem3_ARPROT = 3'd0;

assign m_axi_gmem3_ARQOS = 4'd0;

assign m_axi_gmem3_ARREGION = 4'd0;

assign m_axi_gmem3_ARSIZE = 3'd0;

assign m_axi_gmem3_ARUSER = 1'd0;

assign m_axi_gmem3_AWADDR = 64'd0;

assign m_axi_gmem3_AWBURST = 2'd0;

assign m_axi_gmem3_AWCACHE = 4'd0;

assign m_axi_gmem3_AWID = 1'd0;

assign m_axi_gmem3_AWLEN = 32'd0;

assign m_axi_gmem3_AWLOCK = 2'd0;

assign m_axi_gmem3_AWPROT = 3'd0;

assign m_axi_gmem3_AWQOS = 4'd0;

assign m_axi_gmem3_AWREGION = 4'd0;

assign m_axi_gmem3_AWSIZE = 3'd0;

assign m_axi_gmem3_AWUSER = 1'd0;

assign m_axi_gmem3_AWVALID = 1'b0;

assign m_axi_gmem3_BREADY = 1'b0;

assign m_axi_gmem3_WDATA = 32'd0;

assign m_axi_gmem3_WID = 1'd0;

assign m_axi_gmem3_WLAST = 1'b0;

assign m_axi_gmem3_WSTRB = 4'd0;

assign m_axi_gmem3_WUSER = 1'd0;

assign m_axi_gmem3_WVALID = 1'b0;

assign sext_ln43_fu_228_p1 = $signed(trunc_ln43_6_fu_218_p4);

assign shl_ln43_6_fu_202_p3 = {{trunc_ln43_reg_300}, {2'd0}};

assign sum_18_out = sum_fu_80;

assign sum_4_fu_247_p2 = (temp_reg_321 + sum_fu_80);

assign trunc_ln43_6_fu_218_p4 = {{add_ln43_fu_213_p2[63:2]}};

assign trunc_ln43_fu_198_p1 = m_axi_gmem1_RDATA[4:0];

assign zext_ln36_12_cast_fu_159_p1 = zext_ln36_12;

assign zext_ln36_13_cast_fu_155_p1 = zext_ln36_13;

assign zext_ln43_fu_209_p1 = shl_ln43_6_fu_202_p3;

always @ (posedge ap_clk) begin
    zext_ln36_13_cast_reg_291[63:9] <= 55'b0000000000000000000000000000000000000000000000000000000;
end

endmodule //SpMV_SpMV_Pipeline_spmv_loop_internal6
