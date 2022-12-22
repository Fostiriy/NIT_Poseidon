import pandas


def get_washing_machine_info(conn):
    return pandas.read_sql('''
        WITH active_machines(washing_machine_id, is_active) AS (SELECT washing_machine_id, 1
                                                                FROM crash_registry
                                                                WHERE crash_date is null)
        SELECT DISTINCT washing_machine_id,
               building_code,
               floor_num,
               iif(is_active = 1, 1, 0)                                                          AS state,
               manufacturer_name || ' ' || model_name                                            AS model,
               date(purchase_date, service_time || ' years')                                     AS service_end_date,
               iif(date(julianday('now')) < date(purchase_date, service_time || ' years'), 1, 0) AS on_service
        FROM washing_machine
                 JOIN building USING (building_id)
                 JOIN manufacturer USING (manufacturer_id)
                 LEFT JOIN active_machines USING (washing_machine_id)
        ORDER BY state, service_end_date
    ''', conn)


def disable_machine(conn, washing_machine_id):
    cur = conn.cursor()

    cur.executescript(f'''
        UPDATE crash_registry
        SET crash_date = date(julianday('now'))
        WHERE washing_machine_id = {washing_machine_id}
    ''')

    return conn.commit()


def activate_machine(conn, washing_machine_id):
    cur = conn.cursor()

    cur.executescript(f'''
        INSERT INTO crash_registry(washing_machine_id, launch_date)
        VALUES ({washing_machine_id}, date(julianday('now')))
    ''')

    return conn.commit()
