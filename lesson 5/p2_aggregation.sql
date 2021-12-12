/* Подсчитайте средний возраст пользователей в таблице users.				 */

SELECT ROUND(AVG(timestampdiff(Year, birthday_at, now())), 2) as age
FROM example.users;

/* Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
 Следует учесть, что необходимы дни недели текущего года, а не года рождения. */

SELECT DAYNAME(DATE_FORMAT(birthday_at,'2021-%m-%d')) as day,
count(id)
FROM users
GROUP BY day;

/* Подсчитайте произведение чисел в столбце таблицы */
SELECT EXP(SUM(LN(id)))
FROM users
WHERE id < 6;
