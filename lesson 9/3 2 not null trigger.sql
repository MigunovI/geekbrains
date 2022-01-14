/*
2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное
значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля
были заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/

DROP TRIGGER IF EXISTS `shop`.`products_BEFORE_INSERT`;

DELIMITER $$
USE `shop`$$
CREATE DEFINER = CURRENT_USER TRIGGER `shop`.`products_BEFORE_INSERT` BEFORE INSERT ON `products` FOR EACH ROW
BEGIN
	declare tmp text;
	SET tmp = COALESCE(NEW.name, NEW.description);
	IF tmp IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert canceled, name and description is null';
	END IF;
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS `shop`.`products_BEFORE_UPDATE`;

DELIMITER $$
USE `shop`$$
CREATE DEFINER = CURRENT_USER TRIGGER `shop`.`products_BEFORE_UPDATE` BEFORE UPDATE ON `products` FOR EACH ROW
BEGIN
	declare tmp text;
	SET tmp = COALESCE(NEW.name, NEW.description);
	IF tmp IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'update canceled, name and description is null';
	END IF;
END$$
DELIMITER ;