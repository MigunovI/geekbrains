/*
2. Пусть задан некоторый пользователь. Из всех друзей этого пользователя
	найдите человека, который больше всех общался с нашим пользователем.
*/

set @var_user_id := 61; -- Задаем пользователя, друзей которого проверяем
select
	if(fr.from_user_id = @var_user_id, fr.to_user_id, fr.from_user_id) as friend_id,
    (
		select count(*)
		from messages as msg
		where
			(msg.from_user_id = friend_id and msg.to_user_id = @var_user_id)
			or (msg.to_user_id = friend_id and msg.from_user_id = @var_user_id)
	) as count_of_messages
from
	friendship_requests as fr
where
	(fr.to_user_id = @var_user_id or fr.from_user_id = @var_user_id)
    and fr.`status` = 1
order by
	count_of_messages desc
limit 1;