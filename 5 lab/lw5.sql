--1. �������� ��.
--2. �������� ������.

CREATE TABLE dvd (
	dvd_id	INTEGER NOT NULL,
	title	TEXT NOT NULL,
	production_year	INTEGER NOT NULL,
	PRIMARY KEY(dvd_id AUTOINCREMENT)
);
CREATE TABLE customer (
	customer_id	INTEGER NOT NULL,
	first_name	TEXT NOT NULL,
	last_name	TEXT NOT NULL,
	passport_code	INTEGER NOT NULL,
	registration_date	TEXT NOT NULL,
	PRIMARY KEY(customer_id AUTOINCREMENT)
);
CREATE TABLE offer (
	offer_id	INTEGER NOT NULL,
	dvd_id	INTEGER NOT NULL,
	customer_id	INTEGER NOT NULL,
	offer_date	TEXT NOT NULL,
	return_date	TEXT,
	PRIMARY KEY(offer_id AUTOINCREMENT)
);

--3. SQL ������� ��� ���������� �������.

INSERT INTO dvd (title, production_year) VALUES ('�������', date('2011-03-02'));
INSERT INTO dvd (title, production_year) VALUES ('����: � � ��� ����', date('2008-05-01'));
INSERT INTO dvd (title, production_year) VALUES ('������ ��������', date('2012-01-02'));
INSERT INTO dvd (title, production_year) VALUES ('�������', date('2012-11-01'));
INSERT INTO dvd (title, production_year) VALUES ('�������', date('2012-02-12'));
INSERT INTO dvd (title, production_year) VALUES ('����� ����', date('2010-01-01'));
INSERT INTO dvd (title, production_year) VALUES ('��������� �������', date('2005-11-12'));
INSERT INTO dvd (title, production_year) VALUES ('�����', date('2011-01-01'));
INSERT INTO dvd (title, production_year) VALUES ('������', date('2011-06-05'));

INSERT INTO customer (first_name, last_name, passport_code, registration_date) VALUES ('����', '������', 8810123456, date('2014-08-13'));
INSERT INTO customer (first_name, last_name, passport_code, registration_date) VALUES ('������', '��������', 8806654321, date('2010-11-03'));
INSERT INTO customer (first_name, last_name, passport_code, registration_date) VALUES ('����', '�����', 8811456735, date('2011-10-05')); 
INSERT INTO customer (first_name, last_name, passport_code, registration_date) VALUES ('�������', '��������', 8804178254, date('2009-05-01'));  
INSERT INTO customer (first_name, last_name, passport_code, registration_date) VALUES ('�����', '�������', 8854671230, date('2010-01-30'));    

INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (1, 1, date('2019-03-07'), date('2019-03-13'));
INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (2, 2, date('2020-03-15'), date('2020-04-01'));
INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (1, 3, date('2020-03-01'), date('2020-03-08'));
INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (3, 5, date('2020-02-15'), date('2020-03-20'));
INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (5, 4, date('2020-03-25'), date('2020-04-07'));
INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (3, 1, date('2019-11-25'), date('2019-12-01'));
INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (4, 2, date('2018-10-25'), date('2019-10-29'));
INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (9, 3, date('2020-04-01'), null);
INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (7, 2, date('2020-03-08'), null);
INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (8, 2, date('2020-03-08'), null);
INSERT INTO offer (dvd_id, customer_id, offer_date, return_date) VALUES (6, 4, date('2019-12-01'), null);
               
--4. SQL ������ ������ DVD 2010 ����, ������������� �� ��������.

SELECT * FROM dvd
WHERE production_year = 2010
ORDER BY title;

--5. SQL ������ ������ DVD, ������� ��������� � ��������.

SELECT offer.return_date, dvd.title
FROM offer JOIN dvd ON offer.dvd_id = dvd.dvd_id
WHERE offer.return_date IS NULL;

--6. SQL ������ ������ ��������, ������� � ������� ���� ����� �����.
-- �������� ����� ��������� ����� ���� �����

SELECT customer.customer_id, customer.first_name, customer.last_name
FROM customer
LEFT JOIN offer
ON offer.customer_id = customer.customer_id
LEFT JOIN dvd
ON offer.dvd_id = dvd.dvd_id
WHERE STRFTIME('%Y', offer.offer_date) = STRFTIME('%Y', DATE('now'))