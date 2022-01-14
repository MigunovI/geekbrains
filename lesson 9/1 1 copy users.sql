/*1. В базе данных shop и sample присутствуют одни и те же таблицы,
 учебной базы данных. Переместите запись id = 1 из таблицы shop.users
 в таблицу sample.users. Используйте транзакции.*/

start transaction;
select * from shop.users where id = 1;
insert into sample.users (id, name)
	select s.id, s.`name`
    from shop.users as s
    where s.id = 1;
select * from sample.users;
commit;