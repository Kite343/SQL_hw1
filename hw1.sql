/* Задача 1
Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными (поля и наполнение см. в презентации)
*/

-- создаём базу данных
DROP DATABASE IF EXISTS home_work_1;
CREATE DATABASE home_work_1;
USE home_work_1;

-- создаем таблице мобильные тулефоны
CREATE TABLE mobil_phone(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	product_name VARCHAR(45) NOT NULL, 
	manufacturer VARCHAR(45) NOT NULL,
    product_count INT NOT NULL,
	price INT
);

-- наполнение
INSERT INTO mobil_phone (product_name, manufacturer, product_count, price)
VALUES 
('iPhoneX', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

SELECT id, product_name, manufacturer, product_count, price
FROM mobil_phone;

/* Задача 2
Выведите название, производителя и цену для товаров, количество которых превышает 2
*/

SELECT id, product_name, manufacturer, product_count, price
FROM mobil_phone
WHERE product_count > 2;

/* Задача 3
Выведите весь ассортимент товаров марки “Samsung”
*/

SELECT id, product_name, manufacturer, product_count, price
FROM mobil_phone
WHERE manufacturer = 'Samsung';

/* Задача 4
(по желанию) С помощью регулярных выражений найти:
Товары, в которых есть упоминание "Iphone"
Товары, в которых есть упоминание"Samsung"
Товары, в которых есть ЦИФРЫ
Товары, в которых есть ЦИФРА "8"
*/

-- Товары, в которых есть упоминание "Iphone"
SELECT id, product_name, manufacturer, product_count, price
FROM mobil_phone
WHERE product_name LIKE '%Iphone%';

-- Товары, в которых есть упоминание"Samsung"
SELECT id, product_name, manufacturer, product_count, price
FROM mobil_phone
WHERE product_name LIKE '%Samsung%' OR manufacturer LIKE '%Samsung%';

-- Товары, в которых есть ЦИФРЫ
/* REGEXP '[[:digit:]]{1,}'=1 где есть 1 и более цифр,
  если написать REGEXP '[[:digit:]]{1,}'=0 то где меньше 1 цифры (нет цифр),
  если написать REGEXP '[[:digit:]]{2,}'=0  то где меньше 2 цифр (в этом случае выведет все кроме 'P20 Pro')
*/
SELECT id, product_name, manufacturer, product_count, price
FROM mobil_phone
WHERE product_name REGEXP '[[:digit:]]{1,}'=1;

-- Товары, в которых есть ЦИФРА "8"
SELECT id, product_name, manufacturer, product_count, price
FROM mobil_phone
WHERE product_name LIKE '%8%';


