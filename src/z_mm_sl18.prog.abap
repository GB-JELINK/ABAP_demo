*&---------------------------------------------------------------------*
*& Report Z_MM_SL18
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_mm_sl18.

TABLES: ekpo, ekko, ekbe.

DATA: ok_code TYPE sy-ucomm.

DATA: go_cont TYPE REF TO cl_gui_custom_container,
      go_alv  TYPE REF TO cl_gui_alv_grid.

DATA: BEGIN OF gs_outtab,
        ebeln TYPE ekpo-ebeln,
        ebelp TYPE ekpo-ebelp,
        lifnr TYPE ekko-lifnr,
        name1 TYPE lfa1-name1,
        matnr TYPE ekpo-matnr,
        maktx TYPE makt-maktx,
        werks TYPE ekpo-werks,
        lgort TYPE ekpo-lgort,
        menge TYPE ekpo-menge,
        opmen TYPE ekpo-menge,
        grqin TYPE ekpo-menge,
        meins TYPE ekpo-meins,
        netpr TYPE ekpo-netpr,
        waers TYPE ekko-waers,
        poamt TYPE ekbe-dmbtr,
        grdoc TYPE ekbe-belnr,
        gyear TYPE ekbe-gjahr,
        bwart TYPE ekbe-bwart,
        grqty TYPE ekbe-menge,
        gramt TYPE ekbe-dmbtr,
        ivdoc TYPE ekbe-belnr,
        iyear TYPE ekbe-gjahr,
        ivamt TYPE ekbe-dmbtr,
        style TYPE lvc_t_styl,

      END OF gs_outtab.

DATA: gt_outtab LIKE TABLE OF gs_outtab.


DATA: gt_fcat TYPE lvc_t_fcat,
      gs_fcat TYPE lvc_s_fcat.

DATA: BEGIN OF gs_get,
        ebeln TYPE ekpo-ebeln,
        ebelp TYPE ekpo-ebelp,
        lifnr TYPE ekko-lifnr,
        name1 TYPE lfa1-name1,
        matnr TYPE ekpo-matnr,
        maktx TYPE makt-maktx,
        werks TYPE ekpo-werks,
        lgort TYPE ekpo-lgort,
        menge TYPE ekpo-menge,
        meins TYPE ekpo-meins,
        netpr TYPE ekpo-netpr,
        waers TYPE ekko-waers,
        poamt TYPE ekbe-dmbtr,
*        crdov TYPE ekbe-belnr,
*        gyear TYPE ekbe-gjahr,
*        bwart TYPE ekbe-bwart,
*        grqty TYPE ekbe-menge,
*        gramt TYPE ekbe-dmbtr,
*        ivdoc TYPE ekbe-belnr,
*        iyear TYPE ekbe-gjahr,
*        ivamt TYPE ekbe-dmbtr,
      END OF gs_get.

DATA: gt_get LIKE TABLE OF gs_get.

DATA: BEGIN OF gs_ekbe,
        ebeln TYPE ekbe-ebeln, "po no.
        ebelp TYPE ekbe-ebelp, "po item
        vgabe TYPE ekbe-vgabe, "gr / iv
        belnr TYPE ekbe-belnr, " documente no
        buzei TYPE ekbe-buzei, "
        gjahr TYPE ekbe-gjahr, "year
        bwart TYPE ekbe-bwart, "movement type
        shkzg TYPE ekbe-shkzg, "credit debit
        menge TYPE ekbe-menge, "수량
        dmbtr TYPE ekbe-dmbtr, "amount
      END OF gs_ekbe.
DATA: gt_ekbe LIKE TABLE OF gs_ekbe.

DATA: gt_makt TYPE TABLE OF makt,
      gt_lfa1 TYPE TABLE OF lfa1.

DATA: gs_layout TYPE lvc_s_layo.    "layout setting

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

SELECT-OPTIONS : pa1 FOR ekpo-bukrs NO INTERVALS NO-EXTENSION OBLIGATORY,
                 pa2 FOR ekpo-werks,
                 pa3 FOR ekpo-matnr,
                 pa4 FOR ekko-lifnr,
                 pa5 FOR ekpo-ebeln,
                 pa6 FOR ekko-ekorg,
                 pa7 FOR ekko-ekgrp.

SELECTION-SCREEN END OF BLOCK b1.

" TOP above ------------------------------------------------------
include z_mm_sl18_c01.
INCLUDE z_mm_sl18_o01.
INCLUDE z_mm_sl18_i01.
INCLUDE z_mm_sl18_f01.





INITIALIZATION.
  pa1-sign = 'I'.
  pa1-option = 'EQ'.
  pa1-low = '1710'.
  APPEND pa1.

AT SELECTION-SCREEN.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM make_data.

END-OF-SELECTION.

    CALL SCREEN 100.















  """""
