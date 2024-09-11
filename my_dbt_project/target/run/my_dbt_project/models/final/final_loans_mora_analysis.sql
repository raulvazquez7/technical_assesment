
  
    

    create or replace table `burnished-flare-384310`.`seQura_dbt`.`final_loans_mora_analysis`
      
    
    

    OPTIONS()
    as (
      

SELECT 
    shopper_age,
    month_year_order,
    product,
    merchant,
    default_type,
    delayed_period
FROM `burnished-flare-384310`.`seQura_dbt`.`intermediate_loans_mora_analysis`
ORDER BY month_year_order, delayed_period
    );
  