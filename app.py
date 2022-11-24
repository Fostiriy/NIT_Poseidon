# импорт объекта для создания приложения
from flask import Flask

# создание экземпляра объекта приложения
app = Flask(__name__)

# установим секретный ключ для подписи.
app.secret_key = b'09ufa#dfu&3a\n\xec]/'

import controllers.index

