
-- Welcome to your dbt model!
-- Configurations for models done directly within
-- the SQL file will override configurations stated in dbt_project.yml

-- Change 'view' to 'table' or vice-versa as per requirement

{{ config(materialized='table') }}


select 
    address_id ,
    address ,
    address2 ,
    district ,
    city_id ,
    postal_code ,
    phone ,
    last_update 
from 
  {{ var('tables.address_tbl') }}	