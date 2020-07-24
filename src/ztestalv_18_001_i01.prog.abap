*&---------------------------------------------------------------------*
*& Include          ZTESTALV_18_001_I01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  EXIT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE exit INPUT.

  CASE ok_code.
    WHEN 'BACK'.
      PERFORM free_control_resource.
      LEAVE TO SCREEN 0.
    WHEN 'EXIT' OR 'CANC'.
      PERFORM free_control_resource.
      LEAVE PROGRAM.


  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

*  DATA lr_car TYPE RANGE OF scarr-carrid. "RANGE 변수 호출하는 프로그램에 SELECT OPTION에 값 넣기 위해.
*
*  CASE ok_code.
*
*    WHEN 'SUB'.
*      SUBMIT ztestalv_001  "pattern / others -> submit
*              VIA SELECTION-SCREEN
*              AND RETURN
*              WITH pa_vari = 'LV1'
*              WITH so_car IN lr_car       "sel-opt : in , not '=', range var.
*  .
*  ENDCASE.

  DATA lr_car TYPE RANGE OF scarr-carrid. "RANGE 변수 호출하는 프로그램에 SELECT OPTION에 값 넣기 위해.

  DATA ls_car LIKE LINE OF lr_car.


  CASE ok_code.
    WHEN 'SUBMIT'.
      ls_car-sign = 'I'.
      ls_car-option = 'EQ'.
      ls_car-low = 'DL'.
      APPEND ls_car TO lr_car.
      SUBMIT ztestalv_001
      VIA SELECTION-SCREEN
      AND RETURN
*              WITH pa_vari = 'LV1'
              WITH so_car IN lr_car.
      .
  ENDCASE.

ENDMODULE.
