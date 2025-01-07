set moduleName SpMV
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {SpMV}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict values { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict columnIndexes { MEM_WIDTH 5 MEM_SIZE 100 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict rowPointers { MEM_WIDTH 9 MEM_SIZE 22 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict vector { MEM_WIDTH 32 MEM_SIZE 40 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict output_r { MEM_WIDTH 32 MEM_SIZE 40 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ values int 32 regular {array 100 { 1 3 } 1 1 }  }
	{ columnIndexes int 5 regular {array 100 { 1 3 } 1 1 }  }
	{ rowPointers int 9 regular {array 11 { 1 1 } 1 1 }  }
	{ numOfRows int 5 regular  }
	{ numOfCols int 5 unused  }
	{ vector int 32 regular {array 10 { 1 3 } 1 1 }  }
	{ output_r int 32 regular {array 10 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "values", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "columnIndexes", "interface" : "memory", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "rowPointers", "interface" : "memory", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "numOfRows", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "numOfCols", "interface" : "wire", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "vector", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "output_r", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ values_address0 sc_out sc_lv 7 signal 0 } 
	{ values_ce0 sc_out sc_logic 1 signal 0 } 
	{ values_q0 sc_in sc_lv 32 signal 0 } 
	{ columnIndexes_address0 sc_out sc_lv 7 signal 1 } 
	{ columnIndexes_ce0 sc_out sc_logic 1 signal 1 } 
	{ columnIndexes_q0 sc_in sc_lv 5 signal 1 } 
	{ rowPointers_address0 sc_out sc_lv 4 signal 2 } 
	{ rowPointers_ce0 sc_out sc_logic 1 signal 2 } 
	{ rowPointers_q0 sc_in sc_lv 9 signal 2 } 
	{ rowPointers_address1 sc_out sc_lv 4 signal 2 } 
	{ rowPointers_ce1 sc_out sc_logic 1 signal 2 } 
	{ rowPointers_q1 sc_in sc_lv 9 signal 2 } 
	{ numOfRows sc_in sc_lv 5 signal 3 } 
	{ numOfCols sc_in sc_lv 5 signal 4 } 
	{ vector_address0 sc_out sc_lv 4 signal 5 } 
	{ vector_ce0 sc_out sc_logic 1 signal 5 } 
	{ vector_q0 sc_in sc_lv 32 signal 5 } 
	{ output_r_address0 sc_out sc_lv 4 signal 6 } 
	{ output_r_ce0 sc_out sc_logic 1 signal 6 } 
	{ output_r_we0 sc_out sc_logic 1 signal 6 } 
	{ output_r_d0 sc_out sc_lv 32 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "values", "role": "address0" }} , 
 	{ "name": "values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "values", "role": "ce0" }} , 
 	{ "name": "values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "values", "role": "q0" }} , 
 	{ "name": "columnIndexes_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "columnIndexes", "role": "address0" }} , 
 	{ "name": "columnIndexes_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "columnIndexes", "role": "ce0" }} , 
 	{ "name": "columnIndexes_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "columnIndexes", "role": "q0" }} , 
 	{ "name": "rowPointers_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rowPointers", "role": "address0" }} , 
 	{ "name": "rowPointers_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rowPointers", "role": "ce0" }} , 
 	{ "name": "rowPointers_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "rowPointers", "role": "q0" }} , 
 	{ "name": "rowPointers_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "rowPointers", "role": "address1" }} , 
 	{ "name": "rowPointers_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rowPointers", "role": "ce1" }} , 
 	{ "name": "rowPointers_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "rowPointers", "role": "q1" }} , 
 	{ "name": "numOfRows", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "numOfRows", "role": "default" }} , 
 	{ "name": "numOfCols", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "numOfCols", "role": "default" }} , 
 	{ "name": "vector_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "vector", "role": "address0" }} , 
 	{ "name": "vector_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vector", "role": "ce0" }} , 
 	{ "name": "vector_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "vector", "role": "q0" }} , 
 	{ "name": "output_r_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "output_r", "role": "address0" }} , 
 	{ "name": "output_r_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "ce0" }} , 
 	{ "name": "output_r_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_r", "role": "we0" }} , 
 	{ "name": "output_r_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_r", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "5", "7", "9", "11", "13", "15", "17", "19", "21"],
		"CDFG" : "SpMV",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "values", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal_fu_560", "Port" : "values", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "11", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal5_fu_635", "Port" : "values", "Inst_start_state" : "17", "Inst_end_state" : "18"},
					{"ID" : "17", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal8_fu_680", "Port" : "values", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "3", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal1_fu_575", "Port" : "values", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "7", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal3_fu_605", "Port" : "values", "Inst_start_state" : "11", "Inst_end_state" : "12"},
					{"ID" : "5", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal2_fu_590", "Port" : "values", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "13", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal6_fu_650", "Port" : "values", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "9", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal4_fu_620", "Port" : "values", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "19", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal9_fu_695", "Port" : "values", "Inst_start_state" : "29", "Inst_end_state" : "30"},
					{"ID" : "15", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal7_fu_665", "Port" : "values", "Inst_start_state" : "23", "Inst_end_state" : "24"}]},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal_fu_560", "Port" : "columnIndexes", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "11", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal5_fu_635", "Port" : "columnIndexes", "Inst_start_state" : "17", "Inst_end_state" : "18"},
					{"ID" : "17", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal8_fu_680", "Port" : "columnIndexes", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "3", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal1_fu_575", "Port" : "columnIndexes", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "7", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal3_fu_605", "Port" : "columnIndexes", "Inst_start_state" : "11", "Inst_end_state" : "12"},
					{"ID" : "5", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal2_fu_590", "Port" : "columnIndexes", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "13", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal6_fu_650", "Port" : "columnIndexes", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "9", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal4_fu_620", "Port" : "columnIndexes", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "19", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal9_fu_695", "Port" : "columnIndexes", "Inst_start_state" : "29", "Inst_end_state" : "30"},
					{"ID" : "15", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal7_fu_665", "Port" : "columnIndexes", "Inst_start_state" : "23", "Inst_end_state" : "24"}]},
			{"Name" : "rowPointers", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "numOfRows", "Type" : "None", "Direction" : "I"},
			{"Name" : "numOfCols", "Type" : "None", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal_fu_560", "Port" : "vector", "Inst_start_state" : "2", "Inst_end_state" : "3"},
					{"ID" : "11", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal5_fu_635", "Port" : "vector", "Inst_start_state" : "17", "Inst_end_state" : "18"},
					{"ID" : "17", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal8_fu_680", "Port" : "vector", "Inst_start_state" : "26", "Inst_end_state" : "27"},
					{"ID" : "3", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal1_fu_575", "Port" : "vector", "Inst_start_state" : "5", "Inst_end_state" : "6"},
					{"ID" : "7", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal3_fu_605", "Port" : "vector", "Inst_start_state" : "11", "Inst_end_state" : "12"},
					{"ID" : "5", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal2_fu_590", "Port" : "vector", "Inst_start_state" : "8", "Inst_end_state" : "9"},
					{"ID" : "13", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal6_fu_650", "Port" : "vector", "Inst_start_state" : "20", "Inst_end_state" : "21"},
					{"ID" : "9", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal4_fu_620", "Port" : "vector", "Inst_start_state" : "14", "Inst_end_state" : "15"},
					{"ID" : "19", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal9_fu_695", "Port" : "vector", "Inst_start_state" : "29", "Inst_end_state" : "30"},
					{"ID" : "15", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal7_fu_665", "Port" : "vector", "Inst_start_state" : "23", "Inst_end_state" : "24"}]},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal_fu_560", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln22", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal_fu_560.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal1_fu_575", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln22_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_3_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal1_fu_575.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal2_fu_590", "Parent" : "0", "Child" : ["6"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln22_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_6_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal2_fu_590.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal3_fu_605", "Parent" : "0", "Child" : ["8"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln22_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_9_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal3_fu_605.flow_control_loop_pipe_sequential_init_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal4_fu_620", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln22_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_12_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal4_fu_620.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal5_fu_635", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln22_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_15_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal5_fu_635.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal6_fu_650", "Parent" : "0", "Child" : ["14"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln22_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_18_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal6_fu_650.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal7_fu_665", "Parent" : "0", "Child" : ["16"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln22_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_21_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal7_fu_665.flow_control_loop_pipe_sequential_init_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal8_fu_680", "Parent" : "0", "Child" : ["18"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal8",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln22_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_24_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal8_fu_680.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal9_fu_695", "Parent" : "0", "Child" : ["20"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal9",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln22_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "zext_ln22_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sum_27_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal9_fu_695.flow_control_loop_pipe_sequential_init_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U71", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	SpMV {
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		rowPointers {Type I LastRead 28 FirstWrite -1}
		numOfRows {Type I LastRead 0 FirstWrite -1}
		numOfCols {Type I LastRead -1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 3}}
	SpMV_Pipeline_spmv_loop_internal {
		zext_ln22 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_1 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_out {Type O LastRead -1 FirstWrite 5}}
	SpMV_Pipeline_spmv_loop_internal1 {
		zext_ln22_2 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_3 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_3_out {Type O LastRead -1 FirstWrite 5}}
	SpMV_Pipeline_spmv_loop_internal2 {
		zext_ln22_4 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_5 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_6_out {Type O LastRead -1 FirstWrite 5}}
	SpMV_Pipeline_spmv_loop_internal3 {
		zext_ln22_6 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_7 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_9_out {Type O LastRead -1 FirstWrite 5}}
	SpMV_Pipeline_spmv_loop_internal4 {
		zext_ln22_8 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_9 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_12_out {Type O LastRead -1 FirstWrite 5}}
	SpMV_Pipeline_spmv_loop_internal5 {
		zext_ln22_10 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_11 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_15_out {Type O LastRead -1 FirstWrite 5}}
	SpMV_Pipeline_spmv_loop_internal6 {
		zext_ln22_12 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_13 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_18_out {Type O LastRead -1 FirstWrite 5}}
	SpMV_Pipeline_spmv_loop_internal7 {
		zext_ln22_14 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_15 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_21_out {Type O LastRead -1 FirstWrite 5}}
	SpMV_Pipeline_spmv_loop_internal8 {
		zext_ln22_16 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_17 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_24_out {Type O LastRead -1 FirstWrite 5}}
	SpMV_Pipeline_spmv_loop_internal9 {
		zext_ln22_18 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_19 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_27_out {Type O LastRead -1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	values { ap_memory {  { values_address0 mem_address 1 7 }  { values_ce0 mem_ce 1 1 }  { values_q0 mem_dout 0 32 } } }
	columnIndexes { ap_memory {  { columnIndexes_address0 mem_address 1 7 }  { columnIndexes_ce0 mem_ce 1 1 }  { columnIndexes_q0 mem_dout 0 5 } } }
	rowPointers { ap_memory {  { rowPointers_address0 mem_address 1 4 }  { rowPointers_ce0 mem_ce 1 1 }  { rowPointers_q0 mem_dout 0 9 }  { rowPointers_address1 MemPortADDR2 1 4 }  { rowPointers_ce1 MemPortCE2 1 1 }  { rowPointers_q1 MemPortDOUT2 0 9 } } }
	numOfRows { ap_none {  { numOfRows in_data 0 5 } } }
	numOfCols { ap_none {  { numOfCols in_data 0 5 } } }
	vector { ap_memory {  { vector_address0 mem_address 1 4 }  { vector_ce0 mem_ce 1 1 }  { vector_q0 mem_dout 0 32 } } }
	output_r { ap_memory {  { output_r_address0 mem_address 1 4 }  { output_r_ce0 mem_ce 1 1 }  { output_r_we0 mem_we 1 1 }  { output_r_d0 mem_din 1 32 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
