--1 запрос
SELECT k.ФИО_клиента, 
    SUM(p.Общая_стоимость) AS Суммарная_стоимость
FROM Клиенты k
JOIN Прокат p ON k.ID_клиента = p.ID_клиента
GROUP BY k.ФИО_клиента
ORDER BY Суммарная_стоимость DESC;

--Добавим среднюю стоимость
SELECT k.ФИО_клиента, 
    SUM(p.Общая_стоимость) AS Суммарная_стоимость,
    AVG(p.Общая_стоимость) AS Средняя_стоимость
FROM Клиенты k
JOIN Прокат p ON k.ID_клиента = p.ID_клиента
GROUP BY k.ФИО_клиента
ORDER BY Суммарная_стоимость DESC;

--Список клиентов с наибольшей суммой
SELECT 
    k.ФИО_клиента, 
    SUM(p.Общая_стоимость) AS sumamount
FROM Клиенты k
JOIN Прокат p ON k.ID_клиента = p.ID_клиента
GROUP BY k.ФИО_клиента
HAVING 
    SUM(p.Общая_стоимость) = (
        SELECT MAX(sumamount)
        FROM (SELECT SUM(p2.Общая_стоимость) AS sumamount 
            FROM Прокат p2 GROUP BY p2.ID_клиента))
ORDER BY sumamount DESC;

--Список клиентов с наибольшей суммой стоимости Аренды авто
SELECT
    k.ФИО_клиента,
    p.ID_проката,
    p.Общая_стоимость
FROM Клиенты k
JOIN Прокат p ON k.ID_клиента = p.ID_клиента
WHERE 
    k.ID_клиента IN (SELECT ID_клиента
        FROM Прокат GROUP BY ID_клиента
        HAVING SUM(Общая_стоимость) = (SELECT MAX(sumtotal)
                FROM (SELECT SUM(Общая_стоимость) AS sumtotal
                    FROM Прокат
                    GROUP BY ID_клиента)))
ORDER BY p.Общая_стоимость DESC;

--3 часть
SELECT 
    k.ФИО_клиента,
SUM(p.Общая_стоимость) AS Суммарная_стоимость_заказов
FROM Клиенты k
JOIN Прокат p ON k.ID_клиента = p.ID_клиента
GROUP BY k.ID_клиента, k.ФИО_клиента
HAVING SUM(p.Общая_стоимость) > (SELECT AVG(Общая_стоимость) FROM Прокат)
ORDER BY Суммарная_стоимость_заказов DESC;