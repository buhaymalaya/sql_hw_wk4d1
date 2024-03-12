select *
from actor;

select first_name, last_name from actor;

select first_name, last_name
from actor
where first_name = 'Nick' and last_name = 'Wahlberg';

select first_name, last_name
from actor
where first_name Like 'N%';

select first_name, last_name
from actor
where first_name Like 'N______';

select * from Payment;

select payment_id, amount
from payment
where amount >= 7.99
order by amount; -- sorts the element --

select payment_id, amount
from payment 
where amount < 2.99
order by amount desc; --asc--

select payment_id, amount
from payment
where amount between 2.99 and 7.99
order by amount;

-- syntax of open close bracket <>, not equal to--

select payment_id, amount
from payment 
where amount <> 0.00
order by amount;

--aggregates--
--combines multiple entries by a specific column--
--collapses all entries selected into one--
--ie sum all amounts in payment table--

select sum(amount)
from payment;

--sum each customer's amounts together--

--group by any non aggregated column--

select customer_id, sum(amount) as "customer_total"
from payment
group by customer_id;

-- another aggregate function count() but syntax must start--
-- with non-aggregate column that output is grouped by --

select customer_id, count(customer_id) as "Payments_Made", sum(amount) as "Total_Payments"
from payment
group by customer_id;

--aggregate: average()--

select avg(amount) as "Average_Payment"
from payment;

--min and max()--

select min(amount) from payment where amount > 7.99;

-- filtering by an aggregated column not 'where' but use 'having'--
-- ie get customers that have paid more than 10x --
-- get count of customer_id 
-- must use group by when using aggregated column before 
-- keyword 'having' ('where' is for non-aggregated columns)

select customer_id
from payment
group by customer_id
having count(customer_id) > 10;


-- WEEK 4 DAY 1 HOMEWORK: PADAWANS 141 --


-- 1. How many actors are there with the last name ‘Wahlberg’?

select last_name
from actor
where last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
select payment_id, count(amount) as "Total Payments"
from payment
where amount between 3.99 and 5.99
group by payment_id;

-- 3. What film does the store have the most of? (search in inventory)
select *
from inventory;

select film_id, count(film_id)
from inventory
group by film_id
order by count desc;

-- 4. How many customers have the last name ‘William’?

select *
from customer_list;

select name 
from customer_list
group by name
having name like '%William';


select name 
from customer_list
group by name
having name like '%Williams';

-- 5. What store employee (get the id) sold the most rentals?
select *
from rental;

select staff_id 
from rental
order by inventory_id desc;

-- 6. How many different district names are there?
select district, count(district)
from address
group by district;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
select *
from film_actor;

select film_id
from film_actor
order by film_actor desc;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select last_name, count(last_name)
from customer
group by last_name
having last_name like '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
select *
from rental;

select *
from payment;

select amount, count(rental_id)
from payment
where customer_id between 380 and 430
group by amount
having count(rental_id) > 250;

select amount, count(rental_id)
from payment
where customer_id between 380 and 430
group by amount;


-- 10. Within the film table, how many rating categories are there? 
-- And what rating has the most movies total?

-- will revisit and resubmit; sorry brain is fried!
select *
from film;

select rating, count(rating)
from film;

select film_id, count(rating)
order by film_id;