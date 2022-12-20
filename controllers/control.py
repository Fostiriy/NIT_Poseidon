from app import app
from flask import render_template, request

from models.control_model import *
from utils import get_db_connection


@app.route('/control', methods=['GET', 'POST'])
def control():
    conn = get_db_connection()

    washing_machine_info = []
    access = 0

    if request.values.get('disable_machine'):
        washing_machine_id = request.values.get('disable_machine')
        disable_machine(conn, washing_machine_id)

    if request.values.get('activate_machine'):
        washing_machine_id = request.values.get('activate_machine')
        activate_machine(conn, washing_machine_id)

    if request.values.get('password'):
        password = request.values.get('password')
        if password == 'admin':
            access = 1
        washing_machine_info = get_washing_machine_info(conn)

    html = render_template('pages/control.html',
                           washing_machine_info=washing_machine_info,
                           access=access)
    return html
