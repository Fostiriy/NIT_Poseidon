import pandas


def get_profile_records(conn, client_id, today):
    return pandas.read_sql('''
        SELECT laundry_registry_id,
               record_date,
               record_time,
               floor_num,
               washing_machine_id,
               iif(:today <= record_date, 1, 0) state
        FROM washing_machine
                 JOIN laundry_registry USING (washing_machine_id)
        WHERE clientele_id = :client_id
        ORDER BY state DESC, record_date DESC, floor_num, washing_machine_id, record_time
         ''', conn, params={'client_id': client_id,
                            'today': today})
