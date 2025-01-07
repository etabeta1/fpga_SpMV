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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "SpMV",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "21", "EstimateLatencyMax" : "5211",
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
					{"ID" : "1", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal_fu_109", "Port" : "values", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal_fu_109", "Port" : "columnIndexes", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "rowPointers", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "numOfRows", "Type" : "None", "Direction" : "I"},
			{"Name" : "numOfCols", "Type" : "None", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_SpMV_Pipeline_spmv_loop_internal_fu_109", "Port" : "vector", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "output_r", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_external", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_state2", "LastState" : ["ap_ST_fsm_state5"], "QuitState" : ["ap_ST_fsm_state2"], "PreState" : ["ap_ST_fsm_state1"], "PostState" : ["ap_ST_fsm_state1"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal_fu_109", "Parent" : "0", "Child" : ["2", "3"],
		"CDFG" : "SpMV_Pipeline_spmv_loop_internal",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "517",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln19", "Type" : "None", "Direction" : "I"},
			{"Name" : "wide_trip_count", "Type" : "None", "Direction" : "I"},
			{"Name" : "values", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "columnIndexes", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vector", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "add7_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "spmv_loop_internal", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal_fu_109.mul_32s_32s_32_2_1_U1", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_SpMV_Pipeline_spmv_loop_internal_fu_109.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	SpMV {
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		rowPointers {Type I LastRead 2 FirstWrite -1}
		numOfRows {Type I LastRead 0 FirstWrite -1}
		numOfCols {Type I LastRead -1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		output_r {Type O LastRead -1 FirstWrite 1}}
	SpMV_Pipeline_spmv_loop_internal {
		zext_ln19 {Type I LastRead 0 FirstWrite -1}
		wide_trip_count {Type I LastRead 0 FirstWrite -1}
		values {Type I LastRead 2 FirstWrite -1}
		columnIndexes {Type I LastRead 1 FirstWrite -1}
		vector {Type I LastRead 2 FirstWrite -1}
		add7_out {Type O LastRead -1 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "21", "Max" : "5211"}
	, {"Name" : "Interval", "Min" : "22", "Max" : "5212"}
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
