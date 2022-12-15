import pandas


def get_building_code(conn, building_id):
    return pandas.read_sql('''
        SELECT building_code
        FROM building
        WHERE building_id = :building_id
    ''', conn, params={'building_id': building_id}).values[0][0]


def get_records(conn, building_id, today, start_date, finish_date):
    return pandas.read_sql('''
        SELECT laundry_registry_id,
               washing_machine_id,
               floor_num,
               record_time,
               record_date,
               clientele_id,
               iif(clientele_id IS NULL
                       AND crash_status = 0
                       AND record_date >= :today, 1, 0) is_free
        FROM washing_machine
                 JOIN laundry_registry USING (washing_machine_id)
        WHERE building_id = :building_id
          AND record_date BETWEEN :start_date AND :finish_date
        ORDER BY floor_num, washing_machine_id, record_time, record_date
         ''', conn, params={'building_id': building_id,
                            'today': today,
                            'start_date': start_date,
                            'finish_date': finish_date})


def book_record(conn, laundry_registry_id, client_id):
    cur = conn.cursor()

    cur.executescript(f'''
    UPDATE laundry_registry
    SET clientele_id = {client_id}
    WHERE laundry_registry_id = {laundry_registry_id}
        ''')

    return conn.commit()


def cancel_record(conn, laundry_registry_id):
    cur = conn.cursor()

    cur.executescript(f'''
        UPDATE laundry_registry
        SET clientele_id = NULL
        WHERE laundry_registry_id = {laundry_registry_id}
            ''')

    return conn.commit()


def get_client_name(conn, client_id):
    return pandas.read_sql('''
            SELECT client_name
            FROM clientele
            WHERE clientele_id = :client_id
        ''', conn, params={'client_id': client_id}).values[0][0]


def get_building_id(conn, client_id):
    return int(pandas.read_sql('''
                SELECT building_id
                FROM clientele
                WHERE clientele_id = :client_id
            ''', conn, params={'client_id': client_id}).values[0][0])
