with poc_film_category as (
	select * from {{ref('film_category')}}
), poc_category as (
	select * from {{ref('category')}}
), poc_film as (
	select * from {{ref('film')}}
), poc_film_actor as (
	select * from {{ref('film_actor')}}
), poc_actor as (
	select * from {{ref('actor')}}
)
 SELECT film.film_id AS fid,
    film.title,
    film.description,
    category.name AS category,
    film.rental_rate AS price,
    film.length,
    film.rating,
    group_concat((actor.first_name::text || ' '::text) || actor.last_name::text) AS actors
   FROM poc_category category
     LEFT JOIN poc_film_category film_category ON category.category_id = film_category.category_id
     LEFT JOIN poc_film film ON film_category.film_id = film.film_id
     JOIN poc_film_actor film_actor ON film.film_id = film_actor.film_id
     JOIN poc_actor actor ON film_actor.actor_id = actor.actor_id
  GROUP BY film.film_id, film.title, film.description, category.name, film.rental_rate, film.length, film.rating