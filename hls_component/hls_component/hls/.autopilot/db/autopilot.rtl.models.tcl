set SynModuleInfo {
  {SRCNAME SpMV_Pipeline_spmv_loop_internal MODELNAME SpMV_Pipeline_spmv_loop_internal RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal
    SUBMODULES {
      {MODELNAME SpMV_flow_control_loop_pipe_sequential_init RTLNAME SpMV_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME SpMV_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME SpMV_Pipeline_spmv_loop_internal1 MODELNAME SpMV_Pipeline_spmv_loop_internal1 RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal1}
  {SRCNAME SpMV_Pipeline_spmv_loop_internal2 MODELNAME SpMV_Pipeline_spmv_loop_internal2 RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal2}
  {SRCNAME SpMV_Pipeline_spmv_loop_internal3 MODELNAME SpMV_Pipeline_spmv_loop_internal3 RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal3}
  {SRCNAME SpMV_Pipeline_spmv_loop_internal4 MODELNAME SpMV_Pipeline_spmv_loop_internal4 RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal4}
  {SRCNAME SpMV_Pipeline_spmv_loop_internal5 MODELNAME SpMV_Pipeline_spmv_loop_internal5 RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal5}
  {SRCNAME SpMV_Pipeline_spmv_loop_internal6 MODELNAME SpMV_Pipeline_spmv_loop_internal6 RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal6}
  {SRCNAME SpMV_Pipeline_spmv_loop_internal7 MODELNAME SpMV_Pipeline_spmv_loop_internal7 RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal7}
  {SRCNAME SpMV_Pipeline_spmv_loop_internal8 MODELNAME SpMV_Pipeline_spmv_loop_internal8 RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal8}
  {SRCNAME SpMV_Pipeline_spmv_loop_internal9 MODELNAME SpMV_Pipeline_spmv_loop_internal9 RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal9}
  {SRCNAME SpMV MODELNAME SpMV RTLNAME SpMV IS_TOP 1
    SUBMODULES {
      {MODELNAME SpMV_mul_32s_32s_32_2_1 RTLNAME SpMV_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
}
