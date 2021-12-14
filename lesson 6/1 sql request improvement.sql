/*
1. Проанализировать запросы, которые выполнялись на занятии, определить
	возможные корректировки и/или улучшения (JOIN пока не применять).
	SELECT
		media_type_id,
		(SELECT `name` FROM media_types WHERE id = media_type_id) AS media_type,
		COUNT(*)
	FROM media
	GROUP BY media_type_id;
*/
use vk;
select
	media_types.id,
    media_types.`name`,
    (select count(*) from media where media_type_id = media_types.id)
from media_types
group by `name`;