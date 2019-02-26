
-- Welcome to your dbt model!
-- Configurations for models done directly within
-- the SQL file will override configurations stated in dbt_project.yml

-- Change 'view' to 'table' or vice-versa as per requirement

{{ config(materialized='table') }}


select 
    customer_id ,
    store_id ,
    first_name ,
    last_name ,
    email ,
    address_id ,
    activebool ,
    create_date ,
    last_update ,
    active 
from 
  {{ var('tables.customer_tbl') }}	