/*
	2. Выведите список товаров products и разделов catalogs, который соответствует товару.
*/
SELECT p.id, p.name, p.description, p.price, c.name
FROM shop.products as p
join catalogs as c
on catalog_id = c.id;