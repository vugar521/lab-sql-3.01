-- Activity 1
-- 1.  Drop column picture from staff.
use sakila;

ALTER TABLE staff
DROP COLUMN picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from staff;

select * from customer
where first_name = "TAMMY";  -- finding the customer detail

-- adding the row to staff table
INSERT INTO staff(first_name, last_name, address_id, email, store_id, active, username, last_update) 
VALUES
('TAMMY','SANDERS', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2,1, 'TAMMY', '2006-02-15 04:57:20');

select * from staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
-- select customer_id from sakila.customer
-- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- Use similar method to get inventory_id, film_id, and staff_id.

select * from customer
where first_name="Charlotte"; -- customer = 134 

select * from staff
where first_name = "Mike"; -- and staff_id=1 and store_id=1

select * from rental
where customer_id=134;

select * from film
where title = "Academy Dinosaur";

select * from rental as r
join customer as c on r.customer_id = c.customer_id
where first_name="Charlotte";

select * from rental
where customer_id=134;  -- rental_id =16050  -- -- last update = '2006-02-15 21:30:53' return date: '2006-02-15 21:30:53'

select * from inventory
where film_id =1 and store_id=1;

select * from film_category
where film_id =1; -- category id = 6  -- inverntory_id =1

select * from rental
where rental_id =16050;


-- MAIN QUERY FOR SOLUTION : ADDING NEW ENTRY TO RENTAL TABLE
select * from rental;
-- adding the row to staff table
INSERT INTO rental (rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update) 
VALUES
(16050,'2023-02-15 21:30:53', 1, 134, '2023-02-15 21:30:53', 1 , '2023-02-15 21:30:53');
