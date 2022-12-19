from app import app
from flask import render_template, request, session
from datetime import datetime, timedelta
import pytz

from models.index_model import *
from utils import get_db_connection


def get_week_dates(base_date, start_day, end_day=None):
    """
    Return entire week of dates based on given date limited by start_day and end_day.
    If end_day is None, return only start_day.

    >>> from datetime import date
    >>> get_week_dates(date(2015,1,16), 3, 5)
    [datetime.date(2015, 1, 14), datetime.date(2015, 1, 15), datetime.date(2015, 1, 16)]

    >>> get_week_dates(date(2015,1,15), 2, 5)
    [datetime.date(2015, 1, 13), datetime.date(2015, 1, 14), datetime.date(2015, 1, 15), datetime.date(2015, 1, 16)]
    """
    monday = base_date - timedelta(days=base_date.isoweekday() - 1)
    week_dates = [monday + timedelta(days=i) for i in range(7)]
    return week_dates[start_day - 1:end_day or start_day]


@app.route('/', methods=['GET', 'POST'])
def index():
    conn = get_db_connection()

    today = datetime.now()
    timezone = pytz.timezone('Asia/Vladivostok')
    today = timezone.localize(today)
    week_days = get_week_dates(today, 1, 7)

    session['client_id'] = 3
    building_id = get_building_id(conn, session['client_id'])
    session['building_code'] = get_building_code(conn, building_id)

    client_name = get_client_name(conn, session['client_id'])
    session['client_name'] = client_name

    if request.values.get('record_cell_to_delete'):
        cancel_record_cell = request.values.get('record_cell_to_delete')
        cancel_record(conn, cancel_record_cell)

    record_cells = request.values.getlist('record_cell')
    for record_cell in record_cells:
        book_record(conn, record_cell, session['client_id'])

    records = get_records(conn,
                          building_id,
                          today.strftime('%Y-%m-%d'),
                          week_days[0].strftime('%Y-%m-%d'),
                          week_days[6].strftime('%Y-%m-%d'))
    floor_machines = records.groupby(['floor_num', 'washing_machine_id']).groups.keys()
    machine_records = {}
    for floor_machine in floor_machines:
        machine_records[floor_machine] = (records.groupby(['floor_num', 'washing_machine_id'])
                                          .get_group(floor_machine)
                                          .groupby('record_time')
                                          .groups)

    # выводим форму
    html = render_template('index.html',
                           building_code=session['building_code'],
                           week_days=week_days,
                           client_id=session['client_id'],
                           client_name=session['client_name'],
                           records=records,
                           machine_records=machine_records,
                           )
    return html
