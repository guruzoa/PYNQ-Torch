// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Apr  5 17:17:38 2019
// Host        : ManoharVohra-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/ECTE433_LabFiles/compute_weight/compute_weight.srcs/sources_1/bd/compute_weight/ip/compute_weight_compute_weight_2_0_0/compute_weight_compute_weight_2_0_0_stub.v
// Design      : compute_weight_compute_weight_2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "compute_weight_2,Vivado 2018.2" *)
module compute_weight_compute_weight_2_0_0(ap_clk, ap_rst_n, input_r_TVALID, 
  input_r_TREADY, input_r_TDATA, input_r_TLAST, output_r_TVALID, output_r_TREADY, 
  output_r_TDATA, output_r_TLAST)
/* synthesis syn_black_box black_box_pad_pin="ap_clk,ap_rst_n,input_r_TVALID,input_r_TREADY,input_r_TDATA[31:0],input_r_TLAST[0:0],output_r_TVALID,output_r_TREADY,output_r_TDATA[31:0],output_r_TLAST[0:0]" */;
  input ap_clk;
  input ap_rst_n;
  input input_r_TVALID;
  output input_r_TREADY;
  input [31:0]input_r_TDATA;
  input [0:0]input_r_TLAST;
  output output_r_TVALID;
  input output_r_TREADY;
  output [31:0]output_r_TDATA;
  output [0:0]output_r_TLAST;
endmodule
