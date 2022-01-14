/* 4. (по желанию) Пусть имеется любая таблица с календарным полем
 created_at. Создайте запрос, который удаляет устаревшие записи из
 таблицы, оставляя только 5 самых свежих записей.
*/

DELIMITER $$
USE `sample`$$
CREATE PROCEDURE `clean_table` ()
BEGIN
	declare rows_count int default 0;
    declare rows_to_delete int default 0;
	SELECT 
		COUNT(*)
	INTO rows_count FROM
		sample.sample_tb;
	if (rows_count > 5)
	then
		set rows_to_delete = rows_count - 5;
		DELETE FROM sample_tb ORDER BY created_at LIMIT ROWS_TO_DELETE;
		SELECT 
			*
		FROM
			sample.sample_tb;
	else
		select 'Нет записей для удаления';
	end if;
END$$

DELIMITER ;

call clean_table();