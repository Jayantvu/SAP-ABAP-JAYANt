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
# SAP ABAP Custom Development Portfolio

A collection of optimized SAP ABAP reporting applications tracking enterprise metrics across core SAP modules. These tools utilize performance-conscious OpenSQL queries, data structures, and Object-Oriented ALV Grid displays.

---

## ✈️ Project 1: Flight Booking & Revenue Analytics
An interactive reporting tool that extracts flight transaction records from standard training data structures to track aircraft utilization and financial performance.

### 🛠️ Technical Features Implemented
* **Selection Screens:** Built dynamic user input blocks using `SELECT-OPTIONS` for multi-value data filtering.
* **Data Selection:** Structured optimized `OpenSQL` queries targeting the standard `SFLIGHT` database table.
* **Business Calculations:** Built math blocks inside explicit loops computing real-time Capacity Utilization (%) and Total Revenue metrics.
* **Object-Oriented ALV:** Implemented the modern `CL_SALV_TABLE` factory class to produce a sortable UI grid interface.

### 📊 Expected UI Output Grid Layout
When executed, the program processes the database calculations row-by-row and populates the following interactive ALV Grid:

| Airline | Flight Connection | Flight Date | Ticket Price | Currency | Max Seats | Occupied Seats | Occupancy Rate (%) | Total Revenue ($) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **LH** | 0400 | 15.11.2026 | 500.00 | USD | 300 | 240 | **80.00%** | **120,000.00** |
| **LH** | 0400 | 22.11.2026 | 500.00 | USD | 300 | 150 | **50.00%** | **75,000.00** |
| **LH** | 0402 | 18.11.2026 | 650.00 | USD | 250 | 230 | **92.00%** | **149,500.00** |

---

## 📦 Project 2: Material Inventory Stock Manager
A logistics-focused tracking application modeled after real-world SAP Materials Management (MM) requirements to analyze warehouse capacity, estimate inventory values, and flag critical deficits.

### 🛠️ Technical Features Implemented
* **Conditional Logic:** Built rule checking using `IF / ELSE / ENDIF` blocks to compare safety stock volumes against reorder thresholds.
* **Logistics Data Mastery:** Designed data architectures tracking standard SAP Logistics Master Data via the `MARC` (Plant Data for Material) dictionary table.
* **Status Automation:** Implemented dynamic text assignment loops to automatically stamp items as "CRITICAL: REORDER NOW" or "STOCK LEVEL HEALTHY".
* **SALV Grid Deployment:** Outputted processed rows into an interactive control grid enabling instant column filtering and Excel exports.

### 📊 Expected UI Output Grid Layout
The logistics dashboard automatically evaluates inventory alerts and formats warehouse volumes into this structured layout:

| Material ID | Plant / Warehouse | Maintenance Status | Safety Stock | Reorder Threshold | Estimated Stock Value ($) | Inventory Alert Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **MAT-1001** | 1000 (New York) | Active | 50 | 100 | 500.00 | 🚨 **CRITICAL: REORDER NOW** |
| **MAT-1002** | 1000 (New York) | Active | 200 | 150 | 2,000.00 | ✅ **STOCK LEVEL HEALTHY** |
| **MAT-2005** | 2000 (Chicago) | Testing | 10 | 30 | 100.00 | 🚨 **CRITICAL: REORDER NOW** |
