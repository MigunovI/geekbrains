/*
5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
*/
select
	concat(`profiles`.firstname, " ", `profiles`.lastname) as name,
    (select count(likes.user_id) from likes where likes.user_id = `profiles`.user_id)
    + (select count(media.user_id) from media where media.user_id = `profiles`.user_id)
    + (select count(messages.from_user_id) from messages where messages.from_user_id = `profiles`.user_id)
    + (select count(posts.user_id) from posts where posts.user_id = `profiles`.user_id) as total_activity
from `profiles`
order by total_activity
limit 10;