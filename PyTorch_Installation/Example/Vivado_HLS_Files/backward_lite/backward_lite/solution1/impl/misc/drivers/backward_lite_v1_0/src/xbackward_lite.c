// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================

/***************************** Include Files *********************************/
#include "xbackward_lite.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XBackward_lite_CfgInitialize(XBackward_lite *InstancePtr, XBackward_lite_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axilites_BaseAddress = ConfigPtr->Axilites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

u32 XBackward_lite_Get_bias(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_BIAS_DATA);
    return Data;
}

u32 XBackward_lite_Get_bias_vld(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_BIAS_CTRL);
    return Data & 0x1;
}

u32 XBackward_lite_Get_w1(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_W1_DATA);
    return Data;
}

u32 XBackward_lite_Get_w1_vld(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_W1_CTRL);
    return Data & 0x1;
}

u32 XBackward_lite_Get_w2(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_W2_DATA);
    return Data;
}

u32 XBackward_lite_Get_w2_vld(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_W2_CTRL);
    return Data & 0x1;
}

u32 XBackward_lite_Get_w3(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_W3_DATA);
    return Data;
}

u32 XBackward_lite_Get_w3_vld(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_W3_CTRL);
    return Data & 0x1;
}

u32 XBackward_lite_Get_w4(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_W4_DATA);
    return Data;
}

u32 XBackward_lite_Get_w4_vld(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_W4_CTRL);
    return Data & 0x1;
}

u32 XBackward_lite_Get_w5(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_W5_DATA);
    return Data;
}

u32 XBackward_lite_Get_w5_vld(XBackward_lite *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackward_lite_ReadReg(InstancePtr->Axilites_BaseAddress, XBACKWARD_LITE_AXILITES_ADDR_W5_CTRL);
    return Data & 0x1;
}

