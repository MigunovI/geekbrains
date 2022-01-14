/*
3. по желанию) Напишите хранимую функцию для вычисления произвольного
 числа Фибоначчи. Числами Фибоначчи называется последовательность в
 которой число равно сумме двух предыдущих чисел. Вызов функции
 FIBONACCI(10) должен возвращать число 55.
*/

USE `shop`;
DROP function IF EXISTS `fibonacci`;

DELIMITER $$
USE `shop`$$
CREATE FUNCTION `fibonacci` (numb int)
RETURNS INTEGER deterministic
BEGIN
declare result int;
IF numb <= 1
	then
		set result = numb;
    else
		WITH RECURSIVE fibonacci (n, fib_n, next_fib_n) AS
		(
		SELECT 1, 0, 1
		UNION ALL
		SELECT n + 1, next_fib_n, fib_n + next_fib_n
			FROM fibonacci WHERE n < numb
		)
		SELECT next_fib_n into result FROM fibonacci where n = numb;
	end if;
RETURN result;
END$$

DELIMITER ;