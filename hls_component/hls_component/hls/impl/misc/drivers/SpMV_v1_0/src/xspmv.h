// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XSPMV_H
#define XSPMV_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xspmv_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XSpmv_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XSpmv;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSpmv_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSpmv_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSpmv_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSpmv_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XSpmv_Initialize(XSpmv *InstancePtr, UINTPTR BaseAddress);
XSpmv_Config* XSpmv_LookupConfig(UINTPTR BaseAddress);
#else
int XSpmv_Initialize(XSpmv *InstancePtr, u16 DeviceId);
XSpmv_Config* XSpmv_LookupConfig(u16 DeviceId);
#endif
int XSpmv_CfgInitialize(XSpmv *InstancePtr, XSpmv_Config *ConfigPtr);
#else
int XSpmv_Initialize(XSpmv *InstancePtr, const char* InstanceName);
int XSpmv_Release(XSpmv *InstancePtr);
#endif

void XSpmv_Start(XSpmv *InstancePtr);
u32 XSpmv_IsDone(XSpmv *InstancePtr);
u32 XSpmv_IsIdle(XSpmv *InstancePtr);
u32 XSpmv_IsReady(XSpmv *InstancePtr);
void XSpmv_EnableAutoRestart(XSpmv *InstancePtr);
void XSpmv_DisableAutoRestart(XSpmv *InstancePtr);

void XSpmv_Set_values(XSpmv *InstancePtr, u64 Data);
u64 XSpmv_Get_values(XSpmv *InstancePtr);
void XSpmv_Set_columnIndexes(XSpmv *InstancePtr, u64 Data);
u64 XSpmv_Get_columnIndexes(XSpmv *InstancePtr);
void XSpmv_Set_rowPointers(XSpmv *InstancePtr, u64 Data);
u64 XSpmv_Get_rowPointers(XSpmv *InstancePtr);
void XSpmv_Set_numOfRows(XSpmv *InstancePtr, u32 Data);
u32 XSpmv_Get_numOfRows(XSpmv *InstancePtr);
void XSpmv_Set_vector(XSpmv *InstancePtr, u64 Data);
u64 XSpmv_Get_vector(XSpmv *InstancePtr);
void XSpmv_Set_output_r(XSpmv *InstancePtr, u64 Data);
u64 XSpmv_Get_output_r(XSpmv *InstancePtr);

void XSpmv_InterruptGlobalEnable(XSpmv *InstancePtr);
void XSpmv_InterruptGlobalDisable(XSpmv *InstancePtr);
void XSpmv_InterruptEnable(XSpmv *InstancePtr, u32 Mask);
void XSpmv_InterruptDisable(XSpmv *InstancePtr, u32 Mask);
void XSpmv_InterruptClear(XSpmv *InstancePtr, u32 Mask);
u32 XSpmv_InterruptGetEnabled(XSpmv *InstancePtr);
u32 XSpmv_InterruptGetStatus(XSpmv *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
