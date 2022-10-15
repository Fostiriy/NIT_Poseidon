# Создание БД

import sqlite3

# создаем базу данных и устанавливаем соединение с ней
con = sqlite3.connect("poseidon.sqlite")

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

# создаем курсор
cursor = con.cursor()

# закрываем соединение с базой
con.close()
