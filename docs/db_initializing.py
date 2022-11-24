# Создание и заполнение БД

import sqlite3

# создаем базу данных и устанавливаем соединение с ней
con = sqlite3.connect("../poseidon.sqlite")

# создание таблиц
# открываем файл с дампом базой данных
f_damp = open('db_creating.sql', 'r', encoding='utf-8-sig')
# читаем данные из файла
damp = f_damp.read()
# закрываем файл с дампом
f_damp.close()

# запускаем запросы
con.executescript(damp)
# сохраняем информацию в базе данных
con.commit()


# заполнение таблиц
f_damp = open('db_filling.sql', 'r', encoding='utf-8-sig')
damp = f_damp.read()
f_damp.close()

con.executescript(damp)
con.commit()

# закрываем соединение с базой
con.close()
