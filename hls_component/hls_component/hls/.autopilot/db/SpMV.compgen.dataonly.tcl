# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
values { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
columnIndexes { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
rowPointers { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
numOfRows { 
	dir I
	width 5
	depth 1
	mode ap_none
	offset 52
	offset_end 59
}
vector { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 60
	offset_end 71
}
output_r { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 72
	offset_end 83
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


