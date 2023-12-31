
--- Задание №8

USE MansFriends;
CREATE TABLE animals
   (
   Id INT AUTO_INCREMENT PRIMARY KEY,
   class_name VARCHAR(20)
   );

INSERT INTO animals (class_name)
VALUES ('Домашние'),
('Вьючные');


CREATE TABLE pets
   (
   Id INT AUTO_INCREMENT PRIMARY KEY,
   type VARCHAR (20),
   class_id INT,
   FOREIGN KEY (class_id) REFERENCES animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
   );

INSERT INTO pets (type, class_id)
VALUES ('Собаки', 1),
('Кошки', 1),
('Хомяки', 1)


CREATE TABLE pack_animals
   (
   Id INT AUTO_INCREMENT PRIMARY KEY,
   type VARCHAR (20),
   class_id INT,
   FOREIGN KEY (class_id) REFERENCES animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
   );

INSERT INTO pack_animals (type, class_id)
VALUES ('Лошади', 1),
('Верблюды', 1),
('Ослы', 1);


--- Задание №9

CREATE TABLE dogs
    (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birth DATE,
    commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pets (Id) ON DELETE CASCADE ON UPDATE CASCADE
    );

INSERT INTO dogs (name, birth, commands, type_id)
    VALUES ('Тузик', '2009-02-01', 'фас', 1),
    ('Крендель', '2017-01-06', 'лежать', 1),
    ('Бусик', '2022-07-01', 'бросок', 1);


CREATE TABLE cats
    (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birth DATE,
    commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pets (Id) ON DELETE CASCADE ON UPDATE CASCADE
    );

INSERT INTO cats (name, birth, commands, type_id)
    VALUES ('Мурзик', '2020-05-07', 'кушать', 2),
    ('Пушок', '2015-02-01', 'туалет', 2),
    ('Гав', '2012-03-03', 'играть', 2);


CREATE TABLE hamsters
    (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birth DATE,
    commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pets (Id) ON DELETE CASCADE ON UPDATE CASCADE
    );

INSERT INTO hamsters (name, birth, commands, type_id)
    VALUES ('Марина', '2019-10-01', 'кушать', 3),
    ('Коля', '2023-01-01', 'бежать', 3),
    ('Мими', '2010-03-02', 'задние лапы', 3);


CREATE TABLE horses
    (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birth DATE,
    commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pack_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
    );

INSERT INTO horses (name, birth, commands, type_id)
    VALUES ('Гром', '2008-08-03', 'галоп', 1),
    ('Молния', '2021-02-02', 'бег', 1),
    ('Ручеёк', '2020-09-12', 'рысь', 1);


CREATE TABLE camels
    (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birth DATE,
    commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pack_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
    );

INSERT INTO camels (name, birth, commands, type_id)
    VALUES ('Гора', '2001-10-09', 'идти', 2),
    ('Море', '2022-01-05', 'лежать', 2),
    ('Песок', '1999-02-12', 'плеваться', 2);


CREATE TABLE donkeys
    (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20),
    birth DATE,
    commands VARCHAR(50),
    type_id int,
    Foreign KEY (type_id) REFERENCES pack_animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
    );

INSERT INTO donkeys (name, birth, commands, type_id)
    VALUES ('Кики', '2002-11-07', 'бежать', 3),
    ('Куку', '2005-07-07', 'голос', 3),
    ('Коко', '2019-06-11', 'кружиться', 3);


--- Задание №11

CREATE TABLE all_animals AS
SELECT *, 'Собаки' AS type FROM dogs
UNION SELECT *, 'Кошки' AS type FROM cats
UNION SELECT *, 'Хомяки' AS type FROM hamsters
UNION SELECT *, 'Лошади' as type FROM horses
UNION SELECT *, 'Ослы' AS type FROM donkeys;

CREATE TABLE young_animals AS
SELECT name, birth, commands, type, TIMESTAMPDIFF(MONTH, birth, CURDATE()) AS age_in_month
FROM all_animals WHERE birth BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);

SELECT * FROM young_animals;


--- Задание №12

SELECT dg.Id, dg.name, dg.birth, dg.commands, dg.type_id, pt.type, ya.age_in_month
FROM dogs dg
LEFT JOIN young_animals ya ON ya.name = dg.name
LEFT JOIN pets pt ON pt.Id = dg.type_id
UNION
SELECT c.Id, c.name, c.birth, c.commands, c.type_id, pt.type, ya.age_in_month
FROM cats c
LEFT JOIN young_animals ya ON ya.name = c.name
LEFT JOIN pets pt ON pt.Id = c.type_id
UNION
SELECT hm.Id, hm.name, hm.birth, hm.commands, hm.type_id, pt.type, ya.age_in_month
FROM hamsters hm
LEFT JOIN young_animals ya ON ya.name = hm.name
LEFT JOIN pets pt ON pt.Id = hm.type_id
UNION
SELECT h.Id, h.name, h.birth, h.commands, h.type_id, pa.type, ya.age_in_month
FROM horses h
LEFT JOIN young_animals ya ON ya.name = h.name
LEFT JOIN pack_animals pa ON pa.Id = h.type_id
UNION
SELECT d.Id, d.name, d.birth, d.commands, d.type_id, pa.type, ya.age_in_month
FROM donkeys d
LEFT JOIN young_animals ya ON ya.name = d.name
LEFT JOIN pack_animals pa ON pa.Id = d.type_id;




