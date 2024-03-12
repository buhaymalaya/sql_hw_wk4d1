-- select all (*) from table --

select *
from actor;


select first_name, last_name from actor;

-- where keyword --

select first_name, last_name
from actor
where first_name = 'Nick' and last_name = 'Wahlberg';

-- like keyword, N% means starting with N followed by any letter thereafter --

select first_name, last_name
from actor
where first_name Like 'N%';

-- underscore count must be exact --

select first_name, last_name
from actor
where first_name Like 'N______';

-- select all from table --
select * from Payment;

-- order by: sorts elements --

select payment_id, amount
from payment
where amount >= 7.99
order by amount; -- sorts the element --

-- desc and asc --

select payment_id, amount
from payment 
where amount < 2.99
order by amount desc; --asc--

-- between keyword --
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

-- 1. How many actors are there with the last name ‘Wahlberg’?

-- 2. How many payments were made between $3.99 and $5.99?

-- 3. What film does the store have the most of? (search in inventory)

-- 4. How many customers have the last name ‘William’?

-- 5. What store employee (get the id) sold the most rentals?

-- 6. How many different district names are there?

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?