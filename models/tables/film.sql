
-- Welcome to your dbt model!
-- Configurations for models done directly within
-- the SQL file will override configurations stated in dbt_project.yml

-- Change 'view' to 'table' or vice-versa as per requirement

{{ config(materialized='table') }}


select 
    film_id ,
    title ,
    description ,
    release_year ,
    language_id ,
    rental_duration ,
    rental_rate ,
    length ,
    replacement_cost ,
    rating ,
    last_update ,
    special_features ,
    fulltext 
from 
  {{ var('tables.film_tbl') }}	
