import sqlite3


def get_db_connection() -> object:
    return sqlite3.connect('poseidon.sqlite')
