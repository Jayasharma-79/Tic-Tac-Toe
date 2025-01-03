*&---------------------------------------------------------------------*
*& Report ZJS_TIC_TAC_TOE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zjs_tic_tac_toe.

" Data Declaration
DATA: count(10) TYPE c,
      p1(2)     TYPE c,
      j_string  TYPE string.

" Selection Screen
SELECTION-SCREEN : BEGIN OF BLOCK rad1 WITH FRAME.
PARAMETERS       : j_name1 TYPE string,
                   j_name2 TYPE string.

SELECTION-SCREEN : SKIP 1.
SELECTION-SCREEN : BEGIN OF LINE.
SELECTION-SCREEN : PUSHBUTTON 2(8) proc USER-COMMAND proc1 MODIF ID j1.
SELECTION-SCREEN : END OF LINE.
SELECTION-SCREEN : END OF BLOCK rad1.

SELECTION-SCREEN : BEGIN OF BLOCK rad2 WITH FRAME TITLE title.
SELECTION-SCREEN : SKIP 1.

SELECTION-SCREEN : BEGIN OF LINE.
SELECTION-SCREEN : PUSHBUTTON 48(5) but1 USER-COMMAND cli1 MODIF ID sc1.
SELECTION-SCREEN : PUSHBUTTON 54(5) but2 USER-COMMAND cli2 MODIF ID sc2.
SELECTION-SCREEN : PUSHBUTTON 60(5) but3 USER-COMMAND cli3 MODIF ID sc3.
SELECTION-SCREEN : END OF LINE.

SELECTION-SCREEN : BEGIN OF LINE.
SELECTION-SCREEN : PUSHBUTTON 48(5) but4 USER-COMMAND cli4 MODIF ID sc4.
SELECTION-SCREEN : PUSHBUTTON 54(5) but5 USER-COMMAND cli5 MODIF ID sc5.
SELECTION-SCREEN : PUSHBUTTON 60(5) but6 USER-COMMAND cli6 MODIF ID sc6.
SELECTION-SCREEN : END OF LINE.

SELECTION-SCREEN : BEGIN OF LINE.
SELECTION-SCREEN : PUSHBUTTON 48(5) but7 USER-COMMAND cli7 MODIF ID sc7.
SELECTION-SCREEN : PUSHBUTTON 54(5) but8 USER-COMMAND cli8 MODIF ID sc8.
SELECTION-SCREEN : PUSHBUTTON 60(5) but9 USER-COMMAND cli9 MODIF ID sc9.
SELECTION-SCREEN : END OF LINE.

SELECTION-SCREEN : SKIP 1.
SELECTION-SCREEN : END OF BLOCK rad2.

INITIALIZATION.
  proc = 'Proceed'.
  LOOP AT SCREEN.
    IF screen-group1 = 'SC1' OR
       screen-group1 = 'SC2' OR
       screen-group1 = 'SC3' OR
       screen-group1 = 'SC4' OR
       screen-group1 = 'SC5' OR
       screen-group1 = 'SC6' OR
       screen-group1 = 'SC7' OR
       screen-group1 = 'SC8' OR
       screen-group1 = 'SC9'.
      screen-active = 0.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

AT SELECTION-SCREEN.
  CASE sy-ucomm.
    WHEN 'PROC1'.
      IF j_name1 IS NOT INITIAL AND j_name2 IS NOT INITIAL.
        LOOP AT SCREEN.
          screen-active = 1.
          MODIFY SCREEN.
        ENDLOOP.
      ELSE.
        MESSAGE 'Enter the name of players' TYPE 'E'.
      ENDIF.

    WHEN 'CLI1'.
      count = count + 1.
      PERFORM update_input.
      but1 = p1.
      PERFORM disable_but USING 'SC1'.
      PERFORM result_cal.

    WHEN 'CLI2'.
      count = count + 1.
      PERFORM update_input.
      but2 = p1.
      PERFORM disable_but USING 'SC2'.
      PERFORM result_cal.

    WHEN 'CLI3'.
      count = count + 1.
      PERFORM update_input.
      but3 = p1.
      PERFORM disable_but USING 'SC3'.
      PERFORM result_cal.

    WHEN 'CLI4'.
      count = count + 1.
      PERFORM update_input.
      but4 = p1.
      PERFORM disable_but USING 'SC4'.
      PERFORM result_cal.

    WHEN 'CLI5'.
      count = count + 1.
      PERFORM update_input.
      but5 = p1.
      PERFORM disable_but USING 'SC5'.
      PERFORM result_cal.

    WHEN 'CLI6'.
      count = count + 1.
      PERFORM update_input.
      but6 = p1.
      PERFORM disable_but USING 'SC6'.
      PERFORM result_cal.

    WHEN 'CLI7'.
      count = count + 1.
      PERFORM update_input.
      but7 = p1.
      PERFORM disable_but USING 'SC7'.

    WHEN 'CLI8'.
      count = count + 1.
      PERFORM update_input.
      but8 = p1.
      PERFORM disable_but USING 'SC8'.
      PERFORM result_cal.

    WHEN 'CLI9'.
      count = count + 1.
      PERFORM update_input.
      but9 = p1.
      PERFORM disable_but USING 'SC9'.
      PERFORM result_cal.

  ENDCASE.

FORM update_input.
  IF count MOD 2 = 0.
    p1 = 'O'.
  ELSE.
    p1 = 'X'.
  ENDIF.
ENDFORM.

FORM disable_but USING modif_id.
  LOOP AT SCREEN.
    IF screen-group1 = modif_id.
      screen-input = 0.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.
ENDFORM.

FORM result_cal.

  "For 1st Player....

  IF but1 = 'X' AND but2 = 'X' AND but3 = 'X'.
    CONCATENATE j_name1 ' is the winner(X)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but4 = 'X' AND but5 = 'X' AND but6 = 'X'.
    CONCATENATE j_name1 ' is the winner(X)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but7 = 'X' AND but8 = 'X' AND but9 = 'X'.
    CONCATENATE j_name1 ' is the winner(X)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but1 = 'X' AND but4 = 'X' AND but7 = 'X'.
    CONCATENATE j_name1 ' is the winner(X)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but2 = 'X' AND but5 = 'X' AND but8 = 'X'.
    CONCATENATE j_name1 ' is the winner(X)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but3 = 'X' AND but6 = 'X' AND but9 = 'X'.
    CONCATENATE j_name1 ' is the winner(X)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but1 = 'X' AND but5 = 'X' AND but9 = 'X'.
    CONCATENATE j_name1 ' is the winner(X)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but3 = 'X' AND but5 = 'X' AND but7 = 'X'.
    CONCATENATE j_name1 ' is the winner(X)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.

  "For 2nd Player....

  IF but1 = 'O' AND but2 = 'O' AND but3 = 'O'.
    CONCATENATE j_name2 ' is the winner(O)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but4 = 'O' AND but5 = 'O' AND but6 = 'O'.
    CONCATENATE j_name2 ' is the winner(O)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but7 = 'O' AND but8 = 'O' AND but9 = 'O'.
    CONCATENATE j_name2 ' is the winner(O)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but1 = 'O' AND but4 = 'O' AND but7 = 'O'.
    CONCATENATE j_name2 ' is the winner(O)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but2 = 'O' AND but5 = 'O' AND but8 = 'O'.
    CONCATENATE j_name2 ' is the winner(O)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but3 = 'O' AND but6 = 'O' AND but9 = 'O'.
    CONCATENATE j_name2 ' is the winner(O)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but1 = 'O' AND but5 = 'O' AND but9 = 'O'.
    CONCATENATE j_name2 ' is the winner(O)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
  IF but3 = 'O' AND but5 = 'O' AND but7 = 'O'.
    CONCATENATE j_name2 ' is the winner(O)!!' INTO j_string.
    MESSAGE  j_string TYPE 'I'.
    PERFORM reset.
  ENDIF.
ENDFORM.

FORM reset.
  CLEAR : but1, but2, but3, but4, but5, but6, but7, but9, but9, p1.
ENDFORM.
