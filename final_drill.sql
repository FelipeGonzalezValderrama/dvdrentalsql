select *from actor a ;
select *from staff s ;
select *from rental r ;
select *from customer c ;
select *from payment p ;
select *from film f ;
--------------------------------
/*consultas:
Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.*/
--insert en customer
insert into customer (store_id,first_name, last_name, email, address_id, active )
values(2,'julian','alvarez','julianAl@sabemail.cl',18,1);
--consulta por registro agregado
SELECT *FROM customer WHERE email = 'julianAl@sabemail.cl';
-- modificamos registro last_name
update customer set last_name = 'martinez' where customer_id= 600;

---------------------------------
--insert en staff con registro duplicado
insert into staff(first_name,last_name,address_id,email,store_id,username )
values('roberto','rojas', 2, 'robertor@sabemail.cl',1,'roro'),
      ('roberto','rojas', 2, 'robertor@sabemail.cl',1,'roro');
     --consulta por registros agregados
SELECT *FROM staff WHERE email = 'robertor@sabemail.cl';
--modificamos registro para agregar password
update staff set password ='8cb2237d0679ca88db6464eac60da96345517691' where staff_id = 3;
--elimina registro duplicado
DELETE FROM staff WHERE staff_id = 5 and email = 'robertor@sabemail.cl';
-------------------------------
--insert actor
insert into actor(first_name,last_name) 
values('chuck','norris');
--consulta por registro agregado
SELECT *FROM actor WHERE last_name= 'norris';
--elimina registro actor
delete from actor where actor_id = 201 and first_name = 'chuck' 
-------------------------------

--Listar todas las “rental” con los datos del “customer” dado un año y mes.
select
	customer.first_name,
	customer.last_name,
	customer.customer_id,
	rental.rental_id,
	rental.rental_date,
	customer.store_id,
	customer.email,
	customer.address_id,
	customer.create_date
from
	rental
join customer on
	rental.customer_id = customer.customer_id
where
	extract(year
from
	r.rental_date) = 2023
	and extract(month
from
	r.rental_date) = 6;
 
--Listar Número, Fecha (payment_date) y Total (amount) de todas las “payment”
SELECT payment_id, payment_date, amount FROM payment;

 --Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0.
select * from film where release_year = 2006 and rental_rate > 4.0;
