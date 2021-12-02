rem Выгрузка из таблицы help_keyword первых 100 строк, отсортированных по help_keyword_id
path "C:\Program Files\MySQL\MySQL Server 8.0\bin\"

mysqldump --opt --where="1 order by help_keyword_id limit 100" mysql help_keyword > dump_help_keywords.sql