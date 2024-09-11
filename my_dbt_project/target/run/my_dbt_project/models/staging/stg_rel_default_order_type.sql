

  create or replace view `burnished-flare-384310`.`seQura_dbt`.`stg_rel_default_order_type`
  OPTIONS()
  as 

SELECT 
    default_type_id,
    order_id,
    default_type
FROM `burnished-flare-384310`.`seQura_dbt`.`rel_default_order_type`;

