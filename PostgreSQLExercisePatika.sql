-- ODEV 1 --
/*
film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.
film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.
customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir?
film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.
*/
--1 
SELECT title, description FROM film;

--2
SELECT * FROM film WHERE 60 < length AND length < 75;

--3
SELECT * FROM film WHERE (rental_rate = 0.99 AND (replacement_cost = 12.99 OR replacement_cost = 28.9));
						  
--4
SELECT * FROM film WHERE first_name = 'Mary';
						  
--5
SELECT * FROM film WHERE length != 50 AND (rental_rate != 2.99 OR rental_rate != 4.99);

-- ODEV 2 --
/*
film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit ve 16.99 küçük olma koşuluyla sıralayınız ( BETWEEN - AND yapısını kullanınız.)
.actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya 'Nick' veya 'Ed' değerleri olması koşuluyla sıralayınız. ( IN operatörünü kullanınız.)
film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99, 2.99, 4.99 VE replacement_cost 12.99, 15.99, 28.99 olma koşullarıyla sıralayınız. ( IN operatörünü kullanınız.)
*/
--1
SELECT * FROM film WHERE replacement_cost BETWEEN 12.99 AND 16.99;

--2
SELECT first_name, last_name FROM actor WHERE first_name IN ('Penelope','Nick','Ed');

--3
SELECT * FROM film WHERE rental_rate IN (0.99,2.99,4.99) AND replacement_cost IN (12.99,15.99,28.99);

-- ODEV 3 --
/*
country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.
country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları sıralayınız.
film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sıralayınız.
film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sıralayınız.
*/
--1
SELECT country FROM country WHERE country LIKE 'A%' AND '%a';

--2
SELECT country FROM country WHERE country LIKE '%_____n';

--3
SELECT title FROM film WHERE title ILIKE '%T%T%T%T%';

--4
SELECT * FROM film WHERE title 'C%' AND length > 90 AND rental_rate = 2.99;

-- ODEV 4 --
/*
film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye eşittir?
country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
city tablosundaki şehir isimlerinin kaç tanesi 'R' veya r karakteri ile biter?
*/
--1
SELECT DISTINCT replacement_cost FROM film;

--2
SELECT COUNT(DISTINCT replacement_cost) FROM film;

--3
SELECT COUNT(*) FROM film WHERE title LIKE 'T%' AND rating = 'G';

--4
SELECT COUNT(*) FROM country WHERE country LIKE '_____';

--5
SELECT COUNT(*) FROM city WHERE city ILIKE '%r';  

-- ODEV 5 --
/*
film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.
film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci(6,7,8,9,10) 5 filmi(6,7,8,9,10) sıralayınız.
customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi sıralayınız.
*/
--1
SELECT * FROM film
WHERE title LIKE '%n'
ORDER BY length DESC
LIMIT 5;

--2
SELECT * FROM film
WHERE title LIKE '%n'
ORDER BY length ASC
OFFSET 5
LIMIT 5;

--3
SELECT * FROM customer
WHERE store_id = 1
ORDER BY last_name DESC
LIMIT 4;

-- ODEV 6 --
/*
film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?
film tablosunda bulunan filmlerden kaç tanesi 'C' karakteri ile başlar?
film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?
*/
--1
SELECT AVG(rental_rate) FROM film;

--2
SELECT COUNT(*) FROM film
WHERE title LIKE 'C%';

--3
SELECT MAX(length) FROM film
WHERE rental_rate = 0.99;

--4
SELECT COUNT(DISTINCT replacement_cost) FROM film
WHERE length > 150;

-- ODEV 7 --
/*
film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı 50 den fazla olan replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.
customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir? 
city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra en fazla şehir sayısı barındıran country_id bilgisini ve şehir sayısını paylaşınız.
*/
--1
SELECT rating
FROM film
GROUP BY rating;

--2
SELECT replacement_cost, COUNT(*) 
FROM film
GROUP BY replacement_cost
HAVING COUNT(*) > 50;

--3
SELECT store_id, COUNT(*)
FROM customer
GROUP BY store_id;

--4
SELECT country_id, COUNT(*)
FROM city
GROUP BY country_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- ODEV 8 --
/*
test veritabanınızda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo oluşturalım.
Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.
Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.
*/
--1
CREATE TABLE employee(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    birthday DATE,
    email VARCHAR(100)
);

--2
insert into employee ( name, birthday, email) values ( 'Isabella Gowlett', '04/19/2022', 'igowlett0@reverbnation.com');
insert into employee ( name, birthday, email) values ( 'Zandra Antognoni', '09/11/2022', 'zantognoni1@gizmodo.com');
insert into employee ( name, birthday, email) values ( 'Doro Danilin', '06/28/2022', 'ddanilin2@timesonline.co.uk');
insert into employee ( name, birthday, email) values ( 'Sascha Spry', '05/01/2022', 'sspry3@hexun.com');
insert into employee ( name, birthday, email) values ( 'Broderick Sends', '08/13/2022', 'bsends4@tinypic.com');
insert into employee ( name, birthday, email) values ( 'Dolli Cornuau', '03/26/2022', 'dcornuau5@ucoz.ru');
insert into employee ( name, birthday, email) values ( 'Maurene Follin', '11/03/2022', 'mfollin6@ifeng.com');
insert into employee ( name, birthday, email) values ( 'Goddart Spaducci', '05/19/2022', 'gspaducci7@php.net');
insert into employee ( name, birthday, email) values ( 'Fredek Really', '10/07/2022', 'freally8@freewebs.com');
insert into employee ( name, birthday, email) values ( 'Rex Offell', '01/01/2023', 'roffell9@edublogs.org');
insert into employee ( name, birthday, email) values ( 'Tabbitha Fall', '01/28/2022', 'tfalla@answers.com');
insert into employee ( name, birthday, email) values ( 'Isa Akram', '03/16/2022', 'iakramb@1und1.de');
insert into employee ( name, birthday, email) values ( 'Markos Giabuzzi', '03/28/2022', 'mgiabuzzic@4shared.com');
insert into employee ( name, birthday, email) values ( 'Brooks Audibert', '07/19/2022', 'baudibertd@narod.ru');
insert into employee ( name, birthday, email) values ( 'Nan Beale', '07/12/2022', 'nbealee@com.com');
insert into employee ( name, birthday, email) values ( 'Dunstan Hulcoop', '03/14/2022', 'dhulcoopf@webnode.com');
insert into employee ( name, birthday, email) values ( 'Aurel Scutching', '10/17/2022', 'ascutchingg@independent.co.uk');
insert into employee ( name, birthday, email) values ( 'Andy Lalor', '08/31/2022', 'alalorh@smh.com.au');
insert into employee ( name, birthday, email) values ( 'Russ Ludlom', '11/27/2022', 'rludlomi@spotify.com');
insert into employee ( name, birthday, email) values ( 'Scarlet Domnin', '07/02/2022', 'sdomninj@cisco.com');
insert into employee ( name, birthday, email) values ( 'Culley Haresnape', '07/26/2022', 'charesnapek@jalbum.net');
insert into employee ( name, birthday, email) values ( 'Lotty Wemm', '02/26/2022', 'lwemml@reverbnation.com');
insert into employee ( name, birthday, email) values ( 'Lorine Graeme', '08/23/2022', 'lgraemem@example.com');
insert into employee ( name, birthday, email) values ( 'Monika Millery', '08/05/2022', 'mmilleryn@tamu.edu');
insert into employee ( name, birthday, email) values ( 'Drake Croyden', '08/08/2022', 'dcroydeno@digg.com');
insert into employee ( name, birthday, email) values ( 'Kimberli Opdenorth', '05/02/2022', 'kopdenorthp@icq.com');
insert into employee ( name, birthday, email) values ( 'Valry Tollet', '08/06/2022', 'vtolletq@auda.org.au');
insert into employee ( name, birthday, email) values ( 'Gonzales O''Corr', '05/23/2022', 'gocorrr@vinaora.com');
insert into employee ( name, birthday, email) values ( 'Sheryl Arnauduc', '03/23/2022', 'sarnauducs@networksolutions.com');
insert into employee ( name, birthday, email) values ( 'Randolf McIlmorow', '07/30/2022', 'rmcilmorowt@linkedin.com');
insert into employee ( name, birthday, email) values ( 'Richard Vanyard', '05/25/2022', 'rvanyardu@imgur.com');
insert into employee ( name, birthday, email) values ( 'Bridget Nesey', '01/06/2023', 'bneseyv@artisteer.com');
insert into employee ( name, birthday, email) values ( 'Catrina Lehrahan', '11/04/2022', 'clehrahanw@marriott.com');
insert into employee ( name, birthday, email) values ( 'Jaquenette Ricker', '05/20/2022', 'jrickerx@tinypic.com');
insert into employee ( name, birthday, email) values ( 'Jacinta Coveny', '04/20/2022', 'jcovenyy@foxnews.com');
insert into employee ( name, birthday, email) values ( 'Duncan Yekel', '08/18/2022', 'dyekelz@rambler.ru');
insert into employee ( name, birthday, email) values ( 'Matthias Adaway', '09/05/2022', 'madaway10@narod.ru');
insert into employee ( name, birthday, email) values ( 'Ailyn Fice', '11/29/2022', 'afice11@ca.gov');
insert into employee ( name, birthday, email) values ( 'Mellisent Castellini', '01/04/2023', 'mcastellini12@blogger.com');
insert into employee ( name, birthday, email) values ( 'Donetta Kippie', '10/22/2022', 'dkippie13@mozilla.org');
insert into employee ( name, birthday, email) values ( 'Thorpe Spavins', '08/30/2022', 'tspavins14@dion.ne.jp');
insert into employee ( name, birthday, email) values ( 'Cosimo Massot', '06/03/2022', 'cmassot15@goo.gl');
insert into employee ( name, birthday, email) values ( 'Urban Pitkeathley', '02/21/2022', 'upitkeathley16@usa.gov');
insert into employee ( name, birthday, email) values ( 'Adelaida Satterlee', '04/03/2022', 'asatterlee17@cnn.com');
insert into employee ( name, birthday, email) values ( 'Albertina Wennam', '11/20/2022', 'awennam18@comcast.net');
insert into employee ( name, birthday, email) values ( 'Durant Faers', '03/30/2022', 'dfaers19@yelp.com');
insert into employee ( name, birthday, email) values ( 'Dom Concklin', '08/08/2022', 'dconcklin1a@gov.uk');
insert into employee ( name, birthday, email) values ( 'Tucky Harbach', '06/26/2022', 'tharbach1b@photobucket.com');
insert into employee ( name, birthday, email) values ( 'Belinda Gough', '05/20/2022', 'bgough1c@over-blog.com');
insert into employee ( name, birthday, email) values ( 'Teresita Dunsmore', '10/09/2022', 'tdunsmore1d@so-net.ne.jp');

--3
UPDATE employee
SET name = 'Emirhan Bulut' 
WHERE id = 3;

UPDATE employee
SET email = 'emirhanblt9@gmail.com'
WHERE id = 3;

UPDATE employee
SET name = 'Recep Tayyip Erdogan'
WHERE id = 1;

UPDATE employee
SET email = 'rte@gmail.com'
WHERE id = 1;

UPDATE employee
SET birthday = '26/02/1954'
WHERE id = 1;

--4
DELETE employee
WHERE id = 10;

DELETE employee
WHERE id = 6;

DELETE employee
WHERE id = 42;

DELETE employee
WHERE id = 31;

DELETE employee
WHERE id = 16;



