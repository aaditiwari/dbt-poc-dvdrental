
-- Welcome to your dbt model!
-- Configurations for models done directly within
-- the SQL file will override configurations stated in dbt_project.yml

-- Change 'view' to 'table' or vice-versa as per requirement

{{ config(materialized='table') }}


select 
    inventory_id ,
    film_id ,
    store_id ,
    last_update 
from 
  {{ var('tables.inventory_tbl') }}	