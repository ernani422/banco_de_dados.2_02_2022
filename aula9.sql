use sakila;

select 'creating a view ' as 'log';
drop view if exists select_all_actors;

create 
    view select_all_actors
as (
    select
     actor.first_name,
     actor.last_name,
     actor.last_update
    from 
    actor
    where
    actor.firts_name like "C%"
);

select 'using' as 'log';

select * from select_all_actors;

