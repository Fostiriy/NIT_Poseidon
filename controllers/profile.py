from app import app
from flask import render_template, session
from datetime import datetime
import pytz

from models.profile_model import *
from utils import get_db_connection


@app.route('/profile', methods=['GET'])
def profile():
    conn = get_db_connection()

    today = datetime.now()
    timezone = pytz.timezone('Asia/Vladivostok')
    today = timezone.localize(today)

    profile_records = get_profile_records(conn, session['client_id'], today.strftime('%Y-%m-%d'))

    # выводим форму
    html = render_template('pages/profile.html',
                           building_code=session['building_code'],
                           client_name=session['client_name'],
                           profile_records=profile_records,
                           )
    return html
