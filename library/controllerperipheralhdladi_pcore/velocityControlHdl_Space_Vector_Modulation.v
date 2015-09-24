// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\controllerPeripheralHdlAdi\velocityControlHdl\velocityControlHdl_Space_Vector_Modulation.v
// Created: 2014-08-25 21:11:09
// 
// Generated by MATLAB 8.2 and HDL Coder 3.3
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: velocityControlHdl_Space_Vector_Modulation
// Source Path: velocityControlHdl/Space_Vector_Modulation
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module velocityControlHdl_Space_Vector_Modulation
          (
           Vabc_Raw_0,
           Vabc_Raw_1,
           Vabc_Raw_2,
           phase_voltages_0,
           phase_voltages_1,
           phase_voltages_2
          );


  input   signed [17:0] Vabc_Raw_0;  // sfix18_En13
  input   signed [17:0] Vabc_Raw_1;  // sfix18_En13
  input   signed [17:0] Vabc_Raw_2;  // sfix18_En13
  output  signed [19:0] phase_voltages_0;  // sfix20_En12
  output  signed [19:0] phase_voltages_1;  // sfix20_En12
  output  signed [19:0] phase_voltages_2;  // sfix20_En12


  wire signed [17:0] Double_Range_out1_0;  // sfix18_En12
  wire signed [17:0] Double_Range_out1_1;  // sfix18_En12
  wire signed [17:0] Double_Range_out1_2;  // sfix18_En12
  wire signed [17:0] MinMax1_out1;  // sfix18_En12
  wire signed [17:0] MinMax_out1;  // sfix18_En12
  wire signed [18:0] Add_add_cast;  // sfix19_En12
  wire signed [18:0] Add_add_cast_1;  // sfix19_En12
  wire signed [18:0] Add_out1;  // sfix19_En12
  wire signed [37:0] Gain_cast;  // sfix38_En30
  wire signed [18:0] Gain_out1;  // sfix19_En12
  wire signed [19:0] Add1_sub_cast;  // sfix20_En12
  wire signed [19:0] Add1_sub_cast_1;  // sfix20_En12
  wire signed [19:0] Add1_out1;  // sfix20_En12
  wire signed [19:0] Add2_sub_cast;  // sfix20_En12
  wire signed [19:0] Add2_sub_cast_1;  // sfix20_En12
  wire signed [19:0] Add2_out1;  // sfix20_En12
  wire signed [19:0] Add3_sub_cast;  // sfix20_En12
  wire signed [19:0] Add3_sub_cast_1;  // sfix20_En12
  wire signed [19:0] Add3_out1;  // sfix20_En12


  // <S4>/Double_Range
  // 
  // <S4>/Demux
  // 
  // <S4>/Goto
  // 
  // <S4>/From
  // 
  // <S4>/Goto1
  // 
  // <S4>/From1
  // 
  // <S4>/Goto2
  // 
  // <S4>/From2
  // 
  // <S4>/Demux
  // 
  // <S4>/Goto
  // 
  // <S4>/From6
  // 
  // <S4>/Demux
  // 
  // <S4>/Goto
  // 
  // <S4>/From3
  // 
  // <S4>/Goto1
  // 
  // <S4>/From7
  // 
  // <S4>/Goto1
  // 
  // <S4>/From4
  // 
  // <S4>/Goto2
  // 
  // <S4>/From8
  // 
  // <S4>/Goto2
  // 
  // <S4>/From5
  velocityControlHdl_Double_Range   u_Double_Range   (.In1_0(Vabc_Raw_0),  // sfix18_En13
                                                      .In1_1(Vabc_Raw_1),  // sfix18_En13
                                                      .In1_2(Vabc_Raw_2),  // sfix18_En13
                                                      .Out1_0(Double_Range_out1_0),  // sfix18_En12
                                                      .Out1_1(Double_Range_out1_1),  // sfix18_En12
                                                      .Out1_2(Double_Range_out1_2)  // sfix18_En12
                                                      );

  // <S4>/MinMax1
  velocityControlHdl_MinMax1   u_MinMax1   (.in0(Double_Range_out1_0),  // sfix18_En12
                                            .in1(Double_Range_out1_1),  // sfix18_En12
                                            .in2(Double_Range_out1_2),  // sfix18_En12
                                            .out0(MinMax1_out1)  // sfix18_En12
                                            );

  // <S4>/MinMax
  velocityControlHdl_MinMax   u_MinMax   (.in0(Double_Range_out1_0),  // sfix18_En12
                                          .in1(Double_Range_out1_1),  // sfix18_En12
                                          .in2(Double_Range_out1_2),  // sfix18_En12
                                          .out0(MinMax_out1)  // sfix18_En12
                                          );

  // <S4>/Add
  assign Add_add_cast = MinMax1_out1;
  assign Add_add_cast_1 = MinMax_out1;
  assign Add_out1 = Add_add_cast + Add_add_cast_1;



  // <S4>/Gain
  assign Gain_cast = {{2{Add_out1[18]}}, {Add_out1, 17'b00000000000000000}};
  assign Gain_out1 = Gain_cast[36:18];



  // <S4>/Add1
  // 
  // <S4>/Mux
  assign Add1_sub_cast = Double_Range_out1_0;
  assign Add1_sub_cast_1 = Gain_out1;
  assign Add1_out1 = Add1_sub_cast - Add1_sub_cast_1;



  assign phase_voltages_0 = Add1_out1;

  // <S4>/Add2
  assign Add2_sub_cast = Double_Range_out1_1;
  assign Add2_sub_cast_1 = Gain_out1;
  assign Add2_out1 = Add2_sub_cast - Add2_sub_cast_1;



  assign phase_voltages_1 = Add2_out1;

  // <S4>/Add3
  assign Add3_sub_cast = Double_Range_out1_2;
  assign Add3_sub_cast_1 = Gain_out1;
  assign Add3_out1 = Add3_sub_cast - Add3_sub_cast_1;



  assign phase_voltages_2 = Add3_out1;

endmodule  // velocityControlHdl_Space_Vector_Modulation
