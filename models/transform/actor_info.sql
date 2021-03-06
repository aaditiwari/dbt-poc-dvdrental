with poc_film as (
	select * from {{ref('film')}}
), poc_film_category as (
	select * from {{ref('film_category')}}
), poc_film_actor as (
	select * from {{ref('film_actor')}}
), poc_actor as (
	select * from {{ref('actor')}}
), poc_category as (
	select * from {{ref('category')}}
)
 SELECT a.actor_id,
    a.first_name,
    a.last_name, 		  
	group_concat(DISTINCT (c.name::text || ': '::text) || (( SELECT group_concat(f.title::text) AS group_concat
           FROM poc_film f
             JOIN poc_film_category fc_1 ON f.film_id = fc_1.film_id
             JOIN poc_film_actor fa_1 ON f.film_id = fa_1.film_id
          WHERE fc_1.category_id = c.category_id AND fa_1.actor_id = a.actor_id
          GROUP BY fa_1.actor_id)))	
   FROM poc_actor a
     LEFT JOIN poc_film_actor fa ON a.actor_id = fa.actor_id
     LEFT JOIN poc_film_category fc ON fa.film_id = fc.film_id
     LEFT JOIN poc_category c ON fc.category_id = c.category_id
  GROUP BY a.actor_id, a.first_name, a.last_name