
-- Welcome to your dbt model!
-- Configurations for models done directly within
-- the SQL file will override configurations stated in dbt_project.yml

-- Change 'view' to 'table' or vice-versa as per requirement

{{ config(materialized='table') }}


select 
    rental_id ,
    rental_date ,
    inventory_id ,
    customer_id ,
    return_date ,
    staff_id ,
    last_update 
from 
  {{ var('tables.rental_tbl') }}	