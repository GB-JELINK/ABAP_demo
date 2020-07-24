*&---------------------------------------------------------------------*
*& Include          ZTESTALV_18_001_O01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE STATUS_0100 OUTPUT.
  SET PF-STATUS '0100'.
  SET TITLEBAR '0100'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module CREATE_ALV OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*

MODULE CREATE_ALV OUTPUT.
  IF GO_CONTAINER IS INITIAL.

    PERFORM CREATE_OBJ.

    GS_VARIANT-REPORT = SY-CPROG.
    GS_VARIANT-VARIANT = PA_VARI.
    GV_SAVE = 'A'.

    "GS_LAYOUT-GRID_TITLE = 'LIST'(002).

    PERFORM SET_LAYOUT.



    GS_SORT-FIELDNAME = 'URL'.
    GS_SORT-UP = 'X'.
    GS_SORT-SPOS = 2.
    APPEND GS_SORT TO GT_SORT.
    CLEAR GS_SORT.

    GS_SORT-FIELDNAME = 'URL'.
    GS_SORT-DOWN = 'X'.
    GS_SORT-SPOS = 1.
    APPEND GS_SORT TO GT_SORT.


    PERFORM DISPLAY_ALV.

  ELSE.
    DATA LS_STBL TYPE LVC_S_STBL.
    LS_STBL-ROW = 'X'.
    LS_STBL-COL = 'X'.

    CALL METHOD GO_ALV_GRID->REFRESH_TABLE_DISPLAY
      EXPORTING
        IS_STABLE      = LS_STBL
        I_SOFT_REFRESH = 'X'
*      EXCEPTIONS
*       finished       = 1
*       others         = 2
      .

  ENDIF.

ENDMODULE.
