*&---------------------------------------------------------------------*
*& Report zsapbc401_alv_s2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSAPBC401_ALV_S2.

INCLUDE ZSAPBC401_ALV_S2_TOP.
INCLUDE ZSAPBC401_ALV_S2_C01.
INCLUDE ZSAPBC401_ALV_S2_F01.
INCLUDE ZSAPBC401_ALV_S2_O01.
INCLUDE ZSAPBC401_ALV_S2_I01.





START-OF-SELECTION.

  PERFORM GET_DATA.

END-OF-SELECTION.

  CALL SCREEN 100.
