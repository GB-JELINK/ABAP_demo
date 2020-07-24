*&---------------------------------------------------------------------*
*& Include          ZTESTALV_18_001_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form GET_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM GET_DATA .
  SELECT *
    FROM SCARR
    INTO CORRESPONDING FIELDS OF TABLE GT_SCARR
   WHERE CARRID IN SO_CAR."= pa_car."in so_car.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form CREATE_OBJ
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM CREATE_OBJ .
  CREATE OBJECT GO_CONTAINER
    EXPORTING
      CONTAINER_NAME = 'CONTROL_AREA'.

  CREATE OBJECT GO_ALV_GRID
    EXPORTING
      I_PARENT = GO_CONTAINER.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form DISPLAY_ALV
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM DISPLAY_ALV .

  CALL METHOD GO_ALV_GRID->SET_TABLE_FOR_FIRST_DISPLAY
    EXPORTING
*     i_buffer_active  =
*     i_bypassing_buffer            =
*     i_consistency_check           =
      I_STRUCTURE_NAME = 'SCARR'
      IS_VARIANT       = GS_VARIANT
      I_SAVE           = 'A' "A U X ' '
      I_DEFAULT        = ' '
      IS_LAYOUT        = GS_LAYOUT
*     it_toolbar_excluding          =
    CHANGING
      IT_OUTTAB        = GT_SCARR
*     it_fieldcatalog  =
      IT_SORT          = GT_SORT
*     it_filter        =
*    EXCEPTIONS
*     invalid_parameter_combination = 1
*     program_error    = 2
*     too_many_lines   = 3
*     others           = 4
    .

ENDFORM.
*&---------------------------------------------------------------------*
*& Form FREE_CONTROL_RESOURCE
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM FREE_CONTROL_RESOURCE .
  CALL METHOD GO_ALV_GRID->FREE.
  CALL METHOD GO_CONTAINER->FREE.
  CLEAR: GO_ALV_GRID, GO_CONTAINER.
ENDFORM.
*&---------------------------------------------------------------------*
*& Form SET_LAYOUT
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM SET_LAYOUT .

  GS_LAYOUT-GRID_TITLE = 'LIST'(002).
  GS_LAYOUT-ZEBRA = 'X'.
*  GS_LAYOUT-CWIDTH_OPT = 'X'.
*  GS_LAYOUT-NO_HEADERS = 'X'.
*  GS_LAYOUT-EDIT = 'X'.
  GS_LAYOUT-SEL_MODE = 'D'.
  GS_LAYOUT-INFO_FNAME = 'COLOR'.
  GS_LAYOUT-CTAB_FNAME = 'IT_COLFIELDS'.

ENDFORM.


*&---------------------------------------------------------------------*
*& Form MAKE_DATA
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM MAKE_DATA .

  LOOP AT GT_SCARR INTO GS_SCARR.

    IF GS_SCARR-CURRCODE = 'USD'.
      GS_SCARR-COLOR = 'C' && '6' && '10'.
      GS_SCARR-URL = 'ABCDEFG'.
      GS_COLFIELD-FNAME = 'CARRNAME'.
      GS_COLFIELD-COLOR-COL = COL_POSITIVE.
      GS_COLFIELD-COLOR-INT = '1'.
      GS_COLFIELD-COLOR-INV ='0'.

      APPEND GS_COLFIELD TO GS_SCARR-IT_COLFIELDS.
    ENDIF.

    MODIFY GT_SCARR FROM GS_SCARR TRANSPORTING COLOR IT_COLFIELDS."transporting ____ 해당 필드만 modify
*    MODIFY gt_scarr FROM gs_scarr
*    TRANSPORTING color
*    WHERE currcode = 'USD'.

  ENDLOOP.

ENDFORM.
