
-- Welcome to your dbt model!
-- Configurations for models done directly within
-- the SQL file will override configurations stated in dbt_project.yml

-- Change 'view' to 'table' or vice-versa as per requirement

{{ config(materialized='table') }}


select     
	actor_id ,
    first_name ,
    last_name ,
    last_update 
from 
  {{ var('tables.actor_tbl') }}