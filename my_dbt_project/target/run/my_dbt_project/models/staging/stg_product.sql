

  create or replace view `burnished-flare-384310`.`seQura_dbt`.`stg_product`
  OPTIONS()
  as 

SELECT 
    product_id,
    product_name
FROM `burnished-flare-384310`.`seQura_dbt`.`products`;

