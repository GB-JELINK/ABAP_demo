*&---------------------------------------------------------------------*
*& Include          ZSAPBC401_ALV_S2_C01
*&---------------------------------------------------------------------*


CLASS lcl_event_handler DEFINITION.
  PUBLIC SECTION.
    METHODS: on_double_click FOR EVENT double_click OF cl_gui_alv_grid IMPORTING es_row_no e_column,

      on_handle_close FOR EVENT close OF cl_gui_dialogbox_container IMPORTING sender.

  PRIVATE SECTION.

    TYPES: ty_sflight TYPE STANDARD TABLE OF sflight WITH NON-UNIQUE KEY carrid connid fldate.

    DATA: mo_cont_popup TYPE REF TO cl_gui_dialogbox_container,
          mo_alv_popup  TYPE REF TO cl_gui_alv_grid.

    DATA: mt_sflight TYPE ty_sflight.


ENDCLASS.

*&---------------------------------------------------------------------*
*& Class (Implementation) LCL_EVENT_HANDLER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
CLASS lcl_event_handler IMPLEMENTATION.



  METHOD on_double_click.

    DATA ls_spfli TYPE spfli.
    READ TABLE gt_flight INTO ls_spfli INDEX es_row_no-row_id.

    SELECT *
      FROM sflight
      INTO TABLE mt_sflight
      WHERE carrid = ls_spfli-carrid
      AND connid = ls_spfli-connid
      .

    IF mo_cont_popup IS INITIAL.
      CREATE OBJECT mo_cont_popup
        EXPORTING
          width  = 600
          height = 300
          top = 30  "팝업 위치
          left = 30.

      CREATE OBJECT mo_alv_popup
        EXPORTING
          i_parent = mo_cont_popup.

      SET HANDLER me->on_handle_close FOR mo_cont_popup.

      CALL METHOD mo_alv_popup->set_table_for_first_display
        EXPORTING
          i_structure_name = 'SFLIGHT'
        CHANGING
          it_outtab        = mt_sflight.

    ELSE.
      DATA ls_stbl TYPE lvc_s_stbl.
      ls_stbl-row = 'X'.
      ls_stbl-col = 'X'.

      CALL METHOD mo_alv_popup->refresh_table_display
        EXPORTING
          is_stable = ls_stbl
*         i_soft_refresh =
*  EXCEPTIONS
*         finished  = 1
*         others    = 2
        .
      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.



    ENDIF.


*    DATA lv_text TYPE string.
*    DATA lv_text2 TYPE string.
**    LV_TEXT = 'ROW:'.""&& ES_ROW_NO-row_id
**    && 'COLUMN: ' && E_COLUMN-fieldname.
*    lv_text2 = es_row_no-row_id.
*    CONCATENATE 'ROW:' lv_text2 'COLUMN:' e_column-fieldname
*    INTO lv_text
*    SEPARATED BY space.
  ENDMETHOD.

  METHOD on_handle_close.    "popup closeable

    CALL METHOD sender->set_visible
      EXPORTING
        visible = space.


    "-------after close  possible popup again
    "-------free squence are reverse
    CALL METHOD mo_alv_popup->free.
    CALL METHOD mo_cont_popup->free.


    CLEAR: mo_alv_popup, mo_cont_popup.



  ENDMETHOD.



ENDCLASS.

DATA: go_handler TYPE REF TO lcl_event_handler.  "순서상 top 에 선언할 수 없어서 여기에서 선언
