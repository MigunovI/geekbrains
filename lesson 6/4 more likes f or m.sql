/*
4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
*/
select
	`profiles`.gender,
    sum((select count(likes.user_id) from likes where likes.user_id = `profiles`.user_id)) as c_likes
from `profiles`
group by `profiles`.gender;