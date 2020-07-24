*&---------------------------------------------------------------------*
*& Include          Z_MM_SL18_C01
*&---------------------------------------------------------------------*


CLASS lcl_event_handler DEFINITION.

  PUBLIC SECTION.
    METHODS: on_double_click FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING es_row_no e_column,
      on_hotspot_click FOR EVENT hotspot_click OF cl_gui_alv_grid
        IMPORTING es_row_no e_column_id.


ENDCLASS.


CLASS lcl_event_handler IMPLEMENTATION.

  METHOD on_double_click.
    PERFORM double_click_event USING es_row_no e_column.

  ENDMETHOD.

  METHOD on_hotspot_click.
    PERFORM hotspot_event USING es_row_no e_column_id.
  ENDMETHOD.

ENDCLASS.


DATA go_handler TYPE REF TO lcl_event_handler.
