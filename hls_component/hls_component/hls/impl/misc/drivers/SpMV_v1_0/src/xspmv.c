// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xspmv.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSpmv_CfgInitialize(XSpmv *InstancePtr, XSpmv_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSpmv_Set_values(XSpmv *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_VALUES_DATA, (u32)(Data));
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_VALUES_DATA + 4, (u32)(Data >> 32));
}

u64 XSpmv_Get_values(XSpmv *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_VALUES_DATA);
    Data += (u64)XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_VALUES_DATA + 4) << 32;
    return Data;
}

void XSpmv_Set_columnIndexes(XSpmv *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_COLUMNINDEXES_DATA, (u32)(Data));
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_COLUMNINDEXES_DATA + 4, (u32)(Data >> 32));
}

u64 XSpmv_Get_columnIndexes(XSpmv *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_COLUMNINDEXES_DATA);
    Data += (u64)XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_COLUMNINDEXES_DATA + 4) << 32;
    return Data;
}

void XSpmv_Set_rowPointers(XSpmv *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_ROWPOINTERS_DATA, (u32)(Data));
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_ROWPOINTERS_DATA + 4, (u32)(Data >> 32));
}

u64 XSpmv_Get_rowPointers(XSpmv *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_ROWPOINTERS_DATA);
    Data += (u64)XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_ROWPOINTERS_DATA + 4) << 32;
    return Data;
}

void XSpmv_Set_numOfRows(XSpmv *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_NUMOFROWS_DATA, Data);
}

u32 XSpmv_Get_numOfRows(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_NUMOFROWS_DATA);
    return Data;
}

void XSpmv_Set_vector(XSpmv *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_VECTOR_DATA, (u32)(Data));
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_VECTOR_DATA + 4, (u32)(Data >> 32));
}

u64 XSpmv_Get_vector(XSpmv *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_VECTOR_DATA);
    Data += (u64)XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_VECTOR_DATA + 4) << 32;
    return Data;
}

void XSpmv_Set_output_r(XSpmv *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_OUTPUT_R_DATA, (u32)(Data));
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_OUTPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XSpmv_Get_output_r(XSpmv *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_OUTPUT_R_DATA);
    Data += (u64)XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_OUTPUT_R_DATA + 4) << 32;
    return Data;
}

