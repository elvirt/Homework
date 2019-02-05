use labor_sql;
-- Task #1
-- 1
SELECT maker, type FROM product WHERE product.type = 'Laptop' ORDER BY maker;

-- 2
SELECT model, ram, screen, price FROM laptop WHERE laptop.price > 1000 ORDER BY 2, 4 DESC;

-- 3
SELECT * FROM printer WHERE color = 'y' ORDER BY 5 DESC;

-- 4
SELECT model, speed, hd, cd, price FROM pc WHERE (cd = '12x' OR cd = '24x') AND price < 600;

-- 5
SELECT name, class FROM ships WHERE ships.name = ships.class ORDER BY name;

-- 6
SELECT * FROM pc WHERE speed >= 500 AND price < 800.00 ORDER BY price DESC;

-- 7
SELECT * FROM printer WHERE type <> 'Matrix' AND price < 300 ORDER BY type DESC;

-- 8
SELECT model, speed FROM pc WHERE price BETWEEN 400 AND 600 ORDER BY hd ASC;

-- 9
SELECT model, speed, hd FROM pc, product WHERE hd = 10 OR hd = 20 AND product.maker = 'A' ORDER BY speed ASC;

-- 10
SELECT model, speed, hd, price FROM laptop WHERE NOT (screen<12) ORDER BY price DESC;

-- 11
SELECT model, type, price FROM printer WHERE price <300 ORDER BY type DESC;

-- 12
SELECT model, ram, price FROM laptop WHERE ram=64 ORDER BY screen;

-- 13
SELECT model, ram, price FROM pc WHERE ram>64 ORDER BY hd;

-- 14
SELECT model, speed, price FROM pc WHERE  SPEED >= 500 AND SPEED <= 750 ORDER BY hd;

-- 15
SELECT * FROM outcome_o  WHERE outcome_o.out > 2000  ORDER BY date DESC;

-- 16 
SELECT * FROM income_o WHERE inc BETWEEN 5000 AND 10000 ORDER BY inc;

-- 17
SELECT  * FROM income WHERE point = 1 ORDER BY inc;

-- 18
SELECT outcome.out as o  FROM outcome WHERE point = 2 ORDER BY o;

-- 19
SELECT class FROM classes WHERE country = 'Japan' ORDER BY type DESC;

-- 20
SELECT name, launched FROM ships WHERE launched  BETWEEN 1920 AND 1942 ORDER BY launched DESC;

-- 21 
SELECT ship, battle FROM outcomes WHERE battle= 'Guadalcanal' AND result!= 'sunk' ORDER BY ship DESC;

-- 22
SELECT ship, battle, result FROM outcomes WHERE  result= 'sunk' ORDER BY ship DESC;

-- 23
SELECT class, displacement FROM classes WHERE displacement>=40000 ORDER BY type;

-- 24
SELECT trip_no, town_from, town_to FROM trip WHERE 'London' IN(town_from,town_to);

-- 25
SELECT  trip_no, plane, town_from, town_to FROM trip WHERE plane='TU-134' ORDER BY time_out DESC;

-- 26
SELECT trip_no, plane, town_from, town_to FROM trip WHERE plane!='IL-86' ORDER BY plane;

-- 27
SELECT trip_no, town_from, town_to FROM trip WHERE 'Rostov' NOT IN (town_from,town_to) ORDER BY plane;

-- Task N#2
-- 1
SELECT model FROM pc WHERE model LIKE '.*1.*1.*';
-- 2
SELECT * FROM outcome WHERE date LIKE '%-03-%';
-- 3
SELECT * FROM outcome_o WHERE DAYOFMONTH(date) = 14;
-- 4
SELECT name FROM ships WHERE name LIKE'W%n';
-- 5
SELECT name FROM ships WHERE name LIKE '.*e.*';
-- 6
SELECT name, launched FROM ships WHERE name NOT LIKE '%a';
-- 7
SELECT * FROM outcomes  WHERE  battle REGEXP '(?i)^\\w+\\s\\w*[a-z&&[^c]]$';
-- 8
SELECT * FROM trip WHERE time(time_out) BETWEEN '12:00:00' AND '17:00:00';
-- 9
SELECT * FROM trip WHERE time(time_in) BETWEEN '17:00:00' AND '23:00:00';
-- 10
SELECT date FROM pass_in_trip WHERE place RLIKE '1\\w';
-- 11
SELECT date, place FROM pass_in_trip WHERE place Rlike 'c$';
-- 12
SELECT * FROM passenger WHERE name RLIKE '(?i)\\w+\\s+C\\w';
-- 13
SELECT * FROM passenger WHERE name RLIKE '(?i)\\w+\\s+^J\\w';

-- Task #3
-- 1
SELECT maker, type, speed, hd FROM pc JOIN product AS pr ON pc.model = pr.model WHERE hd <= 8;
-- 2
SELECT maker FROM product AS pr JOIN pc ON pc.model = pr.model WHERE NOT speed < 600;
-- 3
SELECT * FROM product AS pr JOIN laptop ON laptop.model = pr.model WHERE speed <= 500;
-- 4
-- ?????????
-- 5
select * from (SELECT oki.country from labor_sql.classes as oki 
 group by oki.country,oki.type) as c group by c.country having count(c.country)=2;
-- 6
SELECT DISTINCT * FROM laptop l1 JOIN laptop l2 on l1.hd = l2.hd AND l2.ram = l1.ram AND l1.model >= l2.model AND l1.code > l2.code;
-- 7
SELECT pi.model, po.maker FROM printer pi JOIN product po ON  pi.model=po.model WHERE price > 300;
-- 9 
SELECT product.maker, product.model, pc.price  FROM product  JOIN pc ON pc.model = product.model WHERE pc.price IS NOT NULL;
-- 10
SELECT maker, type, l.model, speed, FROM laptop l JOIN product p ON l.model = p.model WHERE speed > 600;
-- 11
SELECT displacement FROM ships s LEFT JOIN classes c ON s.class = c.class;
-- 12
SELECT battle, date FROM outcomes JOIN battles on outcomes.battle = battles.name WHERE result = 'OK'