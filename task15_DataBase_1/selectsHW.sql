USE labor_SQL;
SELECT * FROM laptop;

/* 1 БД «Комп. фірма». Знайти виробників ноутбуків. Вивести:
maker, type. Вихідні дані впорядкувати за зростанням за стовпцем maker */

SELECT maker, type FROM product ORDER BY maker ASC;

/* 2 БД «Комп. фірма». Знайти номер моделі, об’єм пам’яті та
розміри екранів ноутбуків, ціна яких перевищує 1000 дол.
Вивести: model, ram, screen, price. Вихідні дані впорядкувати
за зростанням за стовпцем ram та за спаданням за стовпцем price. */

SELECT model, ram, screen FROM laptop WHERE price > 1000 ORDER BY ram ASC, price DESC;

/* 3 БД «Комп. фірма». Знайдіть усі записи таблиці Printer для
кольорових принтерів. Вихідні дані впорядкувати за
спаданням за стовпцем price. */

SELECT * FROM printer WHERE color = 'y' ORDER BY price ASC;

/* 4 БД «Комп. фірма». Знайдіть номер моделі, швидкість та розмір
диску ПК, що мають CD-приводи зі швидкістю '12х' чи '24х' та
ціну меншу 600 дол. Вивести: model, speed, hd, cd, price.
Вихідні дані впорядкувати за спаданням за стовпцем speed. */

SELECT model, speed, hd, cd, price FROM pc WHERE cd = '12x' OR cd = '24x' AND price < 600 ORDER BY speed DESC;

/* 5 БД «Кораблі». Перерахувати назви головних кораблів (з
таблиці Ships). Вивести: name, class. Вихідні дані
впорядкувати за зростанням за стовпцем name. */
USE Ship_SQL;
SELECT name, class FROM ships ORDER BY name ASC; 

/* 6 БД «Комп. фірма». Отримати інформацію про комп’ютери, що
мають частоту процесора не менше 500 МГц та ціну нижче 800
дол. Вихідні дані впорядкувати за спаданням за стовпцем price. */

SELECT * FROM PC WHERE speed >= 500 AND price < 800 ORDER BY price DESC;

/* 7 БД «Комп. фірма». Отримати інформацію про всі принтери,
які не є матричними та коштують менше 300 дол. Вихідні дані
впорядкувати за спаданням за стовпцем type. */

SELECT * FROM printer WHERE type <> 'Matrix' AND price < 300 ORDER BY type DESC;

/* 8 БД «Комп. фірма». Знайти модель та частоту процесора
комп’ютерів, що коштують від 400 до 600 дол. Вивести: model,
speed. Вихідні дані впорядкувати за зростанням за стовпцем
hd. */

SELECT model, speed FROM pc WHERE price BETWEEN 400 AND 600 ORDER BY hd ASC;

/* 9 БД «Комп. фірма». Знайти модель, частоту процесора та об’єм
жорсткого диску для тих комп’ютерів, що комплектуються
накопичувачами 10 або 20 Мб та випускаються виробником
'A'. Вивести: model, speed, hd. Вихідні дані впорядкувати за
зростанням за стовпцем speed. */

SELECT pc.model, pc.speed, pc.hd, product.maker
FROM pc
INNER JOIN product
WHERE pc.hd = 10 AND product.maker = 'A' OR pc.hd = 20 AND product.maker = 'A'
ORDER BY speed ASC;

/* 10 БД «Комп. фірма». Знайдіть номер моделі, швидкість та розмір
жорсткого диску для усіх ноутбуків, екран яких не менше 12
дюймів. Вивести: model, speed, hd, price. Вихідні дані
впорядкувати за спаданням за стовпцем price. */

SELECT model, speed, hd, price FROM laptop WHERE screen >= 12 ORDER BY price DESC;

/* 11 БД «Комп. фірма». Знайдіть номер моделі, тип та ціну для усіх
принтерів, вартість яких менше 300 дол. Вивести: model, type,
price. Вихідні дані впорядкувати за спаданням за стовпцем
type. */

SELECT model, type, price FROM printer WHERE price < 300 ORDER BY type DESC;


/* 12 БД «Комп. фірма». Вивести моделі ноутбуків з кількістю RAM
рівною 64 Мб. Вивести: model, ram, price. Вихідні дані
впорядкувати за зростанням за стовпцем screen. */

SELECT model, ram, price FROM laptop WHERE RAM = 64 ORDER BY screen ASC;

/* 13 БД «Комп. фірма». Вивести моделі ПК з кількістю RAM
більшою за 64 Мб. Вивести: model, ram, price. Вихідні дані
впорядкувати за зростанням за стовпцем hd. */

SELECT model, ram, price FROM pc WHERE RAM = 64 ORDER BY hd ASC;

/* 14. БД «Комп. фірма». Вивести моделі ПК зі швидкістю процесора
у межах від 500 до 750 МГц. Вивести: model, speed, price.
Вихідні дані впорядкувати за спаданням за стовпцем hd. */

SELECT model, speed, price FROM pc WHERE speed BETWEEN 500 AND 750 ORDER BY hd DESC;

/* 15. БД «Фірма прий. вторсировини». Вивести інформацію про
видачу грошей на суму понад 2000 грн. на пунктах прийому
таблиці Outcome_o. Вихідні дані впорядкувати за спаданням за
стовпцем date. */

SELECT * FROM outcome WHERE outcome.out > 2000 ORDER BY date DESC;

/* 16. БД «Фірма прий. вторсировини». Вивести інформацію про
прийом грошей на суму у межах від 5 тис. до 10 тис. грн. на
пунктах прийому таблиці Income_o. Вихідні дані впорядкувати
за зростанням за стовпцем inc. */

SELECT * FROM income_o WHERE inc BETWEEN 5000 AND 10000 ORDER BY inc ASC;

/* 17. БД «Фірма прий. вторсировини». Вивести інформацію про
прийом грошей на пункті прийому No1 таблиці Income. Вихідні
дані впорядкувати за зростанням за стовпцем inc. */

SELECT * FROM income WHERE point = 1 ORDER BY inc ASC;

/* 18. БД «Фірма прий. вторсировини». Вивести інформацію про
видачу грошей на пункті прийому No2 таблиці Outcome.
Вихідні дані впорядкувати за зростанням за стовпцем out. */

SELECT * FROM outcome WHERE point = 2 ORDER BY outcome.out ASC;

/* 19. БД «Кораблі». Вивести інформацію про усі класи кораблів для
країни 'Japan'. Вихідні дані впорядкувати за спаданням за
стовпцем type. */

SELECT class FROM classes WHERE country = 'Japan' ORDER BY type DESC;

/* 20. БД «Кораблі». Знайти всі кораблі, що були спущені на воду у
термін між 1920 та 1942 роками. Вивести: name, launched.
Вихідні дані впорядкувати за спаданням за стовпцем launched. */

SELECT name, launched FROM ships WHERE launched BETWEEN 1920 AND 1942 ORDER BY launched DESC;

/* 21. БД «Кораблі». Вивести усі кораблі, що брали участь у битві
'Guadalcanal' та не були потопленими. Вивести: ship, battle,
result. Вихідні дані впорядкувати за спаданям за стовпцем ship. */

SELECT ship, battle, result FROM outcomes WHERE battle = 'Guadalcanal' AND result <> 'sunk' ORDER BY ship DESC;

/* 22. БД «Кораблі». Вивести усі потоплені кораблі. Вивести: ship,
battle, result. Вихідні дані впорядкувати за спаданням за
стовпцем ship. */

SELECT ship, battle, result FROM outcomes WHERE result = 'sunk' ORDER BY ship DESC;

/* 23. БД «Кораблі». Вивести назви класів кораблів з
водотоннажністю не меншою, аніж 40 тонн. Вивести: class,
displacement. Вихідні дані впорядкувати за зростанням за
стовпцем type. */

SELECT class, displacement FROM classes WHERE displacement >= 40000 ORDER BY type ASC;

/* 24. БД «Аеропорт». Знайдіть номера усіх рейсів, що бувають у
місті 'London'. Вивести: trip_no, town_from, town_to. Вихідні
дані впорядкувати за зростанням за стовпцем time_out. */

SELECT trip_no, town_from, town_to FROM trip WHERE town_from = 'London' ORDER BY time_out ASC;

/*25. БД «Аеропорт». Знайдіть номера усіх рейсів, на яких курсує
літак 'TU-134'. Вивести: trip_no, plane, town_from, town_to.
Вихідні дані впорядкувати за спаданням за стовпцем time_out. */

SELECT trip_no, plane, town_from, town_to FROM trip WHERE plane = 'TU-134' ORDER BY time_out DESC;

/* 26. БД «Аеропорт». Знайдіть номера усіх рейсів, на яких не курсує
літак 'IL-86'. Вивести: trip_no, plane, town_from, town_to. Вихідні
дані впорядкувати за зростанням за стовпцем plane. */

SELECT trip_no, plane, town_from, town_to FROM trip WHERE plane <> 'IL-86' ORDER BY plane ASC;

/* 27. БД «Аеропорт». Знайдіть номера усіх рейсів, що не бувають у
місті 'Rostov'. Вивести: trip_no, town_from, town_to. Вихідні дані
впорядкувати за зростанням за стовпцем plane. */

SELECT trip_no, town_from, town_to FROM trip WHERE town_from <> 'Rostov' AND town_to <> 'Rostov' ORDER BY plane ASC;

-- 2. (вибірка з одної таблиці з простою умовою)

/* 1. БД «Комп. фірма». Вивести усі моделі ПК, у номерах яких є
хоча б дві одинички. */

SELECT * FROM pc WHERE model LIKE "%1%1%";

/* 2. БД «Фірма прий. вторсировини». З таблиці Outcome вивести
усю інформацію за березень місяць. */

SELECT * FROM outcome WHERE MONTH(date) = 3;

/* 3. БД «Фірма прий. вторсировини». З таблиці Outcome_o вивести
усю інформацію за 14 число будь-якого місяця. */

SELECT * FROM outcome_o WHERE DAY(date) = 14;

/* 4. БД «Кораблі». З таблиці Ships вивести назви кораблів, що
починаються на 'W' та закінчуються літерою 'n'. */

SELECT * FROM ships WHERE name LIKE 'w%' AND name LIKE '%n';

/* 5. БД «Кораблі». З таблиці Ships вивести назви кораблів, що
мають у своїй назві дві літери 'e'. */

SELECT * FROM ships WHERE name LIKE '%n%n%';

/* 6. БД «Кораблі». З таблиці Ships вивести назви кораблів та роки
їх спуску на воду, назва яких не закінчується на літеру 'a'. */

SELECT name, launched FROM ships WHERE name NOT LIKE '%a';

/* 7. БД «Кораблі». Вивести назви битв, які складаються з двох слів
та друге слово не закінчується на літеру 'c'. */

SELECT battle FROM outcomes WHERE battle LIKE '% %' AND battle NOT LIKE '% %e';

/* 8. БД «Аеропорт». З таблиці Trip вивести інформацію про рейси,
що вилітають в інтервалі часу між 12 та 17 годинами включно. */

SELECT * FROM trip WHERE HOUR(time_out) BETWEEN 12 AND 17;

/* 9. БД «Аеропорт». З таблиці Trip вивести інформацію про рейси,
що прилітають в інтервалі часу між 17 та 23 годинами
включно. */

SELECT * FROM trip WHERE HOUR(time_in) BETWEEN 17 AND 23;

/* 10. БД «Аеропорт». З таблиці Pass_in_trip вивести дати, коли були
зайняті місця у першому ряду. */

SELECT date FROM Pass_in_trip WHERE place LIKE '1%';

/* 11. БД «Аеропорт». З таблиці Pass_in_trip вивести дати, коли були
зайняті місця 'c' у будь-якому ряді. */

SELECT date FROM Pass_in_trip WHERE place LIKE '%c';

/* 12. БД «Аеропорт». Вивести прізвища пасажирів (друге слово у
стовпці name), що починаються на літеру 'С'. */

SELECT name FROM Passenger WHERE name LIKE '% C%';

/* 13. БД «Аеропорт». Вивести прізвища пасажирів (друге слово у
стовпці name), що не починаються на літеру 'J'. */

SELECT name FROM Passenger WHERE name NOT LIKE '% J%';

-- 3. (Вибірка з 2х таблиць з простою умовою)

/* 1. БД «Комп. фірма». Вкажіть виробника для тих ПК, що мають
жорсткий диск об’ємом не більше 8 Гбайт. Вивести: maker,
type, speed, hd. */

SELECT product.maker, pc.model, pc.speed, pc.hd FROM pc INNER JOIN product ON hd <= 8;

/* 2. БД «Комп. фірма». Знайдіть виробників ПК з процесором не
менше 600 МГц. Вивести: maker. */

SELECT DISTINCT product.maker FROM product INNER JOIN pc ON speed >= 600;

/* 3. БД «Комп. фірма». Знайдіть виробників ноутбуків з
процесором не вище 500 МГц. Вивести: maker. */

SELECT DISTINCT product.maker FROM product INNER JOIN laptop on speed <= 500;

/* 4. БД «Комп. фірма». Знайдіть пари моделей ноутбуків, що
мають однакові об’єми жорстких дисків та RAM (таблиця
Laptop). У результаті кожна пара виводиться лише один раз.
Порядок виведення: модель з більшим номером, модель з
меншим номером, об’єм диску та RAM. */

SELECT * FROM laptop AS l1
JOIN laptop AS l2 ON l1.code != l2.code
WHERE l1.ram = l2.ram AND l1.hd = l2.hd
ORDER BY l1.model DESC, l1.hd, l1.ram;

/* 4. БД «Комп. фірма». Знайдіть пари моделей ноутбуків, що
мають однакові об’єми жорстких дисків та RAM (таблиця
Laptop). У результаті кожна пара виводиться лише один раз.
Порядок виведення: модель з більшим номером, модель з
меншим номером, об’єм диску та RAM. */

SELECT a.model AS model1, b.model AS model2, a.hd, a.ram
FROM laptop AS a, laptop AS b
WHERE a.model <> b.model
AND a.hd = b.hd
AND a.ram = b.ram
ORDER BY a.model DESC;

/* 5. БД «Кораблі». Знайдіть країни, що мали класи як звичайних
бойових кораблів 'bb', так і класи крейсерів 'bc'. Вивести:
country, типи з класом 'bb', типи з класом 'bc'. */

SELECT a.country, a.type AS type_bc, b.type AS type_bb
FROM classes AS a, classes AS b
WHERE a.country = b.country AND a.type = 'bc' AND b.type = 'bb';

/* 6. БД «Комп. фірма». Знайдіть номер моделі та виробника ПК,
яка має ціну менше за 600 дол. Вивести: model, maker. */

SELECT DISTINCT pc.model, product.maker
FROM pc
NATURAL JOIN product
WHERE pc.price < 600;

/* 7. БД «Комп. фірма». Знайдіть номер моделі та виробника
прінтера, яка має ціну вищу за 300 дол. Вивести: model, maker. */

SELECT printer.model, product.maker
FROM printer
INNER JOIN product ON (printer.model = product.model)
WHERE printer.price > 300;

/* 8. БД «Комп. фірма». Виведіть виробника, номер моделі та ціну
кожного комп’ютера, що є у БД. Вивести: maker, model, price. */

SELECT product.maker, pc.model AS PC_Model, pc.price AS PC_Price, laptop.model AS Laptop_Model, laptop.price AS Laptop_Price
FROM Product INNER JOIN pc, laptop;

/* 9. БД «Комп. фірма». Виведіть усі можливі моделі ПК, їх
виробників та ціну (якщо вона вказана). Вивести: maker,
model, price. */

SELECT product.maker, pc.model, pc.price
FROM pc INNER JOIN product ON(product.model = pc.model)
WHERE pc.price IS NOT NULL;

/* 10. БД «Комп. фірма». Виведіть виробника, тип, модель та частоту
процесора для ноутбуків, частота процесорів яких перевищує
600 МГц. Вивести: maker, type, model, speed. */

SELECT Product.maker, Product.type, Laptop.model, Laptop.speed
FROM Product INNER JOIN Laptop ON(Product.model = Laptop.model)
WHERE Laptop.speed > 600;

/* 11. БД «Кораблі». Для кораблів таблиці Ships вивести їх
водотоннажність. */

SELECT ships.*, classes.displacement
FROM ships
NATURAL JOIN classes;

/* 12. БД «Кораблі». Для кораблів, що вціліли у битвах, вивести
назви та дати битв, у яких вони брали участь. */

SELECT battles.name, battles.date FROM battles
INNER JOIN outcomes ON (outcomes.battle = battles.name)
WHERE outcomes.result = 'OK';

/* 13. БД «Кораблі». Для кораблів таблиці Ships вивести країни,
яким вони належать. */

SELECT ships.name, classes.country FROM classes NATURAL JOIN ships GROUP BY ships.name; 

/* 14. БД «Аеропорт». Для рейсових літаків 'Boeing' вказати назви
компаній, яким вони належать. */

SELECT trip.plane, company.name AS Comapany_Name FROM trip INNER JOIN company ON (trip.id_comp = company.id_comp) WHERE trip.plane = 'Boeing';

/* 15. БД «Аеропорт». Для пасажирів таблиці Passenger вивести
дати, коли вони користувалися послугами авіаліній. */

SELECT passenger.name, pass_in_trip.date FROM passenger NATURAL JOIN pass_in_trip;
















