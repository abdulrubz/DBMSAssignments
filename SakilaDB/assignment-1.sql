-- 1. Find out the PG-13 rated comedy movies. DO NOT use the film_list table.

select film.film_id, film.title
from film, film_category, category
where film.film_id = film_category.film_id
and film_category.category_id = category.category_id 
and rating = "PG-13"
and category.name = "Comedy";

-- +---------+-------------------------+
-- | film_id | title                   |
-- +---------+-------------------------+
-- |       7 | AIRPLANE SIERRA         |
-- |      28 | ANTHEM LUKE             |
-- |     324 | FLINTSTONES HAPPINESS   |
-- |     335 | FREEDOM CLEOPATRA       |
-- |     385 | GROUNDHOG UNCUT         |
-- |     502 | KNOCK WARLOCK           |
-- |     657 | PARADISE SABRINA        |
-- |     672 | PERFECT GROOVE          |
-- |     754 | RUSHMORE MERMAID        |
-- |     756 | SADDLE ANTITRUST        |
-- |     857 | STRICTLY SCARFACE       |
-- |     905 | TRAINSPOTTING STRANGERS |
-- +---------+-------------------------+
-- 12 rows in set (0.01 sec)


-----------------------------------------------------------------------------

-- 2. Find out the top 3 rented horror movies.

select film.title from film 
join film_category on film.film_id = film_category.film_id
join category on film_category.category_id = category.category_id 
join inventory on film.film_id = inventory.film_id 
join rental on inventory.inventory_id = rental.inventory_id 
where category.name = "Horror"
group by film.title 
order by count(film.title) desc limit 3;


-- +--------------+
-- | title        |
-- +--------------+
-- | PULP BEVERLY |
-- | FAMILY SWEET |
-- | SWARM GOLD   |
-- +--------------+
-- 3 rows in set (0.00 sec)

-----------------------------------------------------------------------------

-- 3. Find out the list of customers from India who have rented sports movies.

select customer_list.name from customer_list
join rental on customer_list.ID = rental.customer_id 
join inventory on rental.inventory_id = inventory.inventory_id 
join film on inventory.film_id = film.film_id 
join film_category on film.film_id = film_category.film_id 
join category on film_category.category_id = category.category_id 
where customer_list.country = "India"
and category.name = "Sports";

-- +-------------------+
-- | name              |
-- +-------------------+
-- | LENA JENSEN       |
-- | SAMUEL MARLOW     |
-- | WAYNE TRUONG      |
-- | ADAM GOOCH        |
-- | SHANNON FREEMAN   |
-- | DWAYNE OLVERA     |
-- | TIM CARY          |
-- | NAOMI JENNINGS    |
-- | LENA JENSEN       |
-- | LORI WOOD         |
-- | LENA JENSEN       |
-- | CHAD CARBONE      |
-- | GERALD FULTZ      |
-- | LORI WOOD         |
-- | STEVEN CURLEY     |
-- | BRETT CORNWELL    |
-- | PEARL GARZA       |
-- | PENNY NEAL        |
-- | RAMONA HALE       |
-- | MILTON HOWLAND    |
-- | RAMONA HALE       |
-- | SAMUEL MARLOW     |
-- | NICOLE PETERSON   |
-- | LEE HAWKS         |
-- | BRADLEY MOTLEY    |
-- | NAOMI JENNINGS    |
-- | LUCY WHEELER      |
-- | HELEN HARRIS      |
-- | JOSEPHINE GOMEZ   |
-- | GEORGIA JACOBS    |
-- | TIM CARY          |
-- | MIKE WAY          |
-- | JOSEPHINE GOMEZ   |
-- | GERALD FULTZ      |
-- | TIM CARY          |
-- | STEVEN CURLEY     |
-- | ANNETTE OLSON     |
-- | RAMONA HALE       |
-- | BRETT CORNWELL    |
-- | SALLY PIERCE      |
-- | TONYA CHAPMAN     |
-- | MILDRED BAILEY    |
-- | PENNY NEAL        |
-- | TIM CARY          |
-- | JOSHUA MARK       |
-- | CHAD CARBONE      |
-- | SAMUEL MARLOW     |
-- | HELEN HARRIS      |
-- | MILDRED BAILEY    |
-- | NAOMI JENNINGS    |
-- | THEODORE CULP     |
-- | NINA SOTO         |
-- | TONYA CHAPMAN     |
-- | JOSHUA MARK       |
-- | JUANITA MASON     |
-- | NICOLE PETERSON   |
-- | CHERYL MURPHY     |
-- | JUANITA MASON     |
-- | LAURIE LAWRENCE   |
-- | LENA JENSEN       |
-- | GEORGIA JACOBS    |
-- | EDITH MCDONALD    |
-- | LEE HAWKS         |
-- | ADAM GOOCH        |
-- | AMY LOPEZ         |
-- | LORI WOOD         |
-- | ANITA MORALES     |
-- | ALLEN BUTTERFIELD |
-- | ANNETTE OLSON     |
-- | MILTON HOWLAND    |
-- | SHERRI RHODES     |
-- | LAURIE LAWRENCE   |
-- | NANCY THOMAS      |
-- | ARLENE HARVEY     |
-- | BERNARD COLBY     |
-- | LEE HAWKS         |
-- | RAMONA HALE       |
-- | CHERYL MURPHY     |
-- | LORI WOOD         |
-- | DWAYNE OLVERA     |
-- | LENA JENSEN       |
-- | ARLENE HARVEY     |
-- | BRADLEY MOTLEY    |
-- | JOHN FARNSWORTH   |
-- | HELEN HARRIS      |
-- | BRETT CORNWELL    |
-- | MILDRED BAILEY    |
-- | THEODORE CULP     |
-- | SALLY PIERCE      |
-- | SHANNON FREEMAN   |
-- | BRETT CORNWELL    |
-- | PAULA BRYANT      |
-- | STEVEN CURLEY     |
-- | JOHN FARNSWORTH   |
-- | GERALD FULTZ      |
-- | STEVEN CURLEY     |
-- | CYNTHIA YOUNG     |
-- | SALLY PIERCE      |
-- | CARLOS COUGHLIN   |
-- | PEARL GARZA       |
-- | CARLOS COUGHLIN   |
-- | HELEN HARRIS      |
-- | EDITH MCDONALD    |
-- | BEATRICE ARNOLD   |
-- | TONYA CHAPMAN     |
-- | DWAYNE OLVERA     |
-- | SHANNON FREEMAN   |
-- | JUANITA MASON     |
-- | CHRISTIAN JUNG    |
-- | HOLLY FOX         |
-- | TIM CARY          |
-- | LORI WOOD         |
-- | CYNTHIA YOUNG     |
-- | STEVEN CURLEY     |
-- | EDITH MCDONALD    |
-- +-------------------+
-- 115 rows in set (0.01 sec)



--------------------------------------------------------------------------------------


-- 4. Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.

select customer_list.name from customer_list 
join rental on customer_list.ID = rental.customer_id 
join inventory on rental.inventory_id = inventory.inventory_id 
join film on inventory.film_id = film.film_id 
join film_actor on film.film_id = film_actor.film_id
join actor on film_actor.actor_id = actor.actor_id 
where customer_list.country = "Canada" 
and actor.first_name = "NICK"
and actor.last_name = "WAHLBERG";

-- +-------------------+
-- | name              |
-- +-------------------+
-- | LORETTA CARPENTER |
-- | LORETTA CARPENTER |
-- | DARRELL POWER     |
-- +-------------------+
-- 3 rows in set (0.02 sec)

---------------------------------------------------------------

-- 5. Find out the number of movies in which “SEAN WILLIAMS” acted.

select count(actor.actor_id) from film 
join film_actor on film.film_id=film_actor.film_id 
join actor on actor.actor_id=film_actor.actor_id 
where actor.first_name='SEAN' and actor.last_name='WILLIAMS';

-- +-----------------------+
-- | count(actor.actor_id) |
-- +-----------------------+
-- |                    26 |
-- +-----------------------+
-- 1 row in set (0.00 sec)
