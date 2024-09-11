

  create or replace view `burnished-flare-384310`.`seQura_dbt`.`intermediate_total_loans`
  OPTIONS()
  as 

WITH total_loans AS (
    SELECT
        o.order_id,
        o.shopper_id,
        o.merchant_id,
        o.order_date,
        o.current_order_value
    FROM `burnished-flare-384310`.`seQura_dbt`.`stg_orders` o
)

SELECT 
    DATE_TRUNC(order_date, MONTH) AS month_year_order,
    SUM(current_order_value) AS total_loans_amount
FROM total_loans
GROUP BY month_year_order;

