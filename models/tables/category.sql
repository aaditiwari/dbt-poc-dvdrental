
-- Welcome to your dbt model!
-- Configurations for models done directly within
-- the SQL file will override configurations stated in dbt_project.yml

-- Change 'view' to 'table' or vice-versa as per requirement

{{ config(materialized='table') }}


select 
    category_id ,
    name ,
    last_update 
from 
	{{ var('tables.category_tbl') }}	