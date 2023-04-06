-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name, count(c.category_id) FROM sakila.category as c
join sakila.film_category as fc 
on c.category_id = fc.category_id
GROUP BY name;
-- Display the total amount rung up by each staff member in August of 2005.
SELECT p.staff_id, SUM(p.amount) as total_amount FROM sakila.payment as p
JOIN sakila.staff as s
on p.staff_id = s.staff_id
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY staff_id;
-- Which actor has appeared in the most films?
SELECT a.actor_id, first_name, last_name, count(*) as Appeared_in_films FROM sakila.actor as a
join sakila.film_actor as fa
on a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY Appeared_in_films DESC;
-- Most active customer (the customer that has rented the most number of films)
SELECT c.customer_id, first_name, last_name, count(*) as Active_customers FROM sakila.customer as c
join sakila.rental as r
on c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY Active_customers DESC;
-- Display the first and last names, as well as the address, of each staff member.
select staff_id, first_name, last_name, a.address from sakila.staff as s
join sakila.address as a
on s.address_id = a.address_id;
-- List each film and the number of actors who are listed for that film.
select title, count(actor_id) from sakila.film as f
join sakila.film_actor as fa
on f.film_id = fa.film_id
GROUP BY title;
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select last_name, sum(amount) AS 'Total Payment' from sakila.customer as c
join sakila.payment as p
on c.customer_id = p.customer_id
GROUP BY c.last_name
ORDER BY last_name ASC;
-- List number of films per category.
select name, count(c.category_id) as 'Number of films' from sakila.category as c
join sakila.film_category as fc
on c.category_id = fc.category_id
GROUP BY name;


