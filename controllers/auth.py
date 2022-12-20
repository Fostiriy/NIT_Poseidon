from app import app
from flask import render_template, request, session

from controllers.index import index
from models.index_model import *
from utils import get_db_connection

@app.route('/auth', methods=['GET', 'POST'])
def auth():
    conn = get_db_connection()

    if request.values.get('logout'):
        session.clear()

    if request.values.get('phone'):
        phone = int(request.values.get('phone'))
        password = request.values.get('password')

        print(is_correct_phone(conn, phone))

        if is_correct_phone(conn, phone):
            client_id = get_client_id(conn, phone)
            correct_password = get_password(conn, client_id)
            if password == correct_password:
                session['client_id'] = client_id
                return index()
            else:
                html = render_template('pages/hello.html',
                                       client_name='',
                                       with_modal=True,
                                       phone=phone,
                                       phone_error=False,
                                       password_error=True)
                return html
        else:
            html = render_template('pages/hello.html',
                                   client_name='',
                                   with_modal=True,
                                   phone=phone,
                                   phone_error=True,
                                   password_error=False)
            return html
    return index()