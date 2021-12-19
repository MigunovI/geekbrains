/*
	3. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/
select
	pr.gender,
    count(l.user_id) as total_likes
from `profiles` as pr
join likes as l on l.user_id = pr.user_id
group by pr.gender;