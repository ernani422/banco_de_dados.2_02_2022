use sakila;

select
    "specific select on customer table " as "infor";

select
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
from
    customer
limit
    15;

select
    "specific select on customer table " as "infor";

select
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
from
    customer
where
    customer.first_name = 'MARY'
    OR customer.first_name = 'patricia'
limit
    15;

select
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.active
from
    customer
where
    customer.first_name = 'MARY'
    and customer.email = 'wade.DELVALLE@sakilacustomer.org'
limit
    15;

select
    film.title,
    film.first_name,
    f ilm.last_name,
    film.active
from
    customer
where
    customer.first_name = 'MARY'
    OR customer.first_name = 'patricia'
limit
    15;

select
    "specific select of films " as "infor";

select
    film.rating,
    film.title,
    film.description,
    film.length,
    film.language_id,
    film.realese_year
from
    film
where
    (
        film.realese_year > 2000
        and film.realese_year < 2010
    )
    and (
        film.length > 70
        and film.length > 80
    )
    and (
        film.language_id = 1
        or film.language_id = 5
    )
    and (
        film.rating = 'g'
        or film.rating = 'R'
        or film.rating = 'nc-17'
    )
limit
    40;

select
    film.title
from
    film;
/*/com erro daqui para baixo /*/
select
    "specific select of films " as "infor";

select
    film.rating,
    film.title,
    film.description,
    film.length,
    film.language_id,
    film.release_year
from
    film
where
    (
        film.release_year > 2000
        and film.release_year < 2010
    )
    and (
        film.length > 70
        and film.length > 80
    )
    and (film.language_id IN (1, 5))
    and (film.rating IN ('G', 'R', 'NC-17'))
limit
    40;

select
    "specific select of films " as "infor";

select
    film.rating,
    film.title,
    film.description,
    film.length,
    film.language_id,
    film.release_year
from
    film
where
    (
        film.release_year BETWEEN 2000
        and 2010
    )
    and (
        film.length BETWEEN 70
        and 80
    )
    and (
        film.language_id in (
            select
                language_id
            from
                language
            where
                name = 'English'
        ),
(
            select
                language_id
            from
                language
            where
                name = 'Italian'
        )
    ),

    select
    film.rating,
    film.title,
    film.description,
    film.length,
    film.language_id,
    film.release_year
from
    film
where
    (
        film.release_year BETWEEN 2000
        and 2010
    )
    and (
        film.length BETWEEN 70
        and 80
    )
    and (
        film.language_id in (
            select
                language_id
            from
                language
            where
                name = 'English'
        ),
(
            select
                language_id
            from
                language
            where
                name = 'Italian'
        )
    )
    and (film.rating in ('G', 'R', 'NC-17'))
limit
    40;

    select
    film.rating,
    film.title,
    film.description,
    film.length,
    film.language_id,
    film.release_year
from
    film
where
    (
        film.release_year BETWEEN 2000
        and 2010
    )
    and (
        film.length BETWEEN 70
        and 80
    )
    and (
        film.language_id in (
        @french_id, @Englesh_id, @Italian_id))and
        film.rating IN ('G','R','NC-17')
    order BY
        film.language_id
    desc
    limit 40;
