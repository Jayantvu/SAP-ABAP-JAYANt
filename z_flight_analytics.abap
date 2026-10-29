REPORT z_flight_analytics.

TABLES: sflight.

" 1. Selection Screen
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: s_carrid FOR sflight-carrid,
                  s_fldate FOR sflight-fldate.
SELECTION-SCREEN END OF BLOCK b1.

" 2. Data Structures
TYPES: BEGIN OF ty_flight_report,
         carrid    TYPE sflight-carrid,
         connid    TYPE sflight-connid,
         fldate    TYPE sflight-fldate,
         price     TYPE sflight-price,
         currency  TYPE sflight-currency,
         seatsmax  TYPE sflight-seatsmax,
         seatsocc  TYPE sflight-seatsocc,
         util_rate TYPE p LENGTH 3 DECIMALS 2,
         total_rev TYPE sflight-paymentsum,
       END OF ty_flight_report.

DATA: lt_report TYPE STANDARD TABLE OF ty_flight_report,
      ls_report TYPE ty_flight_report,
      lt_sflight TYPE STANDARD TABLE OF sflight,
      ls_sflight TYPE sflight.

START-OF-SELECTION.
  " Fetch Data
  SELECT * FROM sflight 
    INTO TABLE lt_sflight
    WHERE carrid IN s_carrid
      AND fldate IN s_fldate.

  " 3. Business Calculations Logic
  LOOP AT lt_sflight INTO ls_sflight.
    CLEAR ls_report.
    MOVE-CORRESPONDING ls_sflight TO ls_report.
    
    ls_report-total_rev = ls_sflight-price * ls_sflight-seatsocc.
    
    IF ls_sflight-seatsmax > 0.
      ls_report-util_rate = ( ls_sflight-seatsocc / ls_sflight-seatsmax ) * 100.
    ENDIF.
    
    APPEND ls_report TO lt_report.
  </col>LOOP.

  " 4. Display Modern ALV Grid
  DATA: lo_alv TYPE REF TO cl_salv_table.

  TRY.
      cl_salv_table=>factory(
        IMPORTING r_salv_table = lo_alv
        CHANGING t_table      = lt_report ).
      lo_alv->get_functions( )->set_all( abap_true ).
      lo_alv->display( ).
    CATCH cx_salv_msg.
      MESSAGE 'Error displaying report grid.' TYPE 'E'.
  ENDTRY.
