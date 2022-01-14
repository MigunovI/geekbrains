/* 2. Создайте представление, которое выводит название name товарной позиции из
 таблицы products и соответствующее название каталога name из таблицы catalogs.
*/
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `products_category` (`product` , `category`) AS
    SELECT 
        `products`.`name` AS `name`, `catalogs`.`name` AS `name`
    FROM
        (`products`
        LEFT JOIN `catalogs` ON ((`products`.`catalog_id` = `catalogs`.`id`)))