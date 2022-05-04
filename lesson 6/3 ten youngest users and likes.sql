/*
3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
*/
------------------------------------------
-- Вариант: Одной строкой вывести сумму --
------------------------------------------
select
	id,
    -- строка для вывода общей суммы
    "total likes" as total,
    -- собираем количество лайков по каждому user_id
    sum((select count(likes.media_id) from likes where likes.media_id in (select media.id from media where media.user_id = users.id))
    + (select count(likes.post_id) from likes where likes.post_id in (select posts.id from posts where posts.user_id = users.id))
	+ (select count(likes.message_id) from likes where likes.message_id in (select messages.id from messages where messages.from_user_id = users.id))) as total_likes
-- использую таблицу users так как profiles используется дальше во вложенном запросе
from users
where users.id in 
-- выбор списка 10 смых молодых пользователей
(select * from (select `profiles`.user_id from `profiles` order by timestampdiff(Year, birthday, now()) limit 10) as user_list)
-- групировка по общему полю
group by total;

------------------------------------------------------
-- Вариант: Вывести сумму лайков по каждому user_id --
------------------------------------------------------
select
	concat(firstname, " ", lastname),
    timestampdiff(Year, birthday, now()) as age,
	(select	count(likes.media_id) from likes where likes.media_id in (select media.id from media where media.user_id = pr.user_id))
    + (select count(likes.post_id) from likes where likes.post_id in (select posts.id from posts where posts.user_id = pr.user_id))
	+ (select count(likes.message_id) from likes where likes.message_id in (select messages.id from messages where messages.from_user_id = pr.user_id)) as total_likes
from `profiles` as pr
order by age
limit 10;