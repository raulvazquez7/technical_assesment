

  create or replace view `burnished-flare-384310`.`seQura_dbt`.`stg_orders`
  OPTIONS()
  as 

WITH raw_orders AS (
    SELECT 
        order_id,
        shopper_id,
        order_date,
        product_id,
        merchant_id,
        is_in_default,
        days_unbalanced,
        current_order_value,
        overdue_principal,
        overdue_fees
    FROM `burnished-flare-384310`.`seQura_dbt`.`orders`
)

SELECT 
    *,
    overdue_principal + overdue_fees AS total_overdue 
FROM raw_orders
WHERE current_order_value IS NOT NULL;

