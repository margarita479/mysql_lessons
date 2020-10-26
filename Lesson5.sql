
1.
Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
create database user;

create database user;

use user;
 
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE users (
 
id serial,
 
name VARCHAR(50) NOT NULL,
 
created_at VARCHAR(50) NULL,
  
updated_at VARCHAR(50) NULL
);
insert into users (name) VALUES
('AZX'),
('Intel core'),
('AMD'),
('MSI');
SET SQL_SAFE_UPDATES = 0;
UPDATE users SET created_at = NOW() where created_at is NULL;
UPDATE users SET updated_at = NOW() where updated_at is NULL;

2.
Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
и в них долгое время помещались значения в формате 20.10.2017 8:10. 
Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

create database friend;

use friend;

CREATE TABLE users (
 id serial,
 name VARCHAR(50) NOT NULL,
 created_at VARCHAR(15) "Время создания строки",
 updated_at VARCHAR(15) "Время обновления строки"
);

SET SQL_SAFE_UPDATES = 0;

UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i');

UPDATE users SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

ALTER TABLE users MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE users MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

3.
В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех записей.
create database shop;

use shop;

create table storehouses_products (

id serial,

value int
 
);

 
insert into storehouses_products (value) VALUES
 
(DEFAULT, '0'),
 
(DEFAULT, '2500'),

(DEFAULT, '0'),
 
(DEFAULT, '30'),
 
(DEFAULT, '500'),
 
 (DEFAULT, '1');
SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN TRUE ELSE FALSE END, value;
4. вычислить средний возраст пользователей
create database birthd;

use birthd;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL
  birthday DATE COMMENT
  );

UPDATE users SET age = TIMESTAMPDIFF(YEAR, birthday_at, NOW());

SELECT AVG(age) FROM users;