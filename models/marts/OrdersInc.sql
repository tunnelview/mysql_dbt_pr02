
/*CREATE TABLE dbo.OrdersInc (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  order_total FLOAT
);
*/

/*INSERT INTO dbo.ordersinc (order_id, customer_id, order_date, order_total)
VALUES
  (1, 101, '2022-01-01', 100.0),
  (2, 101, '2022-01-02', 150.0),
  (3, 102, '2022-01-03', 75.0),
  (4, 103, '2022-01-04', 200.0),
  (5, 103, '2022-01-05', 50.0),
  (6, 104, '2022-01-06', 100.0),
  (7, 102, '2022-01-07', 125.0),
  (8, 105, '2022-01-08', 50.0),
  (9, 106, '2022-01-09', 75.0),
  (10, 101, '2022-01-10', 75.0),
  (11, 107, '2022-01-11', 150.0),
  (12, 108, '2022-01-12', 100.0),
  (13, 102, '2022-01-13', 200.0),
  (14, 109, '2022-01-14', 50.0),
  (15, 105, '2022-01-15', 75.0),
  (16, 110, '2022-01-16', 100.0),
  (17, 111, '2022-01-17', 150.0),
  (18, 112, '2022-01-18', 200.0),
  (19, 106, '2022-01-19', 75.0),
  (20, 113, '2022-01-20', 50.0);
*/


--{{ config(materialized='table') }}

--select * from dbo.OrdersInc

with Rename as ( 
Select
order_id as Order_Id,
order_total as Order_Total
from dbo.OrdersInc
)

select * from Rename

