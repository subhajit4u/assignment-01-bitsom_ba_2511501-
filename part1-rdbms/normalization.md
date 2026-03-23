## Anomaly Analysis

### Insert Anomaly
A new product cannot be added unless it is associated with an order.

Example:
Columns: product_id, product_name, unit_price are always tied to an order_id.
For instance, product "P007 - Pen Set" appears only in rows like:
- order_id: ORD1114
- order_id: ORD1153

There is no way to insert a new product without creating an order entry.

---

### Update Anomaly
Product information is repeated across multiple rows, leading to inconsistency risks.

Example:
Product:
product_id: P007  
product_name: Pen Set  
unit_price: 250  

Appears in multiple rows:
- ORD1114
- ORD1153
- ORD1118
- ORD1132
- ORD1037
- ORD1083

If the price of "Pen Set" changes from 250 to 300, all these rows must be updated. Missing even one row will cause inconsistent data.

---

### Delete Anomaly
Deleting a row may result in loss of important product or customer information.

Example:
If a product appears only once:
product_id: P004  
product_name: Notebook  
order_id: ORD1027  

If this row is deleted, all information about "Notebook" is lost.

Columns affected:
product_id, product_name, category
