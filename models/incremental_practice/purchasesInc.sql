with Rename as ( 
Select
id as Purchase_Id,
Convert(date, purchase_date) as Purchase_Date,
purchase_amount as Purchase_Amount,
purchase_type as Purchse_Mode
from dbo.base_purchases
)

select * from Rename
