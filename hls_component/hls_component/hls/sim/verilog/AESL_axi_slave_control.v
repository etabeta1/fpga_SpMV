// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps

module AESL_axi_slave_control (
    clk,
    reset,
    TRAN_s_axi_control_AWADDR,
    TRAN_s_axi_control_AWVALID,
    TRAN_s_axi_control_AWREADY,
    TRAN_s_axi_control_WVALID,
    TRAN_s_axi_control_WREADY,
    TRAN_s_axi_control_WDATA,
    TRAN_s_axi_control_WSTRB,
    TRAN_s_axi_control_ARADDR,
    TRAN_s_axi_control_ARVALID,
    TRAN_s_axi_control_ARREADY,
    TRAN_s_axi_control_RVALID,
    TRAN_s_axi_control_RREADY,
    TRAN_s_axi_control_RDATA,
    TRAN_s_axi_control_RRESP,
    TRAN_s_axi_control_BVALID,
    TRAN_s_axi_control_BREADY,
    TRAN_s_axi_control_BRESP,
    TRAN_control_write_data_finish,
    TRAN_control_start_in,
    TRAN_control_idle_in,
    TRAN_control_ready_in,
    TRAN_control_done_in,
    TRAN_control_transaction_done_in
    );

//------------------------Parameter----------------------
`define TV_IN_values "../tv/cdatafile/c.SpMV.autotvin_values.dat"
`define TV_IN_columnIndexes "../tv/cdatafile/c.SpMV.autotvin_columnIndexes.dat"
`define TV_IN_rowPointers "../tv/cdatafile/c.SpMV.autotvin_rowPointers.dat"
`define TV_IN_numOfRows "../tv/cdatafile/c.SpMV.autotvin_numOfRows.dat"
`define TV_IN_vector "../tv/cdatafile/c.SpMV.autotvin_vector.dat"
`define TV_IN_output_r "../tv/cdatafile/c.SpMV.autotvin_output_r.dat"
parameter ADDR_WIDTH = 7;
parameter DATA_WIDTH = 32;
parameter values_DEPTH = 1;
reg [31 : 0] values_OPERATE_DEPTH = 0;
parameter values_c_bitwidth = 64;
parameter columnIndexes_DEPTH = 1;
reg [31 : 0] columnIndexes_OPERATE_DEPTH = 0;
parameter columnIndexes_c_bitwidth = 64;
parameter rowPointers_DEPTH = 1;
reg [31 : 0] rowPointers_OPERATE_DEPTH = 0;
parameter rowPointers_c_bitwidth = 64;
parameter numOfRows_DEPTH = 1;
reg [31 : 0] numOfRows_OPERATE_DEPTH = 0;
parameter numOfRows_c_bitwidth = 5;
parameter vector_DEPTH = 1;
reg [31 : 0] vector_OPERATE_DEPTH = 0;
parameter vector_c_bitwidth = 64;
parameter output_r_DEPTH = 1;
reg [31 : 0] output_r_OPERATE_DEPTH = 0;
parameter output_r_c_bitwidth = 64;
parameter values_data_in_addr = 16;
parameter columnIndexes_data_in_addr = 28;
parameter rowPointers_data_in_addr = 40;
parameter numOfRows_data_in_addr = 52;
parameter vector_data_in_addr = 60;
parameter output_r_data_in_addr = 72;

output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_control_AWADDR;
output  TRAN_s_axi_control_AWVALID;
input  TRAN_s_axi_control_AWREADY;
output  TRAN_s_axi_control_WVALID;
input  TRAN_s_axi_control_WREADY;
output [DATA_WIDTH - 1 : 0] TRAN_s_axi_control_WDATA;
output [DATA_WIDTH/8 - 1 : 0] TRAN_s_axi_control_WSTRB;
output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_control_ARADDR;
output  TRAN_s_axi_control_ARVALID;
input  TRAN_s_axi_control_ARREADY;
input  TRAN_s_axi_control_RVALID;
output  TRAN_s_axi_control_RREADY;
input [DATA_WIDTH - 1 : 0] TRAN_s_axi_control_RDATA;
input [2 - 1 : 0] TRAN_s_axi_control_RRESP;
input  TRAN_s_axi_control_BVALID;
output  TRAN_s_axi_control_BREADY;
input [2 - 1 : 0] TRAN_s_axi_control_BRESP;
output TRAN_control_write_data_finish;
input     clk;
input     reset;
input     TRAN_control_start_in;
input     TRAN_control_done_in;
input     TRAN_control_ready_in;
input     TRAN_control_idle_in;
input     TRAN_control_transaction_done_in;

reg [ADDR_WIDTH - 1 : 0] AWADDR_reg = 0;
reg  AWVALID_reg = 0;
reg  WVALID_reg = 0;
reg [DATA_WIDTH - 1 : 0] WDATA_reg = 0;
reg [DATA_WIDTH/8 - 1 : 0] WSTRB_reg = 0;
reg [ADDR_WIDTH - 1 : 0] ARADDR_reg = 0;
reg  ARVALID_reg = 0;
reg  RREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] RDATA_reg = 0;
reg  BREADY_reg = 0;
reg [values_c_bitwidth - 1 : 0] mem_values [values_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_values [ (values_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * values_DEPTH -1 : 0] = '{default : 'hz};
reg values_write_data_finish;
reg [columnIndexes_c_bitwidth - 1 : 0] mem_columnIndexes [columnIndexes_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_columnIndexes [ (columnIndexes_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * columnIndexes_DEPTH -1 : 0] = '{default : 'hz};
reg columnIndexes_write_data_finish;
reg [rowPointers_c_bitwidth - 1 : 0] mem_rowPointers [rowPointers_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_rowPointers [ (rowPointers_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * rowPointers_DEPTH -1 : 0] = '{default : 'hz};
reg rowPointers_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_numOfRows [numOfRows_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_numOfRows [ (numOfRows_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * numOfRows_DEPTH -1 : 0] = '{default : 'hz};
reg numOfRows_write_data_finish;
reg [vector_c_bitwidth - 1 : 0] mem_vector [vector_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_vector [ (vector_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * vector_DEPTH -1 : 0] = '{default : 'hz};
reg vector_write_data_finish;
reg [output_r_c_bitwidth - 1 : 0] mem_output_r [output_r_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_output_r [ (output_r_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * output_r_DEPTH -1 : 0] = '{default : 'hz};
reg output_r_write_data_finish;
reg AESL_ready_out_index_reg = 0;
reg AESL_write_start_finish = 0;
reg AESL_ready_reg;
reg ready_initial;
reg AESL_done_index_reg = 0;
reg AESL_idle_index_reg = 0;
reg AESL_auto_restart_index_reg;
reg process_0_finish = 0;
reg process_1_finish = 0;
reg process_2_finish = 0;
reg process_3_finish = 0;
reg process_4_finish = 0;
reg process_5_finish = 0;
//write values reg
reg [31 : 0] write_values_count = 0;
reg [31 : 0] values_diff_count = 0;
reg write_values_run_flag = 0;
reg write_one_values_data_done = 0;
//write columnIndexes reg
reg [31 : 0] write_columnIndexes_count = 0;
reg [31 : 0] columnIndexes_diff_count = 0;
reg write_columnIndexes_run_flag = 0;
reg write_one_columnIndexes_data_done = 0;
//write rowPointers reg
reg [31 : 0] write_rowPointers_count = 0;
reg [31 : 0] rowPointers_diff_count = 0;
reg write_rowPointers_run_flag = 0;
reg write_one_rowPointers_data_done = 0;
//write numOfRows reg
reg [31 : 0] write_numOfRows_count = 0;
reg [31 : 0] numOfRows_diff_count = 0;
reg write_numOfRows_run_flag = 0;
reg write_one_numOfRows_data_done = 0;
//write vector reg
reg [31 : 0] write_vector_count = 0;
reg [31 : 0] vector_diff_count = 0;
reg write_vector_run_flag = 0;
reg write_one_vector_data_done = 0;
//write output_r reg
reg [31 : 0] write_output_r_count = 0;
reg [31 : 0] output_r_diff_count = 0;
reg write_output_r_run_flag = 0;
reg write_one_output_r_data_done = 0;

//===================process control=================
reg [31 : 0] ongoing_process_number = 0;
//process number depends on how much processes needed.
reg process_busy = 0;

//=================== signal connection ==============
assign TRAN_s_axi_control_AWADDR = AWADDR_reg;
assign TRAN_s_axi_control_AWVALID = AWVALID_reg;
assign TRAN_s_axi_control_WVALID = WVALID_reg;
assign TRAN_s_axi_control_WDATA = WDATA_reg;
assign TRAN_s_axi_control_WSTRB = WSTRB_reg;
assign TRAN_s_axi_control_ARADDR = ARADDR_reg;
assign TRAN_s_axi_control_ARVALID = ARVALID_reg;
assign TRAN_s_axi_control_RREADY = RREADY_reg;
assign TRAN_s_axi_control_BREADY = BREADY_reg;
assign TRAN_control_write_data_finish = 1 & values_write_data_finish & columnIndexes_write_data_finish & rowPointers_write_data_finish & numOfRows_write_data_finish & vector_write_data_finish & output_r_write_data_finish;
always @(TRAN_control_done_in) 
begin
    AESL_done_index_reg <= TRAN_control_done_in;
end
always @(TRAN_control_ready_in or ready_initial) 
begin
    AESL_ready_reg <= TRAN_control_ready_in | ready_initial;
end

always @(reset or process_0_finish or process_1_finish or process_2_finish or process_3_finish or process_4_finish or process_5_finish ) begin
    if (reset == 0) begin
        ongoing_process_number <= 0;
    end
    else if (ongoing_process_number == 0 && process_0_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 1 && process_1_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 2 && process_2_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 3 && process_3_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 4 && process_4_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 5 && process_5_finish == 1) begin
            ongoing_process_number <= 0;
    end
end

task count_c_data_four_byte_num_by_bitwidth;
input  integer bitwidth;
output integer num;
integer factor;
integer i;
begin
    factor = 32;
    for (i = 1; i <= 1024; i = i + 1) begin
        if (bitwidth <= factor && bitwidth > factor - 32) begin
            num = i;
        end
        factor = factor + 32;
    end
end    
endtask

function integer ceil_align_to_pow_of_two;
input integer a;
begin
    ceil_align_to_pow_of_two = $pow(2,$clog2(a));
end
endfunction

task count_seperate_factor_by_bitwidth;
input  integer bitwidth;
output integer factor;
begin
    if (bitwidth <= 8) begin
        factor=4;
    end
    if (bitwidth <= 16 & bitwidth > 8 ) begin
        factor=2;
    end
    if (bitwidth <= 32 & bitwidth > 16 ) begin
        factor=1;
    end
    if (bitwidth > 32 ) begin
        factor=1;
    end
end    
endtask

task count_operate_depth_by_bitwidth_and_depth;
input  integer bitwidth;
input  integer depth;
output integer operate_depth;
integer factor;
integer remain;
begin
    count_seperate_factor_by_bitwidth (bitwidth , factor);
    operate_depth = depth / factor;
    remain = depth % factor;
    if (remain > 0) begin
        operate_depth = operate_depth + 1;
    end
end    
endtask

task write; /*{{{*/
    input  reg [ADDR_WIDTH - 1:0] waddr;   // write address
    input  reg [DATA_WIDTH - 1:0] wdata;   // write data
    output reg wresp;
    reg aw_flag;
    reg w_flag;
    reg [DATA_WIDTH/8 - 1:0] wstrb_reg;
    integer i;
begin 
    wresp = 0;
    aw_flag = 0;
    w_flag = 0;
//=======================one single write operate======================
    AWADDR_reg <= waddr;
    AWVALID_reg <= 1;
    WDATA_reg <= wdata;
    WVALID_reg <= 1;
    for (i = 0; i < DATA_WIDTH/8; i = i + 1) begin
        wstrb_reg [i] = 1;
    end    
    WSTRB_reg <= wstrb_reg;
    while (!(aw_flag && w_flag)) begin
        @(posedge clk);
        if (aw_flag != 1)
            aw_flag = TRAN_s_axi_control_AWREADY & AWVALID_reg;
        if (w_flag != 1)
            w_flag = TRAN_s_axi_control_WREADY & WVALID_reg;
        AWVALID_reg <= !aw_flag;
        WVALID_reg <= !w_flag;
    end

    BREADY_reg <= 1;
    while (TRAN_s_axi_control_BVALID != 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    BREADY_reg <= 0;
    if (TRAN_s_axi_control_BRESP === 2'b00) begin
        wresp = 1;
        //input success. in fact BRESP is always 2'b00
    end   
//=======================one single write operate======================

end
endtask/*}}}*/

task read (/*{{{*/
    input  [ADDR_WIDTH - 1:0] raddr ,   // write address
    output [DATA_WIDTH - 1:0] RDATA_result ,
    output rresp
);
begin 
    rresp = 0;
//=======================one single read operate======================
    ARADDR_reg <= raddr;
    ARVALID_reg <= 1;
    while (TRAN_s_axi_control_ARREADY !== 1) begin
        @(posedge clk);
    end
    @(posedge clk);
    ARVALID_reg <= 0;
    RREADY_reg <= 1;
    while (TRAN_s_axi_control_RVALID !== 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    RDATA_result  <= TRAN_s_axi_control_RDATA;
    RREADY_reg <= 0;
    if (TRAN_s_axi_control_RRESP === 2'b00 ) begin
        rresp <= 1;
        //output success. in fact RRESP is always 2'b00
    end  
    @(posedge clk);

//=======================one single read operate end======================

end
endtask/*}}}*/

initial begin : ready_initial_process
    ready_initial = 0;
    wait(reset === 1);
    @(posedge clk);
    ready_initial = 1;
    @(posedge clk);
    ready_initial = 0;
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_values_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (values_c_bitwidth, values_DEPTH, values_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_values_run_flag <= 1; 
        end
        else if ((write_one_values_data_done == 1 && write_values_count == values_diff_count - 1) || values_diff_count == 0) begin
            write_values_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_values_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_values_count = 0;
        end
        if (write_one_values_data_done === 1) begin
            write_values_count = write_values_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        values_write_data_finish <= 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            values_write_data_finish <= 0;
        end
        if (write_values_run_flag == 1 && write_values_count == values_diff_count) begin
            values_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_values
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] values_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = values_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        values_diff_count = 0;

        for (k = 0; k < values_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (values_c_bitwidth < 32) begin
                    values_data_tmp_reg = mem_values[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < values_c_bitwidth) begin
                            values_data_tmp_reg[j] = mem_values[k][i*32 + j];
                        end
                        else begin
                            values_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_values[k * four_byte_num  + i]!==values_data_tmp_reg) begin
                values_diff_count = values_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_values
    integer write_values_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_values_count;
    reg [31 : 0] values_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = values_c_bitwidth;
    process_num = 0;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_0_finish <= 0;

        for (check_values_count = 0; check_values_count < values_OPERATE_DEPTH; check_values_count = check_values_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_values_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write values data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (values_c_bitwidth < 32) begin
                        values_data_tmp_reg = mem_values[check_values_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < values_c_bitwidth) begin
                                values_data_tmp_reg[j] = mem_values[check_values_count][i*32 + j];
                            end
                            else begin
                                values_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_values[check_values_count * four_byte_num  + i]!==values_data_tmp_reg) begin
                        image_mem_values[check_values_count * four_byte_num + i]=values_data_tmp_reg;
                        write (values_data_in_addr + check_values_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, values_data_tmp_reg, write_values_resp);
                        write_one_values_data_done <= 1;
                        @(posedge clk);
                        write_one_values_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_0_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_columnIndexes_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (columnIndexes_c_bitwidth, columnIndexes_DEPTH, columnIndexes_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_columnIndexes_run_flag <= 1; 
        end
        else if ((write_one_columnIndexes_data_done == 1 && write_columnIndexes_count == columnIndexes_diff_count - 1) || columnIndexes_diff_count == 0) begin
            write_columnIndexes_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_columnIndexes_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_columnIndexes_count = 0;
        end
        if (write_one_columnIndexes_data_done === 1) begin
            write_columnIndexes_count = write_columnIndexes_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        columnIndexes_write_data_finish <= 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            columnIndexes_write_data_finish <= 0;
        end
        if (write_columnIndexes_run_flag == 1 && write_columnIndexes_count == columnIndexes_diff_count) begin
            columnIndexes_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_columnIndexes
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] columnIndexes_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = columnIndexes_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        columnIndexes_diff_count = 0;

        for (k = 0; k < columnIndexes_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (columnIndexes_c_bitwidth < 32) begin
                    columnIndexes_data_tmp_reg = mem_columnIndexes[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < columnIndexes_c_bitwidth) begin
                            columnIndexes_data_tmp_reg[j] = mem_columnIndexes[k][i*32 + j];
                        end
                        else begin
                            columnIndexes_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_columnIndexes[k * four_byte_num  + i]!==columnIndexes_data_tmp_reg) begin
                columnIndexes_diff_count = columnIndexes_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_columnIndexes
    integer write_columnIndexes_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_columnIndexes_count;
    reg [31 : 0] columnIndexes_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = columnIndexes_c_bitwidth;
    process_num = 1;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_1_finish <= 0;

        for (check_columnIndexes_count = 0; check_columnIndexes_count < columnIndexes_OPERATE_DEPTH; check_columnIndexes_count = check_columnIndexes_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_columnIndexes_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write columnIndexes data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (columnIndexes_c_bitwidth < 32) begin
                        columnIndexes_data_tmp_reg = mem_columnIndexes[check_columnIndexes_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < columnIndexes_c_bitwidth) begin
                                columnIndexes_data_tmp_reg[j] = mem_columnIndexes[check_columnIndexes_count][i*32 + j];
                            end
                            else begin
                                columnIndexes_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_columnIndexes[check_columnIndexes_count * four_byte_num  + i]!==columnIndexes_data_tmp_reg) begin
                        image_mem_columnIndexes[check_columnIndexes_count * four_byte_num + i]=columnIndexes_data_tmp_reg;
                        write (columnIndexes_data_in_addr + check_columnIndexes_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, columnIndexes_data_tmp_reg, write_columnIndexes_resp);
                        write_one_columnIndexes_data_done <= 1;
                        @(posedge clk);
                        write_one_columnIndexes_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_1_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_rowPointers_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (rowPointers_c_bitwidth, rowPointers_DEPTH, rowPointers_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_rowPointers_run_flag <= 1; 
        end
        else if ((write_one_rowPointers_data_done == 1 && write_rowPointers_count == rowPointers_diff_count - 1) || rowPointers_diff_count == 0) begin
            write_rowPointers_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_rowPointers_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_rowPointers_count = 0;
        end
        if (write_one_rowPointers_data_done === 1) begin
            write_rowPointers_count = write_rowPointers_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        rowPointers_write_data_finish <= 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            rowPointers_write_data_finish <= 0;
        end
        if (write_rowPointers_run_flag == 1 && write_rowPointers_count == rowPointers_diff_count) begin
            rowPointers_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_rowPointers
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] rowPointers_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = rowPointers_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        rowPointers_diff_count = 0;

        for (k = 0; k < rowPointers_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (rowPointers_c_bitwidth < 32) begin
                    rowPointers_data_tmp_reg = mem_rowPointers[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < rowPointers_c_bitwidth) begin
                            rowPointers_data_tmp_reg[j] = mem_rowPointers[k][i*32 + j];
                        end
                        else begin
                            rowPointers_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_rowPointers[k * four_byte_num  + i]!==rowPointers_data_tmp_reg) begin
                rowPointers_diff_count = rowPointers_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_rowPointers
    integer write_rowPointers_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_rowPointers_count;
    reg [31 : 0] rowPointers_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = rowPointers_c_bitwidth;
    process_num = 2;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_2_finish <= 0;

        for (check_rowPointers_count = 0; check_rowPointers_count < rowPointers_OPERATE_DEPTH; check_rowPointers_count = check_rowPointers_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_rowPointers_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write rowPointers data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (rowPointers_c_bitwidth < 32) begin
                        rowPointers_data_tmp_reg = mem_rowPointers[check_rowPointers_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < rowPointers_c_bitwidth) begin
                                rowPointers_data_tmp_reg[j] = mem_rowPointers[check_rowPointers_count][i*32 + j];
                            end
                            else begin
                                rowPointers_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_rowPointers[check_rowPointers_count * four_byte_num  + i]!==rowPointers_data_tmp_reg) begin
                        image_mem_rowPointers[check_rowPointers_count * four_byte_num + i]=rowPointers_data_tmp_reg;
                        write (rowPointers_data_in_addr + check_rowPointers_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, rowPointers_data_tmp_reg, write_rowPointers_resp);
                        write_one_rowPointers_data_done <= 1;
                        @(posedge clk);
                        write_one_rowPointers_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_2_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_numOfRows_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (numOfRows_c_bitwidth, numOfRows_DEPTH, numOfRows_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_numOfRows_run_flag <= 1; 
        end
        else if ((write_one_numOfRows_data_done == 1 && write_numOfRows_count == numOfRows_diff_count - 1) || numOfRows_diff_count == 0) begin
            write_numOfRows_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_numOfRows_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_numOfRows_count = 0;
        end
        if (write_one_numOfRows_data_done === 1) begin
            write_numOfRows_count = write_numOfRows_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        numOfRows_write_data_finish <= 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            numOfRows_write_data_finish <= 0;
        end
        if (write_numOfRows_run_flag == 1 && write_numOfRows_count == numOfRows_diff_count) begin
            numOfRows_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_numOfRows
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] numOfRows_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = numOfRows_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        numOfRows_diff_count = 0;

        for (k = 0; k < numOfRows_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (numOfRows_c_bitwidth < 32) begin
                    numOfRows_data_tmp_reg = mem_numOfRows[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < numOfRows_c_bitwidth) begin
                            numOfRows_data_tmp_reg[j] = mem_numOfRows[k][i*32 + j];
                        end
                        else begin
                            numOfRows_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_numOfRows[k * four_byte_num  + i]!==numOfRows_data_tmp_reg) begin
                numOfRows_diff_count = numOfRows_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_numOfRows
    integer write_numOfRows_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_numOfRows_count;
    reg [31 : 0] numOfRows_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = numOfRows_c_bitwidth;
    process_num = 3;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_3_finish <= 0;

        for (check_numOfRows_count = 0; check_numOfRows_count < numOfRows_OPERATE_DEPTH; check_numOfRows_count = check_numOfRows_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_numOfRows_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write numOfRows data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (numOfRows_c_bitwidth < 32) begin
                        numOfRows_data_tmp_reg = mem_numOfRows[check_numOfRows_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < numOfRows_c_bitwidth) begin
                                numOfRows_data_tmp_reg[j] = mem_numOfRows[check_numOfRows_count][i*32 + j];
                            end
                            else begin
                                numOfRows_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_numOfRows[check_numOfRows_count * four_byte_num  + i]!==numOfRows_data_tmp_reg) begin
                        image_mem_numOfRows[check_numOfRows_count * four_byte_num + i]=numOfRows_data_tmp_reg;
                        write (numOfRows_data_in_addr + check_numOfRows_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, numOfRows_data_tmp_reg, write_numOfRows_resp);
                        write_one_numOfRows_data_done <= 1;
                        @(posedge clk);
                        write_one_numOfRows_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_3_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_vector_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (vector_c_bitwidth, vector_DEPTH, vector_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_vector_run_flag <= 1; 
        end
        else if ((write_one_vector_data_done == 1 && write_vector_count == vector_diff_count - 1) || vector_diff_count == 0) begin
            write_vector_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_vector_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_vector_count = 0;
        end
        if (write_one_vector_data_done === 1) begin
            write_vector_count = write_vector_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        vector_write_data_finish <= 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            vector_write_data_finish <= 0;
        end
        if (write_vector_run_flag == 1 && write_vector_count == vector_diff_count) begin
            vector_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_vector
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] vector_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = vector_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        vector_diff_count = 0;

        for (k = 0; k < vector_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (vector_c_bitwidth < 32) begin
                    vector_data_tmp_reg = mem_vector[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < vector_c_bitwidth) begin
                            vector_data_tmp_reg[j] = mem_vector[k][i*32 + j];
                        end
                        else begin
                            vector_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_vector[k * four_byte_num  + i]!==vector_data_tmp_reg) begin
                vector_diff_count = vector_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_vector
    integer write_vector_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_vector_count;
    reg [31 : 0] vector_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = vector_c_bitwidth;
    process_num = 4;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_4_finish <= 0;

        for (check_vector_count = 0; check_vector_count < vector_OPERATE_DEPTH; check_vector_count = check_vector_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_vector_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write vector data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (vector_c_bitwidth < 32) begin
                        vector_data_tmp_reg = mem_vector[check_vector_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < vector_c_bitwidth) begin
                                vector_data_tmp_reg[j] = mem_vector[check_vector_count][i*32 + j];
                            end
                            else begin
                                vector_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_vector[check_vector_count * four_byte_num  + i]!==vector_data_tmp_reg) begin
                        image_mem_vector[check_vector_count * four_byte_num + i]=vector_data_tmp_reg;
                        write (vector_data_in_addr + check_vector_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, vector_data_tmp_reg, write_vector_resp);
                        write_one_vector_data_done <= 1;
                        @(posedge clk);
                        write_one_vector_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_4_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_output_r_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (output_r_c_bitwidth, output_r_DEPTH, output_r_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_output_r_run_flag <= 1; 
        end
        else if ((write_one_output_r_data_done == 1 && write_output_r_count == output_r_diff_count - 1) || output_r_diff_count == 0) begin
            write_output_r_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_output_r_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_output_r_count = 0;
        end
        if (write_one_output_r_data_done === 1) begin
            write_output_r_count = write_output_r_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        output_r_write_data_finish <= 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            output_r_write_data_finish <= 0;
        end
        if (write_output_r_run_flag == 1 && write_output_r_count == output_r_diff_count) begin
            output_r_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_output_r
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] output_r_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = output_r_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        output_r_diff_count = 0;

        for (k = 0; k < output_r_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (output_r_c_bitwidth < 32) begin
                    output_r_data_tmp_reg = mem_output_r[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < output_r_c_bitwidth) begin
                            output_r_data_tmp_reg[j] = mem_output_r[k][i*32 + j];
                        end
                        else begin
                            output_r_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_output_r[k * four_byte_num  + i]!==output_r_data_tmp_reg) begin
                output_r_diff_count = output_r_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_output_r
    integer write_output_r_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_output_r_count;
    reg [31 : 0] output_r_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = output_r_c_bitwidth;
    process_num = 5;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_5_finish <= 0;

        for (check_output_r_count = 0; check_output_r_count < output_r_OPERATE_DEPTH; check_output_r_count = check_output_r_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_output_r_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write output_r data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (output_r_c_bitwidth < 32) begin
                        output_r_data_tmp_reg = mem_output_r[check_output_r_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < output_r_c_bitwidth) begin
                                output_r_data_tmp_reg[j] = mem_output_r[check_output_r_count][i*32 + j];
                            end
                            else begin
                                output_r_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_output_r[check_output_r_count * four_byte_num  + i]!==output_r_data_tmp_reg) begin
                        image_mem_output_r[check_output_r_count * four_byte_num + i]=output_r_data_tmp_reg;
                        write (output_r_data_in_addr + check_output_r_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, output_r_data_tmp_reg, write_output_r_resp);
                        write_one_output_r_data_done <= 1;
                        @(posedge clk);
                        write_one_output_r_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_5_finish <= 1;
        @(posedge clk);
    end    
end


//------------------------Task and function-------------- 
task read_token; 
    input integer fp; 
    output reg [151 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end 
endtask 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_values_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [values_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (values_c_bitwidth , factor);
  fp = $fopen(`TV_IN_values ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_values); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < values_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_values [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_values [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_values [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_values [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_values [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_values;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_columnIndexes_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [columnIndexes_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (columnIndexes_c_bitwidth , factor);
  fp = $fopen(`TV_IN_columnIndexes ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_columnIndexes); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < columnIndexes_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_columnIndexes [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_columnIndexes [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_columnIndexes [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_columnIndexes [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_columnIndexes [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_columnIndexes;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_rowPointers_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [rowPointers_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (rowPointers_c_bitwidth , factor);
  fp = $fopen(`TV_IN_rowPointers ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_rowPointers); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < rowPointers_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_rowPointers [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_rowPointers [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_rowPointers [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_rowPointers [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_rowPointers [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_rowPointers;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_numOfRows_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [numOfRows_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (numOfRows_c_bitwidth , factor);
  fp = $fopen(`TV_IN_numOfRows ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_numOfRows); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < numOfRows_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_numOfRows [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_numOfRows [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_numOfRows [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_numOfRows [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_numOfRows [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_numOfRows;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_vector_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [vector_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (vector_c_bitwidth , factor);
  fp = $fopen(`TV_IN_vector ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_vector); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < vector_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_vector [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_vector [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_vector [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_vector [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_vector [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_vector;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_output_r_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [151 : 0] token; 
  reg [151 : 0] token_tmp; 
  //reg [output_r_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (output_r_c_bitwidth , factor);
  fp = $fopen(`TV_IN_output_r ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_output_r); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < output_r_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_output_r [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_output_r [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_output_r [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_output_r [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_output_r [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_output_r;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
endmodule
