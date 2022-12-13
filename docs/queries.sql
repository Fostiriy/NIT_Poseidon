-- ЗАПРОСЫ ВЫБОРКИ --

-- 1. Студенты общежития по запросу
SELECT building_code Общежитие,
       client_name   Студент,
       phone_num     Номер_телефона
FROM clientele
         INNER JOIN building b on b.building_id = clientele.building_id
WHERE building_code = $building_code
ORDER BY b.building_id, client_name;

-- 2. Выборка всех записей студента
SELECT client_name, building_code, record_date, record_time, washing_machine_id
FROM clientele
         INNER JOIN building b on b.building_id = clientele.building_id
         INNER JOIN laundry_registry lr on clientele.clientele_id = lr.clientele_id
WHERE client_name = $client_name
ORDER BY record_date, record_time;

-- ЗАПРОСЫ С ГРУППИРОВКОЙ --

-- 1. Количество машинок в каждом общежитии
SELECT building_code             Общежитие,
       count(washing_machine_id) Количество_машинок
FROM washing_machine
         INNER JOIN building b on b.building_id = washing_machine.building_id
GROUP BY b.building_id;

-- 2. Вывести количество записей на каждую машинку за всё время
SELECT washing_machine_id  Стиральная_машина,
       count(clientele_id) Количество_записей
FROM laundry_registry
GROUP BY washing_machine_id;

-- ЗАПРОСЫ С ВЛОЖЕННЫМИ ЗАПРОСАМИ/ТАБЛИЧНЫМИ ВЫРАЖЕНИЯМИ

-- 1. Заполнение журнала записи (см. ниже)

-- 2. Выборка стиральной машины, которой пользуются чаще всего
WITH query(max_records_num) AS (SELECT max(s)
                                FROM (SELECT count(clientele_id) s
                                      FROM laundry_registry
                                      GROUP BY washing_machine_id) q1)
SELECT washing_machine_id, max_records_num
FROM laundry_registry,
     query
GROUP BY washing_machine_id
HAVING count(clientele_id) = max_records_num;


-- ЗАПРОСЫ КОРРЕКТИРОВКИ --

-- 1. Заполнение журнала записи
WITH RECURSIVE generate_series(value) AS (SELECT 0
                                          UNION ALL
                                          SELECT value + 1
                                          FROM generate_series
                                          WHERE value + 1 <= 14)
INSERT
INTO laundry_registry (washing_machine_id, record_date, record_time)
SELECT washing_machine_id,
       date(julianday('now', 'weekday 0', '-6 days'), '+' || value || ' days'),
       record_time
FROM washing_machine,
     generate_series,
     record_range;

-- 2. Добавление поломки стиральной машины
UPDATE crash_registry
SET crash_date = date('now')
WHERE washing_machine_id = $washing_machine_id;
-- + нужно заблокировать записи