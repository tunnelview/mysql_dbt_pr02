{{config(
  materialized='incremental',
  unique_key='Purchase_Dd',
  strategy='check'
)}}

SELECT
  Purchase_Id,
  SUM(Purchase_Amount) AS Total_Amount
  FROM
  {{ ref('purchasesInc') }}
GROUP BY
  Purchase_Id