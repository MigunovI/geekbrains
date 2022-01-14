/*
1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости
от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00
— "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
*/

USE `shop`;
DROP procedure IF EXISTS `hello`;

DELIMITER $$
USE `shop`$$
CREATE PROCEDURE `hello` ()
BEGIN
	IF(DATE_FORMAT(NOW(), "%H") < 6) THEN
		SELECT 'Доброй ночи';
    ELSEIF(DATE_FORMAT(NOW(), "%H") < 12) THEN
    	SELECT 'Доброе утро' AS hello;
    ELSEIF(DATE_FORMAT(NOW(), "%H") < 18) THEN
    	SELECT 'Добрый день' AS hello;
	ELSE
		SELECT 'Доброй ночи' AS hello;
	END IF;

END$$

DELIMITER ;