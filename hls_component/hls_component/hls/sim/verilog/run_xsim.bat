
set PATH=
call D:/Xilinx/Vivado/2024.1/bin/xelab xil_defaultlib.apatb_SpMV_top glbl -Oenable_linking_all_libraries  -prj SpMV.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver -L xpm  -L floating_point_v7_0_23 -L floating_point_v7_1_18 --lib "ieee_proposed=./ieee_proposed" -s SpMV 
call D:/Xilinx/Vivado/2024.1/bin/xsim --noieeewarnings SpMV -tclbatch SpMV.tcl 

