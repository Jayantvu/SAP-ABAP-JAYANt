# SAP ABAP Flight Booking & Revenue Analytics

An interactive SAP ABAP reporting tool that extracts flight data from standard training tables, calculates key business metrics, and presents them in an optimized ALV Grid.

## 🚀 Project Overview
This project is designed to help airline managers track flight capacities and financial performance. It filters raw system records by carrier or date range, processes the math line-by-line, and outputs a searchable data table.

## 🛠️ Key Technical Features Implemented
* **Selection Screens:** Built input fields using `SELECT-OPTIONS` for multi-value filtering.
* **Data Selection:** Structured optimized `OpenSQL` queries targeting the standard `SFLIGHT` dictionary table.
* **Internal Tables & Loops:** Managed records dynamically using performance-conscious internal tables (`STANDARD TABLE`) and explicit loop architectures.
* **Business Calculations:** Built math blocks computing real-time Capacity Utilization (%) and Total Revenue metrics.
* **Object-Oriented ALV:** Implemented the modern `CL_SALV_TABLE` class to produce an editable, sortable user interface grid.

## 📊 Business Logic Breakdown
* **Total Revenue:** Calculated dynamically per flight as `Price` × `Seats Occupied`.
* **Utilization Rate:** Calculated as (`Seats Occupied` / `Maximum Seats`) × 100 to pinpoint underperforming flight paths.
*
