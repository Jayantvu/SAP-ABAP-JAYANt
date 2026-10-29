REPORT z_material_inventory.

TABLES: marc.

" 1. Selection Screen (User Input Filters)
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: s_matnr FOR marc-matnr, " Material ID Number
                  s_werks FOR marc-werks. " Plant / Warehouse ID
SELECTION-SCREEN END OF BLOCK b1.

" 2. Storage Structures for Data
TYPES: BEGIN OF ty_inventory,
         matnr     TYPE marc-matnr,
         werks     TYPE marc-werks,
         pstat     TYPE marc-pstat,
         minbe     TYPE marc-minbe, " Safety Stock Level
         eisbe     TYPE marc-eisbe, " Reorder Point Level
         stock_val TYPE p LENGTH 8 DECIMALS 2, " Calculated Total Value
         status    TYPE string,              " Calculated Alert Status
       END OF ty_inventory.

DATA: lt_inventory TYPE STANDARD TABLE OF ty_inventory,
      ls_inventory TYPE ty_inventory,
      lt_marc      TYPE STANDARD TABLE OF marc,
      ls_marc      TYPE marc.

START-OF-SELECTION.
  " 3. Fetching Raw Material Records
  SELECT * FROM marc
    INTO TABLE lt_marc
    WHERE matnr IN s_matnr
      AND werks IN s_werks.

  " 4. Processing Inventory Calculations Loop
  LOOP AT lt_marc INTO ls_marc.
    CLEAR ls_inventory.
    MOVE-CORRESPONDING ls_marc TO ls_inventory.

    " Calculation: Simulated Value (Min Safety Stock * Placeholder Price $10)
    ls_inventory-stock_val = ls_marc-minbe * 10.

    " Status Logic: Trigger Warning alert if safety stock is near zero
    IF ls_marc-minbe <= ls_marc-eisbe.
      ls_inventory-status = 'CRITICAL: REORDER NOW'.
    ELSE.
      ls_inventory-status = 'STOCK LEVEL HEALTHY'.
    ENDIF.

    APPEND ls_inventory TO lt_inventory.
  ENDLOOP.

  " 5. Display Final Grid Results
  DATA: lo_alv TYPE REF TO cl_salv_table.

  TRY.
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = lo_alv
        CHANGING
          t_table      = lt_inventory ).

      lo_alv->get_functions( )->set_all( abap_true ).
      lo_alv->display( ).

    CATCH cx_salv_msg.
      MESSAGE 'Error loading inventory grid.' TYPE 'E'.
  ENDTRY.
