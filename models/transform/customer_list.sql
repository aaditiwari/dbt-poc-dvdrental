with poc_customer as (
	select * from {{ref('customer')}}
), poc_address as (
	select * from {{ref('address')}}
), poc_city as (
	select * from {{ref('city')}}
), poc_country as (
	select * from {{ref('country')}}
)
 SELECT cu.customer_id AS id,
    (cu.first_name::text || ' '::text) || cu.last_name::text AS name,
    a.address,
    a.postal_code AS "zip code",
    a.phone,
    city.city,
    country.country,
        CASE
            WHEN cu.activebool THEN 'active'::text
            ELSE ''::text
        END AS notes,
    cu.store_id AS sid
   FROM poc_customer cu
     JOIN poc_address a ON cu.address_id = a.address_id
     JOIN poc_city city ON a.city_id = city.city_id
     JOIN poc_country country ON city.country_id = country.country_id