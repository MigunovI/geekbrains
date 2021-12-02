rem ------------------------------------------
rem Создаем дамп созданной в задании 2 БД 
rem ------------------------------------------
mysqldump example > dump_db_example.sql


rem ------------------------------------------
rem Записываем скрипт по созданию БД sample
rem ------------------------------------------
echo DROP DATABASE IF EXISTS sample; > create_db_sample.sql
echo CREATE DATABASE sample; >> create_db_sample.sql
echo USE sample; >> create_db_sample.sql


rem ------------------------------------------
rem выполняем скрипт создания БД
rem ------------------------------------------
mysql < create_db_sample.sql


rem ------------------------------------------
rem создаем БД sample из дампа
rem ------------------------------------------
mysql --database=sample < dump_db_example.sql