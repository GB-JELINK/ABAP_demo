*----------------------------------------------------------------------*
***INCLUDE Z_MM_SL18_O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS '0100'.
  SET TITLEBAR '0100'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module ALV OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE alv OUTPUT.

  IF go_cont IS INITIAL.
    CREATE OBJECT go_cont
      EXPORTING
        container_name = 'CC_100'.

    CREATE OBJECT go_alv
      EXPORTING
        i_parent = go_cont.

    PERFORM make_fcat.

    gs_layout-cwidth_opt = 'X'.
    gs_layout-stylefname = 'STYLE'.

    CREATE OBJECT go_handler.
    SET HANDLER go_handler->on_double_click FOR go_alv.



    CALL METHOD go_alv->set_table_for_first_display
      EXPORTING
        is_layout       = gs_layout
      CHANGING
        it_outtab       = gt_outtab
        it_fieldcatalog = gt_fcat.



  ELSE.

  ENDIF.

ENDMODULE.
