with poc_address as (
	select * from {{ref('address')}}
), poc_city as (
	select * from {{ref('city')}}
), poc_country as (
	select * from {{ref('country')}}
), poc_staff as (
	select * from {{ref('staff')}}	
)
 SELECT s.staff_id AS id,
    (s.first_name::text || ' '::text) || s.last_name::text AS name,
    a.address,
    a.postal_code AS "zip code",
    a.phone,
    city.city,
    country.country,
    s.store_id AS sid
   FROM poc_staff s
     JOIN poc_address a ON s.address_id = a.address_id
     JOIN poc_city city ON a.city_id = city.city_id
     JOIN poc_country country ON city.country_id = country.country_id