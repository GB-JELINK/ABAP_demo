*&---------------------------------------------------------------------*
*& Report ZTESTALV_18_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZTESTALV_18_001.

INCLUDE ZTESTALV_18_001_TOP.
INCLUDE ZTESTALV_18_001_O01.
INCLUDE ZTESTALV_18_001_I01.
INCLUDE ZTESTALV_18_001_F01.

INITIALIZATION.


AT SELECTION-SCREEN.


START-OF-SELECTION.

  PERFORM GET_DATA.
  PERFORM MAKE_DATA.


*BREAK-POINT .
END-OF-SELECTION.
  CALL SCREEN 100.
