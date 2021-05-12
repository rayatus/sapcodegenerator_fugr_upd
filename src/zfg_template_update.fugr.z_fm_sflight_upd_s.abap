FUNCTION z_fm_sflight_upd_s.
*"----------------------------------------------------------------------
*"*"Update Function Module:
*"
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IS_DATA) TYPE  SFLIGHT
*"     VALUE(ID_CHNGIND) TYPE  CDCHNGIND
*"  EXCEPTIONS
*"      DB_UPDATE_ERROR
*"      INCORRECT_CHANGE_INDICATOR
*"----------------------------------------------------------------------

  CASE id_chngind.
    WHEN gc_chngind-insert. INSERT is_data INTO TABLE gt_buffer_i.
    WHEN gc_chngind-update. INSERT is_data INTO TABLE gt_buffer_u.
    WHEN gc_chngind-delete. INSERT is_data INTO TABLE gt_buffer_d.
    WHEN gc_chngind-modify. INSERT is_data INTO TABLE gt_buffer_m.
    WHEN OTHERS.
      MESSAGE a431(e0) RAISING incorrect_change_indicator.
  ENDCASE.


  IF sy-oncom = gc_commit-synchronous.
    PERFORM buffer_update.
  ELSE.
    PERFORM buffer_update ON COMMIT.
    PERFORM buffer_clear  ON ROLLBACK.
  ENDIF.

ENDFUNCTION.
