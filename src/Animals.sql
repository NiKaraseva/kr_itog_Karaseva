
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

