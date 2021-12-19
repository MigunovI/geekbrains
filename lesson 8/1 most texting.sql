/*
	1.Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека,
    который больше всех общался с выбранным пользователем (написал ему сообщений).
*/

select
	m.to_user_id,
    concat(p2.firstname, ' ', p2.lastname) as user_name,
    m.from_user_id,
    concat(p1.firstname, ' ', p1.lastname) as friend_name,
    count(m.id) as messages_qt
from messages as m
join profiles as p1
on m.from_user_id = p1.user_id
join profiles as p2
on m.from_user_id = p2.user_id
where m.to_user_id = 51
group by m.from_user_id
order by messages_qt desc;