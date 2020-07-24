*&---------------------------------------------------------------------*
*& Include          ZSAPBC401_ALV_S2_F01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form CREATE_OBJ
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM create_obj .

  CREATE OBJECT go_container
    EXPORTING
      container_name = 'CC_100'.

  CREATE OBJECT go_alv_grid
    EXPORTING
      i_parent = go_container.

  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.


ENDFORM.
*&---------------------------------------------------------------------*
*& Form DISPLAY_ALV
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM display_alv .

  CALL METHOD go_alv_grid->set_table_for_first_display
    EXPORTING
*     I_BUFFER_ACTIVE  =
*     I_BYPASSING_BUFFER            =
*     I_CONSISTENCY_CHECK           =
      i_structure_name = 'SPFLI'
*     IS_VARIANT       =
*     I_SAVE           =
*     I_DEFAULT        = 'X'
*     IS_LAYOUT        =
*     IS_PRINT         =
*     IT_SPECIAL_GROUPS             =
*     IT_TOOLBAR_EXCLUDING          =
*     IT_HYPERLINK     =
*     IT_ALV_GRAPHICS  =
*     IT_EXCEPT_QINFO  =
*     IR_SALV_ADAPTER  =
    CHANGING
      it_outtab        = gt_flight
*     IT_FIELDCATALOG  =
*     IT_SORT          =
*     IT_FILTER        =
*  EXCEPTIONS
*     INVALID_PARAMETER_COMBINATION = 1
*     PROGRAM_ERROR    = 2
*     TOO_MANY_LINES   = 3
*     OTHERS           = 4
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


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

  SELECT * FROM spfli INTO TABLE gt_flight.

ENDFORM.
