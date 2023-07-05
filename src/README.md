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

![Задание 8.1](images/8.1.png)

![Задание 8.2](images/8.2.png)

![Задание 8.3](images/8.3.png)

[Реализация задания №8](Animals.sql)
***
9. Заполнить низкоуровневые таблицы именами(животных), командами
которые они выполняют и датами рождения

![Задание 9.1](images/9.1.png)

![Задание 9.2](images/9.2.png)

![Задание 9.3](images/9.3.png)

![Задание 9.4](images/9.4.png)

![Задание 9.5](images/9.5.png)

![Задание 9.6](images/9.6.png)

[Реализация задания №9](Animals.sql)









