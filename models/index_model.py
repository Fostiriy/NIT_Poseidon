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
               iif(crash_status = 1, -1, iif(clientele_id IS NULL AND record_date >= :today, 1, 0)) state
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


def get_client_id(conn, phone_num):
    return int(pandas.read_sql('''
                SELECT clientele_id
                FROM clientele
                WHERE phone_num = :phone_num
            ''', conn, params={'phone_num': phone_num}).values[0][0])


def get_password(conn, client_id):
    return pandas.read_sql('''
                SELECT password
                FROM clientele
                WHERE clientele_id = :client_id
            ''', conn, params={'client_id': client_id}).values[0][0]


def is_laundry_registry_empty(conn):
    return pandas.read_sql('''
                    SELECT *
                    FROM laundry_registry
                    WHERE record_date = date(julianday('now'))
                ''', conn).shape[0] == 0


def fill_laundry_registry(conn):
    cur = conn.cursor()

    cur.executescript(f'''
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
                 record_range''')

    return conn.commit()


def is_correct_phone(conn, phone_num):
    return pandas.read_sql('''
                SELECT iif(phone_num = :phone_num, 1, 0)
                FROM clientele
                WHERE phone_num = :phone_num
            ''', conn, params={'phone_num': phone_num}).values[0][0]
