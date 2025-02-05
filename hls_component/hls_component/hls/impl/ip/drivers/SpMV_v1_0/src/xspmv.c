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

void XSpmv_Start(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSpmv_IsDone(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSpmv_IsIdle(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSpmv_IsReady(XSpmv *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSpmv_EnableAutoRestart(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSpmv_DisableAutoRestart(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_AP_CTRL, 0);
}

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

void XSpmv_InterruptGlobalEnable(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_GIE, 1);
}

void XSpmv_InterruptGlobalDisable(XSpmv *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_GIE, 0);
}

void XSpmv_InterruptEnable(XSpmv *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_IER);
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_IER, Register | Mask);
}

void XSpmv_InterruptDisable(XSpmv *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_IER);
    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSpmv_InterruptClear(XSpmv *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSpmv_WriteReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_ISR, Mask);
}

u32 XSpmv_InterruptGetEnabled(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_IER);
}

u32 XSpmv_InterruptGetStatus(XSpmv *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSpmv_ReadReg(InstancePtr->Control_BaseAddress, XSPMV_CONTROL_ADDR_ISR);
}

