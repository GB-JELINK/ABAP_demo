*&---------------------------------------------------------------------*
*& Include          ZSAPBC401_ALV_S2_TOP
*&---------------------------------------------------------------------*





DATA: gt_flight TYPE TABLE OF spfli.

DATA:
  go_container TYPE REF TO cl_gui_custom_container,
  go_alv_grid  TYPE REF TO cl_gui_alv_grid.


DATA: ok_code TYPE sy-ucomm.
