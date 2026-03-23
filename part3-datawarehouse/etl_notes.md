## ETL Decisions

### Decision 1 — Date Standardization
Problem: The raw dataset contained inconsistent date formats such as DD-MM-YYYY and MM/DD/YYYY, making it difficult to analyze time-based trends.
Resolution: All dates were converted into a standard YYYY-MM-DD format and mapped into a separate dim_date table with month and year attributes.

---

### Decision 2 — Category Normalization
Problem: Product categories had inconsistent casing such as "electronics", "Electronics", and "ELECTRONICS".
Resolution: All category values were standardized to proper case (e.g., Electronics, Clothing, Groceries) before loading into dim_product.

---

### Decision 3 — Handling NULL Values
Problem: Some records had missing values in important fields such as quantity and revenue.
Resolution: NULL values were either removed or replaced with default values where appropriate to ensure data integrity in the fact table.
