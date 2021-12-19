/*
	3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица
    городов cities (label, name). Поля from, to и label содержат английские названия
    городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.
*/
use sample;
drop table if exists flights;
create table flights (
	id int not null,
	`from` varchar(45) not null,
	`to` varchar(45) not null
);
insert into flights values
	(1, 'moscow', 'omsk'),
    (2, 'novgorod', 'kazan'),
	(3, 'irkutsk', 'moscow'),
    (4, 'omsk', 'irkutsk'),
    (5, 'moscow', 'kazan');
drop table if exists cities;
create table cities (
	label varchar(45) not null,
	name varchar(45) not null
);
insert into cities values
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),
	('omsk', 'Омск');
    
select
	id,
    cf.name,
    ct.name
from flights as f
left join cities as cf
on cf.label = f.`from`
left join cities as ct
on ct.label = f.`to`;