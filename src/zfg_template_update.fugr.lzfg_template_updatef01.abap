*----------------------------------------------------------------------*
***INCLUDE LZDB_TEMPLATE_UPDATEF01 .
*----------------------------------------------------------------------*

*=======================================================================
FORM buffer_update .
*=======================================================================

  IF NOT gt_buffer_i[] IS INITIAL.
    INSERT sflight FROM TABLE gt_buffer_i[] ACCEPTING DUPLICATE KEYS.
    IF NOT sy-subrc IS INITIAL.
      MESSAGE a011(/sapdmc/lsmw) WITH 'SFLIGHT' RAISING db_update_error.
    ENDIF.
  ENDIF.

  IF NOT gt_buffer_u[] IS INITIAL.
    UPDATE sflight FROM TABLE gt_buffer_u[].
    IF NOT sy-subrc IS INITIAL.
      MESSAGE a012(/sapdmc/lsmw) WITH 'SFLIGHT' RAISING db_update_error.
    ENDIF.
  ENDIF.

  IF NOT gt_buffer_d[] IS INITIAL.
    DELETE sflight FROM TABLE gt_buffer_d[].
    IF NOT sy-subrc IS INITIAL.
      MESSAGE a013(/sapdmc/lsmw) WITH 'SFLIGHT' RAISING db_update_error.
    ENDIF.
  ENDIF.

  IF NOT gt_buffer_m[] IS INITIAL.
    modify sflight FROM TABLE gt_buffer_m[].
    IF NOT sy-subrc IS INITIAL.
      MESSAGE a013(/sapdmc/lsmw) WITH 'SFLIGHT' RAISING db_update_error.
    ENDIF.
  ENDIF.

  PERFORM buffer_clear.

ENDFORM.                    " BUFFER_UPDATE
*=======================================================================
FORM buffer_clear .
*=======================================================================
  CLEAR: gt_buffer_i,
         gt_buffer_u,
         gt_buffer_d,
         gt_buffer_m.
ENDFORM.                    " BUFFER_CLEAR
