set moduleName SpMV_Pipeline_spmv_loop_internal3
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {SpMV_Pipeline_spmv_loop_internal3}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict values { MEM_WIDTH 32 MEM_SIZE 400 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict columnIndexes { MEM_WIDTH 5 MEM_SIZE 100 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict vector { MEM_WIDTH 32 MEM_SIZE 40 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ zext_ln22_6 int 9 regular  }
	{ zext_ln22_7 int 9 regular  }
	{ values int 32 regular {array 100 { 1 3 } 1 1 }  }
	{ columnIndexes int 5 regular {array 100 { 1 3 } 1 1 }  }
	{ vector int 32 regular {array 10 { 1 3 } 1 1 }  }
	{ sum_9_out int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln22_6", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "zext_ln22_7", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "values", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "columnIndexes", "interface" : "memory", "bitwidth" : 5, "direction" : "READONLY"} , 
 	{ "Name" : "vector", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "sum_9_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln22_6 sc_in sc_lv 9 signal 0 } 
	{ zext_ln22_7 sc_in sc_lv 9 signal 1 } 
	{ values_address0 sc_out sc_lv 7 signal 2 } 
	{ values_ce0 sc_out sc_logic 1 signal 2 } 
	{ values_q0 sc_in sc_lv 32 signal 2 } 
	{ columnIndexes_address0 sc_out sc_lv 7 signal 3 } 
	{ columnIndexes_ce0 sc_out sc_logic 1 signal 3 } 
	{ columnIndexes_q0 sc_in sc_lv 5 signal 3 } 
	{ vector_address0 sc_out sc_lv 4 signal 4 } 
	{ vector_ce0 sc_out sc_logic 1 signal 4 } 
	{ vector_q0 sc_in sc_lv 32 signal 4 } 
	{ sum_9_out sc_out sc_lv 32 signal 5 } 
	{ sum_9_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ grp_fu_1072_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1072_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1072_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_1072_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln22_6", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln22_6", "role": "default" }} , 
 	{ "name": "zext_ln22_7", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln22_7", "role": "default" }} , 
 	{ "name": "values_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "values", "role": "address0" }} , 
 	{ "name": "values_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "values", "role": "ce0" }} , 
 	{ "name": "values_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "values", "role": "q0" }} , 
 	{ "name": "columnIndexes_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "columnIndexes", "role": "address0" }} , 
 	{ "name": "columnIndexes_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "columnIndexes", "role": "ce0" }} , 
 	{ "name": "columnIndexes_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "columnIndexes", "role": "q0" }} , 
 	{ "name": "vector_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "vector", "role": "address0" }} , 
 	{ "name": "vector_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vector", "role": "ce0" }} , 
 	{ "name": "vector_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "vector", "role": "q0" }} , 
 	{ "name": "sum_9_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "sum_9_out", "role": "default" }} , 
 	{ "name": "sum_9_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "sum_9_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_1072_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1072_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1072_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1072_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1072_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1072_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1072_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1072_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	SpMV_Pipeline_spmv_loop_internal3 {
		zext_ln22_6 {Type I LastRead 0 FirstWrite -1}
		zext_ln22_7 {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		sum_9_out {Type O LastRead -1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	zext_ln22_6 { ap_none {  { zext_ln22_6 in_data 0 9 } } }
	zext_ln22_7 { ap_none {  { zext_ln22_7 in_data 0 9 } } }
	values { ap_memory {  { values_address0 mem_address 1 7 }  { values_ce0 mem_ce 1 1 }  { values_q0 mem_dout 0 32 } } }
	columnIndexes { ap_memory {  { columnIndexes_address0 mem_address 1 7 }  { columnIndexes_ce0 mem_ce 1 1 }  { columnIndexes_q0 mem_dout 0 5 } } }
	vector { ap_memory {  { vector_address0 mem_address 1 4 }  { vector_ce0 mem_ce 1 1 }  { vector_q0 mem_dout 0 32 } } }
	sum_9_out { ap_vld {  { sum_9_out out_data 1 32 }  { sum_9_out_ap_vld out_vld 1 1 } } }
}
