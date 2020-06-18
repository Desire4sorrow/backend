-- Задание 1. Создание БД. Зполнение данными из таблицы.

CREATE TABLE PC (
	id INTEGER NOT NULL,
	cpu(MHz) INTEGER NOT NULL,
	memory(Mb) INTEGER NOT NULL,
	hdd(Gb) INTEGER NOT NULL,
	PRIMARY KEY(id AUTOINCREMENT)
);

INSERT INTO PC (cpu(MHz), memory(Mb), hdd(Gb)) VALUES (1600, 2000, 500);
INSERT INTO PC (cpu(MHz), memory(Mb), hdd(Gb)) VALUES (2400, 3000, 800);
INSERT INTO PC (cpu(MHz), memory(Mb), hdd(Gb)) VALUES (3200, 3000, 1200);
INSERT INTO PC (cpu(MHz), memory(Mb), hdd(Gb)) VALUES (2400, 2000, 500);

--1)Тактовые частоты CPU тех компьютеров, у которых объем памяти 3000 Мб

SELECT id, cpu(MHz), memory(Mb) 
FROM PC
WHERE memory(Mb) = 3000;

--2)Минимальный объём жесткого диска, установленного в компьютере на складе.

SELECT MIN(hdd(Gb) 
AS hdd(Gb) 
FROM PC;

--3)Количество компьютеров с минимальным объемом жесткого диска, доступного на складе.

SELECT COUNT(hdd(Gb)) 
AS count_hdd(Gb), hdd(Gb) 
FROM PC
WHERE hdd(Gb) = (SELECT MIN(hdd(Gb)) FROM PC)
GROUP BY hdd(Gb);

--Задание 2. Напишите SQL-запрос, возвращающий все пары (download_count, user_count), 
--удовлетворяющие следующему условию: 
--user_count — общее ненулевое число пользователей, сделавших 
--ровно download_count скачиваний 19 ноября 2010 года.

CREATE TABLE track_downloads ( 
    download_id INTEGER NOT NULL, 
    track_id INTEGER NOT NULL, 
    user_id INTEGER NOT NULL, 
    download_time TIMESTAMP NOT NULL DEFAULT 0,  
    PRIMARY KEY (download_id AUTOINCREMENT) 
); 

--Заполнение таблицы данными.

INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (1, 2, '2010-11-19'),
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (2, 3, '2010-12-19'),
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (3, 4, '2010-10-19'),
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (1, 3, '2010-11-19'),
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (2, 3, '2010-11-19'),
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (3, 1, '2010-11-19'),
INSERT INTO track_downloads (track_id, user_id, download_time) VALUES (4, 5, '2010-11-20');

--SQL-запрос

SELECT download_count, COUNT(user_id) AS user_count
FROM (
    SELECT user_id, COUNT(download_id) AS download_count
    FROM track_downloads
    WHERE DATE(download_time) = '2010-11-19'
    GROUP BY user_id) 
AS downloaded
GROUP BY download_count;

--Задание 3. Опишите разницу типов данных DATETIME и TIMESTAMP

--DATETIME 
--1) Определяет дату, включающую время дня с долями секунды в 24-часовом формате.
--2) Может храниться как строка или число.
--3) Занимает 8 байт в памяти.
--4) Извлекается и выводится в формате 'YYYY-MM-DD HH:MM:SS'
--5) Диапазон даты: с 1 января 1000 года до 31 декабря 9999 года.
--6) Диапазон времени: От 00:00:00 до 23:59:590,997.
--7) Точность в диапазоне от 0,003 до 0,007 секунд.
--8) По длине занимает от 19 до 23 позиций.
--9) Основное преимущество - это точность. 
--10) Минус - величины с более ранними временными значениями, возможно, тоже будут работать, но нет гарантии того, что они будут правильно храниться и отображаться 

--TIMESTAMP
--1) Хранит целое число, равное количеству секунд, прошедших с полуночи 1 января 1970 года по (UTC+0)
--2) Занимает 4 байта
--3) Исключает проблему високосного года.
--4) Значение не может быть пустым по умолчанию.
--5) Чтобы получить значение времени для других часовых поясов, необходимо пользоваться формулами GMT+, что иногда неудобно.

--Задание 4. Создать таблицу студентов(id, name) и курсов (id, name). Студент может посещать несколько курсов. 

CREATE TABLE student (
	id_student	 INTEGER NOT NULL,
	student_name TEXT NOT NULL,
	PRIMARY KEY (id_student AUTOINCREMENT)
);

CREATE TABLE course (
	id_course	INTEGER NOT NULL,
	course_name	TEXT NOT NULL,
	PRIMARY KEY (id_course AUTOINCREMENT)
);

CREATE TABLE student_on_course (
	id_student_on_course	INTEGER NOT NULL,
	id_student	INTEGER NOT NULL,
	id_course	INTEGER NOT NULL,
	FOREIGN KEY(id_student) 
	REFERENCES student(id_student),
	FOREIGN KEY(id_course) 
	REFERENCES course(id_course)
	PRIMARY KEY(id_student_on_course AUTOINCREMENT)
);

INSERT INTO student (student_name) VALUES ('Татьяна');
INSERT INTO student (student_name) VALUES ('Евгений');
INSERT INTO student (student_name) VALUES ('Андрей');
INSERT INTO student (student_name) VALUES ('Артём');
INSERT INTO student (student_name) VALUES ('Руслан');
INSERT INTO student (student_name) VALUES ('Виктор');

INSERT INTO course (course_name) VALUES ('Рисование');
INSERT INTO course (course_name) VALUES ('Иностранный язык');
INSERT INTO course (course_name) VALUES ('Программирование');
INSERT INTO course (course_name) VALUES ('Роботостроение');
INSERT INTO course (course_name) VALUES ('Веб-дизайн');

INSERT INTO student_on_course (id_student, id_course) VALUES (1, 1);
INSERT INTO student_on_course (id_student, id_course) VALUES (2, 1);
INSERT INTO student_on_course (id_student, id_course) VALUES (3, 1);
INSERT INTO student_on_course (id_student, id_course) VALUES (4, 1);
INSERT INTO student_on_course (id_student, id_course) VALUES (5, 1);
INSERT INTO student_on_course (id_student, id_course) VALUES (6, 1);

INSERT INTO student_on_course (id_student, id_course) VALUES (2, 2);
INSERT INTO student_on_course (id_student, id_course) VALUES (3, 2);
INSERT INTO student_on_course (id_student, id_course) VALUES (4, 2);
INSERT INTO student_on_course (id_student, id_course) VALUES (5, 2);

INSERT INTO student_on_course (id_student, id_course) VALUES (1, 3);
INSERT INTO student_on_course (id_student, id_course) VALUES (4, 3);

INSERT INTO student_on_course (id_student, id_course) VALUES (1, 4);

INSERT INTO student_on_course (id_student, id_course) VALUES (2, 5);
INSERT INTO student_on_course (id_student, id_course) VALUES (4, 5);

--1) отобразить количество курсов, на которые ходит более 5 студентов

SELECT COUNT(id_course)
FROM (
	SELECT id_student, id_course FROM student_on_course
	GROUP BY id_course
	HAVING COUNT(student_on_course.id_student) > 5
);

--2) отобразить все курсы, на которые записан определенный студент.

SELECT student.student_name, course.course_name
FROM student_on_course
INNER JOIN student ON student_on_course.id_student = student.id_student
INNER JOIN course ON student_on_course.id_course = course.id_course
ORDER BY student.student_name ASC;

--Задание 5. Может ли значение в столбце(ах), на который наложено ограничение foreign key, равняться null? Приведите пример.

--Да, может, если ключи не имеют заданного значения "NOT NULL".
--В примере получаем отсуствие дерева.

CREATE TABLE tree(
	id_tree	INTEGER
);

CREATE TABLE grass(
	id_grass 	INTEGER,
	id_tree 	INTEGER,
	FOREIGN KEY(id_computer) 
	REFERENCES tree(id_first_table)
	PRIMARY KEY(id_grass AUTOINCREMENT)
);

INSERT INTO tree (id_tree) VALUES (null);
INSERT INTO grass (id_tree) VALUES (null);

--Задание 6. Как удалить повторяющиеся строки с использованием ключевого слова Distinct?
--Приведите пример таблиц с данными и запросы. 

--Синтаксис команды: SELECT DISTINCT column_name FROM table_name.
--column_name -  название столбца, может быть несколько.
--table_name - название таблицы.

CREATE TABLE car(
	id_car	INTEGER NOT NULL,
	name	TEXT NOT NULL,
	colour 	INTEGER NOT NULL,
	PRIMARY KEY(id_car AUTOINCREMENT)
);

INSERT INTO car (name, colour) VALUES ('BMW', 'black');
INSERT INTO car (name, colour) VALUES ('Lada', 'white');
INSERT INTO car (name, colour) VALUES ('Lada', 'green');
INSERT INTO car (name, colour) VALUES ('UAZ', 'black');

--На удаление повторяющегося названия машины. Вернёт BMW, Lada, UAZ.
SELECT DISTINCT name FROM car;

--На удаление повторяющегося цвета машины. Вернёт black, white, green.
SELECT DISTINCT colour FROM car;

--Вернёт все записи
SELECT DISTINCT name, colour FROM car;

--Задание 7. Есть две таблицы:
 --users - таблица с пользователями (users_id, name)
 --orders - таблица с заказами (orders_id, users_id, status)

CREATE TABLE users (
	id_users	INTEGER NOT NULL,
	name	TEXT NOT NULL,
	PRIMARY KEY (id_users AUTOINCREMENT)
);

CREATE TABLE orders (
	id_orders	INTEGER NOT NULL,
	id_users	INTEGER NOT NULL,
	status	INTEGER NOT NULL,
	FOREIGN KEY (id_users) 
	REFERENCES users(id_users),
	PRIMARY KEY (id_orders AUTOINCREMENT)
);

INSERT INTO users (name) VALUES ('Василий');
INSERT INTO users (name) VALUES ('Пётр');
INSERT INTO users (name) VALUES ('Егор');
INSERT INTO users (name) VALUES ('Ярослав');
INSERT INTO users (name) VALUES ('Антон');

INSERT INTO orders (id_users, status) VALUES (1, 0);
INSERT INTO orders (id_users, status) VALUES (2, 0);
INSERT INTO orders (id_users, status) VALUES (2, 0);
INSERT INTO orders (id_users, status) VALUES (3, 0);
INSERT INTO orders (id_users, status) VALUES (3, 0);
INSERT INTO orders (id_users, status) VALUES (3, 0);
INSERT INTO orders (id_users, status) VALUES (3, 0);
INSERT INTO orders (id_users, status) VALUES (4, 0);

INSERT INTO orders (id_users, status) VALUES (1, 1);
INSERT INTO orders (id_users, status) VALUES (1, 1);
INSERT INTO orders (id_users, status) VALUES (2, 1);
INSERT INTO orders (id_users, status) VALUES (2, 1);
INSERT INTO orders (id_users, status) VALUES (2, 1);
INSERT INTO orders (id_users, status) VALUES (2, 1);
INSERT INTO orders (id_users, status) VALUES (2, 1);
INSERT INTO orders (id_users, status) VALUES (2, 1);
INSERT INTO orders (id_users, status) VALUES (5, 1);
INSERT INTO orders (id_users, status) VALUES (5, 1);
INSERT INTO orders (id_users, status) VALUES (5, 1);
INSERT INTO orders (id_users, status) VALUES (5, 1);
INSERT INTO orders (id_users, status) VALUES (5, 1);

--1) Выбор пользователей со статусом 0. Вывод: Василий, Пётр, Егор, Ярослав.
 
SELECT users.id_users, name 
FROM users
JOIN orders ON orders.id_users = users.id_users
GROUP BY orders.id_users
HAVING SUM(orders.status) < 1;

--2) Выбор пользователь, у которых больше 5 записей со статусом 1. Вывод: Пётр.

SELECT users.id_users, name 
FROM users
JOIN orders ON orders.id_users = users.id_users
GROUP BY orders.id_users
HAVING SUM(orders.status) > 5;

--Задание 8.

--WHERE
--1)Используется с операторами SELECT, UPDATE, DELETE.
--2)Cначала выбирает строки, а затем группирует их и вычисляет агрегатные функции (таким образом, она отбирает строки для вычисления агрегатов)
--3)Не содержит агрегатных функций.

--HAVING
--1)Используется с операторами SELECT, GROUP BY.
--2)Oтбирает строки групп после группировки и вычисления агрегатных функций.
--3)Может содержать агрегатные функции.