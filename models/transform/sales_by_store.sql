with poc_payment as (
	select * from {{ref('payment')}}
), poc_rental as (
	select * from {{ref('rental')}}
), poc_inventory as (
	select * from {{ref('inventory')}}
), poc_store as (
	select * from {{ref('store')}}
), poc_address as (
	select * from {{ref('address')}}
), poc_city as (
	select * from {{ref('city')}}
), poc_country as (
	select * from {{ref('country')}}
), poc_staff as (
	select * from {{ref('staff')}}	
)
 SELECT (c.city::text || ','::text) || cy.country::text AS store,
    (m.first_name::text || ' '::text) || m.last_name::text AS manager,
    sum(p.amount) AS total_sales
   FROM poc_payment p
     JOIN poc_rental r ON p.rental_id = r.rental_id
     JOIN poc_inventory i ON r.inventory_id = i.inventory_id
     JOIN poc_store s ON i.store_id = s.store_id
     JOIN poc_address a ON s.address_id = a.address_id
     JOIN poc_city c ON a.city_id = c.city_id
     JOIN poc_country cy ON c.country_id = cy.country_id
     JOIN poc_staff m ON s.manager_staff_id = m.staff_id
  GROUP BY cy.country, c.city, s.store_id, m.first_name, m.last_name
  ORDER BY cy.country, c.city