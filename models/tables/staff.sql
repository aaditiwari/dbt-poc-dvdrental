
-- Welcome to your dbt model!
-- Configurations for models done directly within
-- the SQL file will override configurations stated in dbt_project.yml

-- Change 'view' to 'table' or vice-versa as per requirement

{{ config(materialized='table') }}


select 
    staff_id ,
    first_name ,
    last_name ,
    address_id ,
    email ,
    store_id ,
    active ,
    username ,
    password ,
    last_update ,
    picture 
from 
  {{ var('tables.staff_tbl') }}	