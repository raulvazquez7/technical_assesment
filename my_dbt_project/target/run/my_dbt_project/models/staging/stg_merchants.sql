

  create or replace view `burnished-flare-384310`.`seQura_dbt`.`stg_merchants`
  OPTIONS()
  as 

SELECT 
    merchant_id,
    merchant_name
FROM `burnished-flare-384310`.`seQura_dbt`.`merchants`;

