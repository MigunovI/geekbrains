/*
	1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
*/
select u.id, u.name, count(*) as order_count
from shop.users as u
join orders as o
on o.user_id = u.id
group by u.id;
