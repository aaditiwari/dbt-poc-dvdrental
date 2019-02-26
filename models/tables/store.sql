
-- Welcome to your dbt model!
-- Configurations for models done directly within
-- the SQL file will override configurations stated in dbt_project.yml

-- Change 'view' to 'table' or vice-versa as per requirement

{{ config(materialized='table') }}


select 
    store_id ,
    manager_staff_id ,
    address_id ,
    last_update 
from 
  {{ var('tables.store_tbl') }}	