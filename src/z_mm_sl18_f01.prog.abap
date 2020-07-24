*----------------------------------------------------------------------*
***INCLUDE Z_MM_SL18_F01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form MAKE_FCAT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM make_fcat .

  gs_fcat-fieldname = 'EBELN'.
  gs_fcat-ref_field = 'EBELN'.  "dictionary
  gs_fcat-ref_table = 'EKPO'.
  gs_fcat-coltext = 'Purchasing No.'.
  gs_fcat-fix_column = 'X'. "fixed
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'EBELP'.
  gs_fcat-ref_field = 'EBELP'.
  gs_fcat-ref_table = 'EKPO'.
  gs_fcat-coltext = 'Item'.
  gs_fcat-fix_column = 'X'. "fixed
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'LIFNR'.
  gs_fcat-ref_field = 'LIFNR'.
  gs_fcat-ref_table = 'EKKO'.
  gs_fcat-coltext = 'Vendor'.
  gs_fcat-fix_column = 'X'. "fixed
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'NAME'.
  gs_fcat-ref_field = 'NAME1'.
  gs_fcat-ref_table = 'LFA1'.
  gs_fcat-coltext = 'Name'.
  gs_fcat-fix_column = 'X'. "fixed
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'MATNR'.
  gs_fcat-ref_field = 'MATNR'.
  gs_fcat-ref_table = 'EKPO'.
  gs_fcat-coltext = 'EKPO'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'MAKTX'.
  gs_fcat-ref_field = 'MAKTX'.
  gs_fcat-ref_table = 'MAKT'.
  gs_fcat-coltext = 'Material description'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'WERKS'.
  gs_fcat-ref_field = 'WERKS'.
  gs_fcat-ref_table = 'EKPO'.
  gs_fcat-coltext = 'Plant'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'LGORT'.
  gs_fcat-ref_field = 'LGORT'.
  gs_fcat-ref_table = 'EKPO'.
  gs_fcat-coltext = 'Stroage Location'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'MENGE'.
  gs_fcat-ref_field = 'MENGE'.
  gs_fcat-ref_table = 'EKPO'.
  gs_fcat-coltext = 'Po Quantity'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'OPMEN'.
  gs_fcat-ref_field = 'MENGE'.
  gs_fcat-ref_table = 'EKPO'.
  gs_fcat-coltext = 'Open PO Qty'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'GRQIN'.
  gs_fcat-ref_field = 'MENGE'.
  gs_fcat-ref_table = 'EKPO'.
  gs_fcat-edit = 'X'.
  gs_fcat-coltext = 'GR Processing Qty'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'MEINS'.
  gs_fcat-ref_field = 'MEINS'.
  gs_fcat-ref_table = 'EKPO'.
  gs_fcat-coltext = 'Unit'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'NETPR'.
  gs_fcat-ref_field = 'NETPR'.
  gs_fcat-ref_table = 'EKPO'.
  gs_fcat-coltext = 'Net price'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'WAERS'.
  gs_fcat-ref_field = 'WAERS'.
  gs_fcat-ref_table = 'EKKO'.
  gs_fcat-coltext = 'Currency'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'POAMT'.
  gs_fcat-ref_field = 'POAMT'.
  gs_fcat-coltext = 'PO Amount'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'GRDOC'.
  gs_fcat-ref_field = 'GRDOC'.
  gs_fcat-ref_table = 'EKBE'.
  gs_fcat-coltext = 'GR Doc'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'GYEAR'.
  gs_fcat-ref_field = 'GJAHR'.
  gs_fcat-ref_table = 'EKBE'.
  gs_fcat-coltext = 'Year'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'BWART'.
  gs_fcat-ref_field = 'BWART'.
  gs_fcat-ref_table = 'EKBE'.
  gs_fcat-no_out = 'X'. "no display
  gs_fcat-coltext = 'Movement type'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'GRQTY'.
  gs_fcat-ref_field = 'MENGE'.
  gs_fcat-ref_table = 'EKBE'.
  gs_fcat-coltext = 'GR QTY'.
  gs_fcat-edit = 'X'.        "편집가능
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'GRAMT'.
  gs_fcat-ref_field = 'EMBTR'.
  gs_fcat-ref_table = 'EKBE'.
  gs_fcat-coltext = 'GR Amount'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'IVDOC'.
  gs_fcat-ref_field = 'BELNT'.
  gs_fcat-ref_table = 'EKBE'.
  gs_fcat-coltext = 'IV Doc.'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'IYEAR'.
  gs_fcat-ref_field = 'GJAHR'.
  gs_fcat-ref_table = 'EKBE'.
  gs_fcat-coltext = 'Year.'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.

  gs_fcat-fieldname = 'IVAMT'.
  gs_fcat-ref_field = 'DMBTR'.
  gs_fcat-ref_table = 'EKBE'.
  gs_fcat-coltext = 'IV Amount'.
  APPEND gs_fcat TO gt_fcat.
  CLEAR gs_fcat.




ENDFORM.
*&---------------------------------------------------------------------*
*& Form GET_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM get_data .

  SELECT a~ebeln
         a~ebelp
         a~matnr
         a~werks
         a~lgort
         a~menge
         a~meins
         a~netpr
         b~lifnr
         b~waers
         "c~name1

    FROM ekpo AS a INNER JOIN ekko AS b
      ON a~ebeln = b~ebeln
                  " LEFT OUTER JOIN lfa1 AS c ON b~lifnr = c~lifnr
    INTO CORRESPONDING FIELDS OF TABLE gt_get

    WHERE a~bukrs IN pa1
     AND a~werks IN pa2
     AND a~matnr IN pa3
     AND b~lifnr IN pa4
     AND a~ebeln IN pa5
     AND b~ekorg IN pa6
     AND b~ekgrp IN pa7
     AND b~bsart = 'NB'.    "standard po select only



  IF gt_get IS NOT INITIAL.
    SELECT ebeln ebelp vgabe belnr buzei gjahr bwart shkzg dmbtr
      FROM ekbe "g/r docu. dbtable
      INTO TABLE gt_ekbe
      FOR ALL ENTRIES IN gt_get
      WHERE ebeln = gt_get-ebeln
      AND ebelp = gt_get-ebelp
      AND ( vgabe = 1 OR vgabe = 2 )
      .

    DATA: lt_get LIKE gt_get.
    lt_get = gt_get.
    SORT lt_get BY matnr.
    DELETE ADJACENT DUPLICATES FROM lt_get COMPARING matnr.

    SELECT *
    FROM makt
    INTO TABLE gt_makt
    FOR ALL ENTRIES IN lt_get
    WHERE matnr = lt_get-matnr.
    CLEAR lt_get.
    "BREAK-POINT.

    lt_get = gt_get.
    SORT lt_get BY lifnr.
    DELETE ADJACENT DUPLICATES FROM lt_get COMPARING lifnr.

    SELECT *
    FROM lfa1
    INTO TABLE gt_lfa1
    FOR ALL ENTRIES IN lt_get
    WHERE lifnr = lt_get-lifnr.

  ELSE.





  ENDIF.



ENDFORM.
"-----------------------------------

FORM make_data.

  DATA: ls_makt TYPE makt,
        ls_ekbe LIKE gs_ekbe,
        ls_lfa1 TYPE lfa1.

  DATA: lv_cnt   TYPE i, lv_ivcnt TYPE i.  " gr count변수

  DATA ls_style TYPE lvc_s_styl.    "local

  CHECK gt_get IS NOT INITIAL.

  SORT gt_lfa1 BY lifnr.

  LOOP AT gt_get INTO gs_get.

    gs_outtab-ebeln = gs_get-ebeln.
    gs_outtab-ebelp = gs_get-ebelp.
    gs_outtab-lifnr = gs_get-lifnr.
    gs_outtab-matnr = gs_get-matnr.
    gs_outtab-werks = gs_get-werks.
    gs_outtab-lgort = gs_get-lgort.
    gs_outtab-menge = gs_get-menge.
    gs_outtab-meins = gs_get-meins.
    gs_outtab-netpr = gs_get-netpr.
    gs_outtab-waers = gs_get-waers.
    gs_outtab-poamt = gs_get-netpr * gs_get-menge.

    READ TABLE gt_lfa1 INTO ls_lfa1
    WITH KEY lifnr = gs_get-lifnr BINARY SEARCH.

    IF sy-subrc = 0.
      gs_outtab-name1 = ls_lfa1-name1.
    ENDIF.


    LOOP AT gt_ekbe INTO ls_ekbe
    WHERE ebeln = gs_get-ebeln
      AND ebelp = gs_get-ebelp.

      IF gs_ekbe-vgabe = 1.     "입고
        lv_cnt = lv_cnt + 1.
        IF lv_cnt = 1.

        ENDIF.
        IF gs_ekbe-shkzg = 'H'. "취소, 수량 (-)
          gs_ekbe-menge = gs_ekbe-menge * ( -1 ). "취소 수량일 경우 값을 음수로 전환
          gs_ekbe-dmbtr = gs_ekbe-dmbtr * ( -1 ).

        ENDIF.

        gs_outtab-grqty = gs_outtab-grqty + gs_ekbe-menge.
        gs_outtab-gramt = gs_outtab-gramt + gs_ekbe-dmbtr.

        IF lv_cnt = 0.
          gs_outtab-grdoc = gs_ekbe-belnr.
        ELSE.
          gs_outtab-grdoc = icon_display.  " 'MULTI'.
        ENDIF.
        lv_cnt = lv_cnt + 1.

      ELSEIF gs_ekbe-vgabe = 2. "I/V 문
        IF gs_ekbe-shkzg = 'H'. "취소, 수량 (-)
          gs_ekbe-dmbtr = gs_ekbe-dmbtr * ( -1 ).
        ENDIF.

        IF lv_ivcnt = 0.
          gs_outtab-ivdoc = gs_ekbe-belnr.
        ELSE.
          gs_outtab-ivdoc = 'MULTI'.
        ENDIF.
        lv_ivcnt = lv_ivcnt + 1.
        gs_outtab-ivamt = gs_outtab-ivamt + gs_ekbe-dmbtr.

      ENDIF.

    ENDLOOP.

    CLEAR: gs_outtab-grqty, lv_cnt, lv_ivcnt.

    gs_outtab-opmen = gs_outtab-menge - gs_outtab-grqty.

    gs_outtab-grqin = gs_outtab-opmen.


    "style----------------

    IF gs_outtab-grqin = 0.
      ls_style-fieldname = 'GRQIN'.
      ls_style-style = cl_gui_alv_grid=>mc_style_disabled.
      INSERT ls_style INTO TABLE gs_outtab-style.
    ENDIF.


    APPEND gs_outtab TO gt_outtab.
    CLEAR gs_outtab.


  ENDLOOP.
  "  BREAK-POINT.


*  SORT gt_makt BY matnr.
*
*  LOOP AT gt_get INTO gs_get.
*    gs_outtab-ebeln = gs_get-ebeln.
*    gs_outtab-ebelp = gs_get-ebelp.
*
*    READ TABLE gt_makt INTO ls_makt
*    WITH KEY matnr = gs_get-matnr BINARY SEARCH.
*
*    IF sy-subrc = 0.
*      gs_outtab-matnr = ls_makt-matnr.
*    ENDIF.

*ENDLOOP.












ENDFORM.
*&---------------------------------------------------------------------*
*& Form DOUBLE_CLICK_EVENT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*      -->P_ES_ROW_NO  text
*      -->P_E_COLUMN  text
*&---------------------------------------------------------------------*
FORM double_click_event  USING    ps_row_no TYPE lvc_s_roid
                                  p_column TYPE lvc_s_col.

  READ TABLE gt_outtab INTO gs_outtab INDEX ps_row_no-row_id.
  CASE p_column.
    WHEN 'LIFNR'.
      SET PARAMETER ID 'LIF' FIELD gs_outtab-lifnr.
      SET PARAMETER ID 'BUK' FIELD '1710'.
      CALL TRANSACTION 'XK03'.
  ENDCASE.

ENDFORM.

FORM hotspot_event USING ps_row_no TYPE lvc_s_roid
                        p_column_id TYPE lvc_s_col.

  READ TABLE gt_outtab INTO gs_outtab INDEX ps_row_no-row_id.
  CASE p_column_id-fieldname.
    WHEN 'EBELN'.
      SET PARAMETER ID 'BES' FIELD gs_outtab-ebeln.
      CALL TRANSACTION 'ME23N'.
    WHEN 'MATNR'.
      SET PARAMETER ID 'MAT' FIELD gs_outtab-matnr.
      CALL TRANSACTION 'MM03'.

  ENDCASE.


ENDFORM.









"""
