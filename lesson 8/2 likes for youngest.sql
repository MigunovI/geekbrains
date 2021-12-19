/*
	2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
*/

select
	pr.user_id,
	concat(pr.firstname, " ", pr.lastname) as user_name,
    timestampdiff(Year, birthday, now()) as age,
    count(l_md.id) + count(l_po.id) + count(l_ms.id) as total_likes
from `profiles` as pr
left join (media  as md, likes as l_md) on (md.user_id = pr.user_id and md.id = l_md.media_id)
left join (posts as po, likes as l_po) on (po.user_id = pr.user_id and po.id = l_po.post_id)
left join (messages as ms, likes as l_ms) on (ms.from_user_id = pr.user_id and ms.id = l_ms.message_id)
group by user_name
order by age
limit 10;
