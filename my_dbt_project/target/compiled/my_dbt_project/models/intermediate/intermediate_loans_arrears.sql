

WITH arrears_data AS (
    SELECT
        o.order_id,
        o.shopper_id,
        o.merchant_id,
        o.order_date,
        o.current_order_value,
        o.total_overdue,
        o.days_unbalanced
    FROM `burnished-flare-384310`.`seQura_dbt`.`stg_orders` o
    WHERE o.days_unbalanced >= 17  -- Filtrar órdenes con días de mora a partir de 17
),

expanded_periods AS (
    -- Clasificar en el grupo '17 days' para todos los que superan o igualan 17
    SELECT 
        order_id,
        shopper_id,
        merchant_id,
        order_date,
        current_order_value,
        total_overdue,
        days_unbalanced,
        '17 days' AS delayed_period
    FROM arrears_data
    WHERE days_unbalanced >= 17

    UNION ALL

    -- Clasificar en el grupo '30 days' para todos los que superan o igualan 30
    SELECT 
        order_id,
        shopper_id,
        merchant_id,
        order_date,
        current_order_value,
        total_overdue,
        days_unbalanced,
        '30 days' AS delayed_period
    FROM arrears_data
    WHERE days_unbalanced >= 30

    UNION ALL

    -- Clasificar en el grupo '60 days' para todos los que superan o igualan 60
    SELECT 
        order_id,
        shopper_id,
        merchant_id,
        order_date,
        current_order_value,
        total_overdue,
        days_unbalanced,
        '60 days' AS delayed_period
    FROM arrears_data
    WHERE days_unbalanced >= 60

    UNION ALL

    -- Clasificar en el grupo '90 days' para todos los que superan o igualan 90
    SELECT 
        order_id,
        shopper_id,
        merchant_id,
        order_date,
        current_order_value,
        total_overdue,
        days_unbalanced,
        '90 days' AS delayed_period
    FROM arrears_data
    WHERE days_unbalanced >= 90
),

-- Agregar la deuda total para cada período de demora
aggregated_periods AS (
    SELECT 
        delayed_period,
        SUM(total_overdue) AS loans_in_arrears_debt
    FROM expanded_periods
    GROUP BY delayed_period
)

-- Seleccionar los resultados finales, incluyendo la deuda total por período de demora
SELECT 
    delayed_period,
    loans_in_arrears_debt
FROM aggregated_periods
ORDER BY delayed_period