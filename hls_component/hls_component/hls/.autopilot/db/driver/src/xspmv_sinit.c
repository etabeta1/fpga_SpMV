// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xspmv.h"

extern XSpmv_Config XSpmv_ConfigTable[];

#ifdef SDT
XSpmv_Config *XSpmv_LookupConfig(UINTPTR BaseAddress) {
	XSpmv_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XSpmv_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XSpmv_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XSpmv_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSpmv_Initialize(XSpmv *InstancePtr, UINTPTR BaseAddress) {
	XSpmv_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSpmv_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSpmv_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XSpmv_Config *XSpmv_LookupConfig(u16 DeviceId) {
	XSpmv_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSPMV_NUM_INSTANCES; Index++) {
		if (XSpmv_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSpmv_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSpmv_Initialize(XSpmv *InstancePtr, u16 DeviceId) {
	XSpmv_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSpmv_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSpmv_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

