# Контрольная работа
***
## Задание
1. Используя команду cat в терминале операционной системы Linux, создать
   два файла Домашние животные (заполнив файл собаками, кошками,
   хомяками) и Вьючные животными заполнив файл Лошадьми, верблюдами и
   ослы), а затем объединить их. Просмотреть содержимое созданного файла.
   Переименовать файл, дав ему новое имя (Друзья человека).

![Задание 1](images/1.png)
***
2. Создать директорию, переместить файл туда.

![Задание 2](images/2.png)
***
3. Подключить дополнительный репозиторий MySQL. Установить любой пакет
   из этого репозитория.

![Задание 3.1](images/3.1.png)
![Задание 3.2](images/3.2.png)
***
4. Установить и удалить deb-пакет с помощью dpkg.

![Задание 4](images/4.png)
***
5. Выложить историю команд в терминале ubuntu

* cat > pets
* cat > packAnimals
* cat pets packAnimals > animals
* cat animals
* mv animals mansFriends

–––

* mkdir farm 
* mv mansFriends farm 
* cd farm 
* ls -al

–––

* sudo wet https://dev.mysql.com/get/mysql-apt-config_0.8.23-1_all.deb
* sudo dpkg -i mysql-apt-config_0.8.23-1_all.deb
* sudo apt-get update
* sudo apt-get install mysql-server

–––

* sudo wet https://download.docker.com/linux/ubuntu/dists/jammy/pool/stable/arm64/docker-ce-cli_20.10.13~3-0~ubuntu-jammy_arm64.deb
* sudo dpkg -i docker-ce-cli_20.10.13~3-0~ubuntu-jammy_arm64.deb.1
* sudo dpkg -r sudo dpkg -r docker-ce
* sudo dpkg -r docker-ce-cli
***
6.  Нарисовать диаграмму, в которой есть класс родительский класс, домашние
    животные и вьючные животные, в составы которых в случае домашних
    животных войдут классы: собаки, кошки, хомяки, а в класс вьючные животные
    войдут: Лошади, верблюды и ослы).

![Задание 6](images/6.png)
[Ссылка на диаграмму с классами](Classes.drawio)
***
7. В подключенном MySQL репозитории создать базу данных “Друзья
   человека”

CREATE DATABASE MansFriends;
![Задание 7](images/7.png)
***
8. Создать таблицы с иерархией из диаграммы в БД

USE MansFriends;\
CREATE TABLE animals\
   (\
   Id INT AUTO_INCREMENT PRIMARY KEY,\
   class_name VARCHAR(20)\
   );

INSERT INTO animals (class_name)\
VALUES ('Домашние'),
-> ('Вьючные');

![Задание 8.1](images/8.1.png)

CREATE TABLE pets\
   (\
   Id INT AUTO_INCREMENT PRIMARY KEY,\
   type VARCHAR (20),\
   class_id INT,\
   FOREIGN KEY (class_id) REFERENCES animals (Id) ON DELETE CASCADE ON UPDATE CASCADE\
   );

INSERT INTO pets (type, class_id)\
VALUES ('Собаки', 1),\
-> ('Кошки', 1),\
-> ('Хомяки', 1);

![Задание 8.2](images/8.2.png)

CREATE TABLE pack_animals\
(\
Id INT AUTO_INCREMENT PRIMARY KEY,\
type VARCHAR (20),\
class_id INT,\
FOREIGN KEY (class_id) REFERENCES animals (Id) ON DELETE CASCADE ON UPDATE CASCADE\
);

INSERT INTO pack_animals (type, class_id)\
VALUES ('Лошади', 1),\
-> ('Верблюды', 1),\
-> ('Ослы', 1);

![Задание 8.3](images/8.3.png)
***
9. Заполнить низкоуровневые таблицы именами(животных), командами
которые они выполняют и датами рождения

CREATE TABLE cats\









