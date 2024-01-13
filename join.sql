use sakila;

-- 1.List the number of films per category.

select
    c.category_id,
    c.name as category_name,
    COUNT(f.film_id) as film_count
from
    category c
join
    film_category fc on c.category_id = fc.category_id
join
    film f on fc.film_id = f.film_id
group by
    c.category_id, c.name
order by
    film_count desc;
    
 -- 2. Display the first and the last names, as well as the address, of each staff member 
 select
    s.first_name,
    s.last_name,
    a.address
from
    staff s
join
    address a on s.address_id = a.address_id;
    
 -- 3. Display the total amount rung up by each staff member in August 2005
 -- hey, make sure you are joining payment and staff tables, filter with WHERE for rentals on August 2005, group by staff id and sum payment amount, if it doesn't work send me your query

 select
    s.staff_id,
    s.first_name,
    s.last_name,
    SUM(p.amount) as total_amount_rugs
from
    staff s
join
    payment p on s.staff_id = p.staff_id
join
    rental r on p.rental_id = r.rental_id
where
    EXTRACT(year_month from r.rental_date) = 200508
group by
    s.staff_id, s.first_name, s.last_name;
    
-- 4. List all films and the number of actors who are listed for each film.

select
    f.film_id,
    f.title,
    COUNT(fa.actor_id) as actor_count
from
    film f
left join
    film_actor fa on f.film_id = fa.film_id
group by
    f.film_id, f.title
order by
    actor_count desc;
    
 -- 5. Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names.
 
 select
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) as total_amount_paid
from
    customer c
join
    payment p on c.customer_id = p.customer_id
group by
    c.customer_id, c.first_name, c.last_name
order by
    c.last_name, c.first_name;
    


