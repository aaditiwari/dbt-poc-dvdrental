with poc_payment as (
	select * from {{ref('payment')}}
), poc_rental as (
	select * from {{ref('rental')}}
), poc_inventory as (
	select * from {{ref('inventory')}}
), poc_film as (
	select * from {{ref('film')}}
), poc_film_category as (
	select * from {{ref('film_category')}}
), poc_category as (
	select * from {{ref('category')}}
)
 SELECT c.name AS category,
    sum(p.amount) AS total_sales
   FROM poc_payment p
     JOIN poc_rental r ON p.rental_id = r.rental_id
     JOIN poc_inventory i ON r.inventory_id = i.inventory_id
     JOIN poc_film f ON i.film_id = f.film_id
     JOIN poc_film_category fc ON f.film_id = fc.film_id
     JOIN poc_category c ON fc.category_id = c.category_id
  GROUP BY c.name
  ORDER BY (sum(p.amount)) DESC
