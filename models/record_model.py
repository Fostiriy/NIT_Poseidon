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
