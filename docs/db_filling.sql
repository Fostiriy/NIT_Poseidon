INSERT INTO building (building_code, floors_num)
VALUES ('1.8', 5),
       ('1.9', 5),
       ('1.10', 5),
       ('1.11', 5),
       ('2.1', 5),
       ('2.2', 5),
       ('2.3', 5),
       ('2.4', 5),
       ('2.5', 5),
       ('2.6', 5),
       ('2.7', 5),
       ('6.1', 7),
       ('6.2', 7),
       ('7.1', 7),
       ('7.2', 7),
       ('8.1', 7),
       ('8.2', 7),
       ('9', 10),
       ('10', 10),
       ('11', 10);


INSERT INTO manufacturer (manufacturer_name)
VALUES ('LG'),
       ('Samsung'),
       ('Indesit');


INSERT INTO washing_machine (manufacturer_id, building_id, floor_num, model_name, purchase_date, service_time)
VALUES (1, 7, 1, '_KCpS6Zp', '2018-04-11', 10),
       (2, 13, 1, 'C_WH-9nl', '2017-05-31', 10),
       (1, 16, 2, 'GIOIYOpb', '2018-06-10', 20),
       (1, 16, 5, 'fMUi9RbG', '2016-10-12', 15),
       (3, 1, 5, 'H7Ol-GEg', '2018-11-25', 15),
       (2, 12, 4, 'o2W6Ly2d', '2016-06-16', 10),
       (3, 2, 3, 'upnRoPUJ', '2019-08-03', 5),
       (3, 8, 2, '9VyJH6SZ', '2016-02-04', 15),
       (2, 5, 3, 'Nt244q9c', '2019-02-09', 20),
       (3, 10, 5, 'p0IIn7gJ', '2018-01-19', 20),
       (3, 2, 1, '_elh-Ngz', '2017-02-28', 10),
       (3, 6, 4, 'TGoV1np6', '2018-05-24', 10),
       (2, 10, 5, '19rQ0yG0', '2017-08-22', 20),
       (1, 3, 2, 'N3xdEO0o', '2019-03-23', 10),
       (2, 2, 2, 'EMkcAJZ4', '2019-07-10', 20),
       (3, 1, 4, 'm7QdXjVw', '2018-12-29', 20),
       (2, 12, 1, '91_pcWEJ', '2015-02-17', 5),
       (1, 4, 5, 'Bz8DnQl2', '2019-12-22', 5),
       (3, 6, 2, 'rwbn72t7', '2017-06-13', 10),
       (3, 2, 1, 'bCONUo_F', '2016-10-10', 20),
       (2, 3, 5, 'wQffQ6AU', '2019-11-14', 5),
       (1, 12, 1, 'WLvPex7l', '2019-12-26', 5),
       (3, 4, 1, 'TT0H7Nup', '2017-11-09', 20),
       (1, 18, 5, 'l4NQyOMi', '2019-07-13', 20),
       (2, 18, 3, 'w7ZoXMcY', '2019-08-31', 5),
       (2, 20, 4, 'OfKGxocX', '2017-08-14', 5),
       (1, 5, 1, 'uXDsSwi9', '2017-05-25', 20),
       (3, 1, 4, 'vFvjkRcT', '2017-05-08', 10),
       (3, 7, 2, 'hj-W43j8', '2018-10-14', 5),
       (2, 19, 4, 'iiHi-Ms8', '2018-07-28', 15),
       (2, 12, 1, 'K0JkE6HK', '2018-02-19', 15),
       (1, 16, 1, 'd6oGQ2iJ', '2015-02-28', 10),
       (3, 19, 4, 'LSYfGYet', '2017-04-28', 15),
       (2, 13, 2, 'pYjBM68L', '2017-06-07', 15),
       (1, 3, 1, 't7Qs8osc', '2019-06-13', 20),
       (3, 7, 2, '1lGoAgT5', '2019-05-22', 10),
       (1, 4, 1, 'mnfwkqmP', '2019-05-15', 15),
       (2, 10, 5, 'ICZVYPQ4', '2015-02-12', 10),
       (1, 17, 5, 'Yg05nNT7', '2019-08-03', 5),
       (2, 2, 5, 'WpcoVZoK', '2018-12-02', 15),
       (2, 5, 1, 'Wd-haV9K', '2018-08-08', 10),
       (2, 15, 4, 'EsS5I6BO', '2015-10-25', 5),
       (1, 19, 1, 'R5GV-x6Q', '2015-02-26', 20),
       (1, 5, 4, 'CnO5DZZr', '2015-01-14', 15),
       (2, 1, 4, 'aY69AYpd', '2017-10-03', 5),
       (2, 13, 3, 'cQu0u3V1', '2017-02-14', 15),
       (3, 20, 4, 'qcZCAFn9', '2019-07-26', 20),
       (2, 3, 4, 'kHM35lUE', '2018-02-28', 10),
       (3, 4, 1, 'TGlQMRlW', '2015-02-25', 20),
       (2, 9, 4, 'PO_TMwL-', '2019-05-16', 10);


INSERT INTO crash_registry (washing_machine_id, launch_date)
SELECT washing_machine_id, date('now')
FROM washing_machine;


INSERT INTO clientele (building_id, phone_num, client_name, password)
VALUES (18, 79146466228, 'Николаева Анна Алексеевна', 'TnMTPe8V'),
       (19, 79141071578, 'Фролов Андрей Степанович', 'l3HNt3Kf'),
       (3, 79142905779, 'Белов Даниил Кириллович', 'Kcqf6RFu'),
       (20, 79143817514, 'Мельников Владимир Александрович', 'tJwa4VDu'),
       (7, 79145087379, 'Антонова Анна Ярославовна', 'ZHriLA7V'),
       (11, 79148773452, 'Романов Никита Кириллович', 'p1yygyzh'),
       (17, 79145232021, 'Круглов Александр Михайлович', '9f_qUJ4R'),
       (20, 79141307559, 'Спиридонов Кирилл Викторович', 'Wznmi-N_'),
       (13, 79146880686, 'Ермакова Екатерина Викторовна', 'fd3ZRjMd'),
       (2, 79145379897, 'Рогов Тимофей Андреевич', '30vXTOAn'),
       (4, 79142062275, 'Антонов Константин Александрович', 'nWLJHM0c'),
       (8, 79141616117, 'Беляков Василий Александрович', 'XdQvEYdI'),
       (8, 79140686440, 'Майорова Дарья Артёмовна', '_rADMuQS'),
       (14, 79147806870, 'Тимофеев Матвей Сергеевич', 'YUFp4qnx'),
       (18, 79147620484, 'Терехова Милана Данииловна', 'ZfDBQJ6q'),
       (16, 79144626795, 'Афанасьев Павел Маркович', 'Z9bVScMm'),
       (4, 79146341841, 'Агафонов Степан Никитич', '_6RjArWY'),
       (8, 79142131831, 'Громова Варвара Руслановна', 'I1kijwgj'),
       (15, 79140474210, 'Козлов Сергей Даниилович', 'S2L5AfKr'),
       (2, 79148345393, 'Ефимов Михаил Ярославович', 'TYzaIQM6'),
       (10, 79143701127, 'Федотова Валерия Артёмовна', 'vjaTGM59'),
       (13, 79143152479, 'Максимова Ника Мироновна', 'PxBjkOGY'),
       (12, 79141603801, 'Соколов Юрий Алексеевич', 'NlourrVa'),
       (10, 79144527456, 'Богданов Глеб Андреевич', 'RnQ-3-YL'),
       (5, 79142794979, 'Павлова Алиса Фёдоровна', 'j8yTOB-G'),
       (12, 79148462158, 'Власов Антон Артёмович', 'UmfXNC8F'),
       (3, 79142860877, 'Кулешов Максим Павлович', 'ItySMNR3'),
       (19, 79142907475, 'Муравьев Богдан Ярославович', '2tTCsym1'),
       (16, 79144414108, 'Васильев Артём Александрович', 'tOLGn3d-'),
       (20, 79145436919, 'Зубова Софья Тимофеевна', '4gfIYaOj'),
       (10, 79149628391, 'Петрова Ева Ивановна', 'G4mCx7EH'),
       (5, 79148143890, 'Ковалева Виктория Александровна', 'qhy055R9'),
       (12, 79144186266, 'Глухова Ева Михайловна', 'MpIWygcV'),
       (3, 79140940032, 'Савельев Никита Матвеевич', '6uGy9HUZ'),
       (10, 79149583499, 'Михайлова Мария Адамовна', '_JKquyeN'),
       (5, 79141470374, 'Панова Ника Егоровна', 'u0_HCbnD'),
       (13, 79149241819, 'Блинов Никита Фёдорович', 'Uwc0H9Kb'),
       (4, 79140301732, 'Трошин Тимофей Богданович', 'fX2NS42D'),
       (12, 79148013017, 'Фролова София Романовна', 'yvn68cfn'),
       (2, 79145429267, 'Куприянов Евгений Александрович', 'm5YxQCy9'),
       (18, 79149137327, 'Зорина Виктория Львовна', 'bYojT9h1'),
       (20, 79146854271, 'Карпов Мирон Степанович', '4tt40BcE'),
       (15, 79148349421, 'Смирнов Тимофей Даниилович', 'Rmm7oYPU'),
       (17, 79146389050, 'Тимофеева Ксения Михайловна', 'zw0EASMJ'),
       (2, 79147470754, 'Акимова Кира Григорьевна', 'Wp185StP'),
       (19, 79143075896, 'Давыдова Мирослава Александровна', 'uJnGm8lG'),
       (6, 79143157366, 'Павлов Максим Русланович', 'A_oIJ9ix'),
       (16, 79140590100, 'Львов Тимур Дамирович', '58fOxQjd'),
       (7, 79144791235, 'Козлова Елизавета Львовна', '-ISLgHOD'),
       (14, 79144322398, 'Мельникова Мария Фёдоровна', 'RQOWEEYc'),
       (8, 79140434005, 'Иванов Давид Андреевич', 'CBJKyILR'),
       (11, 79145426525, 'Давыдова София Александровна', 'wD12FLMQ'),
       (20, 79149411878, 'Сидорова Ясмина Львовна', 'FydIOoCq'),
       (3, 79140043939, 'Романова Ева Максимовна', 'dkZhOYBO'),
       (11, 79147347399, 'Кириллова София Глебовна', 'sQZ9p5wl'),
       (5, 79144159309, 'Егорова Вероника Марковна', 'L_21YZ-B'),
       (9, 79145143826, 'Васильев Илья Дмитриевич', 'Krw0nY9Y'),
       (3, 79143022322, 'Васильева Мирослава Николаевна', 'J4wiSsJH'),
       (4, 79145688587, 'Корнеева Ирина Михайловна', 'ibAL40lA'),
       (5, 79149302495, 'Лазарев Вадим Иванович', 'O2EUjA6t'),
       (15, 79141030399, 'Лыков Артём Сергеевич', 'FPhmORu4'),
       (2, 79149183314, 'Гордеева Евдокия Максимовна', 'LErxQlXU'),
       (15, 79147373153, 'Ефремов Артём Кириллович', 'V-79sZHf'),
       (13, 79148332391, 'Никифоров Иван Александрович', 'SqSNvMqY'),
       (8, 79140453449, 'Тихонова Евангелина Ярославовна', '9dE7Qol0'),
       (17, 79146879928, 'Галкина Александра Александровна', 'hosvBkz8'),
       (12, 79145507048, 'Дьяконов Владислав Романович', 'uCF5QWgm'),
       (17, 79148112137, 'Еремин Камиль Львович', 'k3GCAkKf'),
       (3, 79147342846, 'Малышева Ксения Максимовна', 'H_o8C0yo'),
       (17, 79142332629, 'Ульянов Дмитрий Эмильевич', 'S5pjrZYB'),
       (14, 79147988367, 'Панова Анна Станиславовна', 'gc_HVY6z'),
       (1, 79148940222, 'Ильин Максим Даниилович', 'WDuqcpPC'),
       (12, 79145623188, 'Носкова Дарья Матвеевна', '-pGtxzxx'),
       (2, 79142268450, 'Зайцева Амелия Артёмовна', 'tIbu5lks'),
       (12, 79144818590, 'Никитина Милана Александровна', '5R5nOXHK'),
       (2, 79148551771, 'Калугин Дмитрий Александрович', 'qs92k4GA'),
       (15, 79144365259, 'Бондарев Павел Давидович', 'eHhC1Nmr'),
       (8, 79147631134, 'Кузнецов Максим Фёдорович', 'BOdMmqzN'),
       (18, 79142548552, 'Назаров Марк Артёмович', 'sAPOqpVg'),
       (2, 79140857560, 'Ковалев Арсений Даниилович', 'J9uscQXY'),
       (20, 79140752257, 'Романова Оливия Львовна', 'xXwjamfO'),
       (15, 79141012368, 'Макаров Даниил Романович', '9tyw8cbD'),
       (7, 79141347870, 'Рудакова Ульяна Дмитриевна', '9s3AuLyn'),
       (18, 79145660260, 'Ткачев Дмитрий Максимович', 'LTKqi9K4'),
       (12, 79144666136, 'Смирнов Алексей Витальевич', 'nM_w8kZ0'),
       (20, 79144758344, 'Пахомова Екатерина Евгеньевна', 'h0gjnHfq'),
       (11, 79148826535, 'Давыдова Анна Андреевна', 'vKqEu04d'),
       (19, 79149212925, 'Устинов Александр Кириллович', 'Pu8LtcIB'),
       (6, 79148109562, 'Михайлов Данил Давидович', '5lzpf-QY'),
       (10, 79143777223, 'Павлов Александр Викторович', '16ao2nYY'),
       (10, 79140676037, 'Федорова Виктория Вадимовна', 'SGi2cEFI'),
       (20, 79145825089, 'Попов Даниил Семёнович', 'tJ-jcPVP'),
       (6, 79140985505, 'Золотова Варвара Кирилловна', 'f0ji04qr'),
       (14, 79148361501, 'Седова Варвара Артёмовна', '8krKSPG1'),
       (7, 79146836207, 'Петрова Софья Алексеевна', 'H-PDcB3B'),
       (5, 79149930829, 'Тихонов Дмитрий Романович', 'kcBq2fAC'),
       (6, 79141736885, 'Руднев Матвей Саввич', 'hI-iPgvd'),
       (11, 79141287293, 'Дорохов Эрик Тимофеевич', 'qT1Xpp15'),
       (8, 79148650738, 'Козлова Дарья Сергеевна', '9Ssvj6a4'),
       (8, 79143271460, 'Фролов Тимофей Артёмович', 'bkT2oEPb');


WITH RECURSIVE generate_series(value) AS (SELECT 0
                                          UNION ALL
                                          SELECT value + 60
                                          FROM generate_series
                                          WHERE value + 60 < 24 * 60)
INSERT
INTO record_range (record_time)
SELECT strftime('%H:%M', time('00:00', '+' || value || ' minutes'))
FROM generate_series;

-- Заполнение журнала записи
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