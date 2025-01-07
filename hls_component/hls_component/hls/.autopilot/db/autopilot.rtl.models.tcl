set SynModuleInfo {
  {SRCNAME SpMV_Pipeline_spmv_loop_internal MODELNAME SpMV_Pipeline_spmv_loop_internal RTLNAME SpMV_SpMV_Pipeline_spmv_loop_internal
    SUBMODULES {
      {MODELNAME SpMV_mul_32s_32s_32_2_1 RTLNAME SpMV_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME SpMV_flow_control_loop_pipe_sequential_init RTLNAME SpMV_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME SpMV_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME SpMV MODELNAME SpMV RTLNAME SpMV IS_TOP 1}
}
