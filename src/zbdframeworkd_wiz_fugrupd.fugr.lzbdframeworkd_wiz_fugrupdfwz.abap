*----------------------------------------------------------------------*
***INCLUDE LWZ_WIZARDFWZ .
*----------------------------------------------------------------------*
************************************************************************
* Wizard data:
*   All data collected by the wizard
************************************************************************



************************************************************************
* FORM-Routines
************************************************************************
*&---------------------------------------------------------------------*
*&      Form  WZ_DEFINE_WIZARD_STEPS
*&---------------------------------------------------------------------*
FORM WZ_DEFINE_WIZARD_STEPS
        TABLES
           P_WIZARD_STEPS   STRUCTURE SWF_WIZDEF.
  DATA:
    L_WIZARD_STEP   TYPE SWF_WIZDEF.

*&WZ_PATTERN_WIZARD_STEPS_START&
  L_WIZARD_STEP-PROGRAM   = 'SAPLZBDFRAMEWORKD_WIZ_FUGRUPD'.

  L_WIZARD_STEP-FORM      = 'CB_PROCESS_STEP_START'.
  L_WIZARD_STEP-TEXT      = TEXT-001.
  APPEND L_WIZARD_STEP TO P_WIZARD_STEPS.

  L_WIZARD_STEP-FORM      = 'CB_PROCESS_STEP_0200'.
  L_WIZARD_STEP-TEXT      = TEXT-002.
  APPEND L_WIZARD_STEP TO P_WIZARD_STEPS.

  L_WIZARD_STEP-FORM      = 'CB_PROCESS_STEP_0300'.
  L_WIZARD_STEP-TEXT      = TEXT-003.
  APPEND L_WIZARD_STEP TO P_WIZARD_STEPS.

  L_WIZARD_STEP-FORM      = 'CB_PROCESS_STEP_FINISH'.
  L_WIZARD_STEP-TEXT      = TEXT-004.
  APPEND L_WIZARD_STEP TO P_WIZARD_STEPS.

*&WZ_PATTERN_WIZARD_STEPS_END&
ENDFORM.                    " WZ_DEFINE_WIZARD_STEPS

*&---------------------------------------------------------------------*
*&      Form  WZ_WIZARD_PROCESS
*&---------------------------------------------------------------------*
FORM WZ_WIZARD_PROCESS
        TABLES
           P_WIZARD_STEPS   STRUCTURE  SWF_WIZDEF
        CHANGING
           P_SUBRC          TYPE       SY-SUBRC.

  CALL FUNCTION 'SWF_WIZARD_PROCESS'
       EXPORTING
            CONTAINER_COMPENSATION      = wizard_true
            PROCESS_LOGGING             = wizard_true
            ROADMAP                     = wizard_true
            START_COLUMN                = 2
            START_ROW                   = 2
       TABLES
            DEFINITION                  = P_WIZARD_STEPS
       EXCEPTIONS
            OPERATION_CANCELLED_BY_USER = 1
            PROCESS_IN_ERROR            = 2
            OTHERS                      = 3.
  P_SUBRC = SY-SUBRC.

ENDFORM.                    " WZ_WIZARD_PROCESS

************************************************************************
* MODULES
************************************************************************
*&---------------------------------------------------------------------*
*&      Module  WZ_USER_COMMAND_WIZARD  INPUT
*&---------------------------------------------------------------------*
MODULE WZ_USER_COMMAND_WIZARD INPUT.
  SWF_OKCODE_GET G_OK_CODE.
  G_SAVE_OK_CODE = G_OK_CODE.
  CLEAR G_OK_CODE.
ENDMODULE.                 " WZ_USER_COMMAND_WIZARD  INPUT
