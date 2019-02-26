
-- Welcome to your dbt model!
-- Configurations for models done directly within
-- the SQL file will override configurations stated in dbt_project.yml

-- Change 'view' to 'table' or vice-versa as per requirement

{{ config(materialized='table') }}


select 
    payment_id ,
    customer_id ,
    staff_id ,
    rental_id ,
    amount ,
    payment_date 
from 
  {{ var('tables.payment_tbl') }}	