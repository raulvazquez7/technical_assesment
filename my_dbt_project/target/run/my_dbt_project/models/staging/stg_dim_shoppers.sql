

  create or replace view `burnished-flare-384310`.`seQura_dbt`.`stg_dim_shoppers`
  OPTIONS()
  as 

SELECT 
    shopper_id,
    age
FROM `burnished-flare-384310`.`seQura_dbt`.`dim_shoppers`;

