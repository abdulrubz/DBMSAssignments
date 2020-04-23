-- 1. Find out the number of documentaries with deleted scenes.

select count(film.film_id) as film_count from film
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id 
where category.name = "Documentary"
and film.special_features = "Deleted Scenes";

-- +------------+
-- | film_count |
-- +------------+
-- |          7 |
-- +------------+
-- 1 row in set (0.00 sec)

-------------------------------------------------------------------------------

-- 2. Find out the number of sci-fi movies rented by the store managed by Jon Stephens.

select count(film_category.film_id) as film_count from film_category
join category on film_category.category_id=category.category_id
join inventory on film_category.film_id=inventory.film_id
join store on store.store_id=inventory.store_id
join staff on staff.staff_id=store.manager_staff_id
where category.name = "Sci-Fi" 
and staff.first_name = "Jon"
and staff.last_name = "Stephens";

-- +------------+
-- | film_count |
-- +------------+
-- |        163 |
-- +------------+
-- 1 row in set (0.01 sec)

------------------------------------------------------------------------

-- 3. Find out the total sales from Animation movies.

select total_sales from sales_by_film_category where category = "Animation";

-- +-------------+
-- | total_sales |
-- +-------------+
-- |     4656.30 |
-- +-------------+
-- 1 row in set (0.10 sec)

-------------------------------------------------------------------------------

-- 4. Find out the top 3 rented category of movies by “PATRICIA JOHNSON”.

select film_list.category from film_list
join inventory on film_list.FID = inventory.film_id 
join rental on inventory.inventory_id = rental.inventory_id 
join customer on rental.customer_id = customer.customer_id 
where first_name = "Patricia" 
and last_name = "Johnson" 
group by film_list.category 
order by count(film_list.category) desc limit 3;

-- +-----------+
-- | category  |
-- +-----------+
-- | Sports    |
-- | Classics  |
-- | Animation |
-- +-----------+
-- 3 rows in set (0.06 sec)

-- 5. Find out the number of R rated movies rented by “SUSAN WILSON”.

select count(film.rating) as total_r_films from film
join inventory on film.film_id = inventory.film_id
join rental on rental.inventory_id = inventory.inventory_id
join customer on customer.customer_id = rental.customer_id
where customer.first_name = "Susan" 
and customer.last_name = "Wilson" 
and film.rating = "R";

-- +---------------+
-- | total_r_films |
-- +---------------+
-- |             3 |
-- +---------------+
-- 1 row in set (0.00 sec)