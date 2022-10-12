use sakila;
drop index if exists idx_customer;
create index idx_customer on customer(email);

explain SELECT
  film.title
FROM
    CUSTOMER
inner join rental on
    customer.customer_id = rental.CUSTOMER_ID
inner join inventory on
    inventory.inventory_id = rental.inventory_id
inner join film on
   film.film_id = inventory.film_id
WHERE
    CUSTOMER.email = 'JENNIFER.DAVIS@sakilacustomer.org';

show index from customer;

drop index if exists idx_film_title;
create index idx_film_title on film(title);

explain SELECT
  film.title
FROM
    CUSTOMER
inner join rental on
    customer.customer_id = rental.CUSTOMER_ID
inner join inventory on
    inventory.inventory_id = rental.inventory_id
inner join film on
   film.film_id = inventory.film_id
WHERE
    CUSTOMER.email = 'JENNIFER.DAVIS@sakilacustomer.org';




show index from inventory;
show index from film;
show index from rental;

