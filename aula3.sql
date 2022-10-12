use sakila;

SET @ID_CUSTOMER_SELECTED = (SELECT
         CUSTOMER.CUSTOMER_ID 
FROM
    CUSTOMER
WHERE
    CUSTOMER.email = 'KIM.CRUZ@sakilacustomer.org');

SELECT @ID_CUSTOMER_SELECTED AS 'ID_CUSTOMER_SELECTED';



SELECT
    COUNT(actor_id)
FROM
    film_actor
where
    film_actor.film_id in (
        SELECT 
            film_id
        from
            inventory
        where
            inventory.inventory_id IN (
             SELECT
                 inventory_id
                    FROM
                        rental
                            where
                                rental.customer_id = (
                            SELECT 
                                 customer_id
                             from
                                 customer
                            where
                            customer.email = 'KIM.CRUZ@sakilacustomer.org'      
                        )
                    )
                );



    SELECT
    CONCAT(ACTOR.FIRST_NAME,'',ACTOR.LAST_NAME)AS ACTOR_NAME
    FROM
        customer
    inner join rental
     on customer.customer_id = rental.customer_id
        inner join inventory
     on rental.inventory_id = inventory.inventory_id
        inner join film
     on inventory.film_id = film.film_id
        inner join film_actor
     on film.film_id = film_actor.film_id
        inner join actor
     on actor.actor_id = film_actor.actor_id
     where
        customer.email ='DOROTHY.TAYLOR@sakilacustomer.org'
        group by actor.actor_id;
        
    



    