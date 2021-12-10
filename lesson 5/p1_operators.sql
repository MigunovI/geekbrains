 /*1.	Пусть в таблице users поля created_at и updated_at оказались незаполненными.
		Заполните их текущими датой и временем.*/      

UPDATE users
SET created_at = now()
WHERE created_at IS NULL
LIMIT 1000; -- LIMIT для разового обхода ограничения Safemode

UPDATE users
SET updated_at = now()
WHERE updated_at IS NULL
LIMIT 1000; -- LIMIT для разового обхода ограничения Safemode

/*2.	Таблица users была неудачно спроектирована. Записи created_at и updated_at были
		заданы типом VARCHAR и в них долгое время помещались значения в формате 20.10.2017
		8:10. Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее
		значения.*/

ALTER TABLE `example`.`users` 
ADD COLUMN `created_at_datetime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP AFTER `updated_at_varchar`,
ADD COLUMN `updated_at_datetime` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `created_at_datetime`;

UPDATE users 
SET created_at_datetime = str_to_date(created_at_varchar,'%d.%m.%Y %H:%i'),
	updated_at_datetime = str_to_date(updated_at_varchar,'%d.%m.%Y %H:%i')
WHERE id > 0;

ALTER TABLE `example`.`users` 
DROP COLUMN `updated_at_varchar`,
DROP COLUMN `created_at_varchar`;

/*3.	В таблице складских запасов storehouses_products в поле value могут встречаться
		самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются
		запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в
		порядке увеличения значения value. Однако нулевые запасы должны выводиться в
		конце, после всех записей.*/

SELECT value 
FROM storehouses_products
ORDER BY value = 0, value;

/*4.	Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
		Месяцы заданы в виде списка английских названий (may, august)*/

SELECT 
	name,
    DATE_FORMAT(birthday_at,'%M') AS birthday_month,
    birthday_at
FROM example.users
WHERE DATE_FORMAT(birthday_at,'%M') IN ('August','May');

/*5.	Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs
		WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN*/

SELECT * 
FROM catalogs 
WHERE id IN (5, 1, 2)
ORDER BY FIELD(id, 5, 1, 2);