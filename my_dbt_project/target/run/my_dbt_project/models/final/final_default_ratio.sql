

  create or replace view `burnished-flare-384310`.`seQura_dbt`.`final_default_ratio`
  OPTIONS()
  as 

WITH loans_arrears AS (
    -- Vista de la deuda en mora por período
    SELECT 
        delayed_period,
        loans_in_arrears_debt
    FROM `burnished-flare-384310`.`seQura_dbt`.`intermediate_loans_arrears`
),

total_loans AS (
    -- Vista del monto total de préstamos por mes
    SELECT 
        month_year_order,
        total_loans_amount
    FROM `burnished-flare-384310`.`seQura_dbt`.`intermediate_total_loans`
),

-- Calculamos el Default Ratio utilizando un CROSS JOIN para obtener combinaciones posibles
combined_data AS (
    SELECT 
        a.delayed_period,
        t.month_year_order,
        a.loans_in_arrears_debt,
        t.total_loans_amount,
        -- Cálculo del Default Ratio
        ROUND((a.loans_in_arrears_debt / t.total_loans_amount) * 100, 2) AS default_ratio
    FROM loans_arrears a
    CROSS JOIN total_loans t
)

-- Resultado Final mostrando el Default Ratio por período y mes
SELECT 
    delayed_period,
    month_year_order,
    loans_in_arrears_debt,
    total_loans_amount,
    default_ratio
FROM combined_data
ORDER BY month_year_order, delayed_period;

