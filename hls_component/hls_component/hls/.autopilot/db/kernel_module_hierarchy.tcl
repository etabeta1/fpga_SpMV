set ModuleHierarchy {[{
"Name" : "SpMV","ID" : "0","Type" : "sequential",
"SubLoops" : [
	{"Name" : "spmv_loop_external","ID" : "1","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_SpMV_Pipeline_spmv_loop_internal_fu_109","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "spmv_loop_internal","ID" : "3","Type" : "pipeline"},]},]},]
}]}