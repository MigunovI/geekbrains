/* 3. (по желанию) Пусть имеется таблица с календарным полем created_at.
 В ней размещены разряженые календарные записи за август 2018 года
 '2018-08-01', '2018-08-04', '2018-08-16' и 2018-08-17. Составьте запрос,
 который выводит полный список дат за август, выставляя в соседнем поле
 значение 1, если дата присутствует в исходном таблице и 0, если она
 отсутствует.
*/


-- Процедура для заполнения таблицы датами.
-- 1-ый параметр - начало периода (дата)
-- 2-ый параметр - конец периода (дата)

USE `sample`;
DROP procedure IF EXISTS `create_date_tb`;
DELIMITER $$
USE `sample`$$
CREATE PROCEDURE `create_date_tb` (in start_date date, in end_date date)
BEGIN
	DECLARE i INT DEFAULT 0;
    DECLARE i_date DATE DEFAULT DATE(NOW());
    set i_date = start_date;
    drop table if exists date_tb;
    create table date_tb (  
		`date` date, 
        primary key (`date`));
    WHILE i_date <= end_date DO  
        SET i = i + 1;
        set i_date = DATE_ADD(start_date, INTERVAL i DAY);
        INSERT INTO date_tb(`date`) VALUES (i_date);
	END WHILE;  
END$$
DELIMITER ;

-- Тестовая таблица с датами для задачи
 drop table if exists sample_tb;
 create table sample_tb (  
		created_at date, 
        primary key (created_at));
 insert into sample_tb values      
        ('2018-08-01'),
        ('2018-08-04'),
        ('2018-08-16'),
        ('2018-08-17');

-- Вызов процедуры заполнения таблицы датами
call create_date_tb('2018-08-01', '2018-08-31');

-- Вывод результата
select
	date_tb.`date`,
	if(sample_tb.created_at is null, 0, 1) as created_at
from date_tb
left join sample_tb on sample_tb.created_at = date_tb.`date`
order by date_tb.`date`;