# Challenge - Joining on multiple tables
# Write SQL queries to perform the following tasks using the Sakila database:

# List the number of films per category.
#SELECT category, COUNT(film_id) AS number_of_films_per_category
SELECT name, COUNT(film_id) AS number_of_films_per_category
FROM film as f
INNER JOIN film_category as fc
USING (film_id)
INNER JOIN category as c
USING (category_id)
GROUP BY name;


# Retrieve the store ID, city, and country for each store.
SELECT store_id, city, country
FROM store AS s
INNER JOIN address AS a
USING (address_id)
INNER JOIN city AS c
USING (city_id)
INNER JOIN country AS co
USING (country_id)
ORDER BY store_id;

# Calculate the total revenue generated by each store in dollars.
SELECT store_id, SUM(amount) as total_revenue
FROM store
INNER JOIN staff AS s
USING (store_id)
INNER JOIN payment AS p
USING (staff_id)
GROUP BY store_id
ORDER BY store_id;

# Determine the average running time of films for each category.
SELECT name, ROUND(AVG(length)) AS average_running_time
FROM film as f
INNER JOIN film_category as fc
USING (film_id)
INNER JOIN category as c
USING (category_id)
GROUP BY name;