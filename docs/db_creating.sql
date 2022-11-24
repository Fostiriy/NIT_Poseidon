DROP TABLE IF EXISTS building;

CREATE TABLE IF NOT EXISTS building (
building_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
building_code TEXT NOT NULL UNIQUE,
floors_num INTEGER NOT NULL);


DROP TABLE IF EXISTS clientele;

CREATE TABLE IF NOT EXISTS clientele (
clientele_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
building_id INTEGER NOT NULL,
phone_num INTEGER NOT NULL,
client_name TEXT NOT NULL,
password TEXT NOT NULL,
FOREIGN KEY (building_id) REFERENCES building (building_id) ON DELETE RESTRICT ON UPDATE CASCADE);


DROP TABLE IF EXISTS manufacturer;

CREATE TABLE IF NOT EXISTS manufacturer (
manufacturer_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
manufacturer_name TEXT NOT NULL);


DROP TABLE IF EXISTS washing_machine;

CREATE TABLE IF NOT EXISTS washing_machine (
washing_machine_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
manufacturer_id INTEGER NOT NULL,
building_id INTEGER NOT NULL,
floor_num INTEGER NOT NULL,
model_name TEXT NOT NULL,
purchase_date DATETIME NOT NULL,
service_time INTEGER NOT NULL,
FOREIGN KEY (manufacturer_id)
REFERENCES manufacturer (manufacturer_id)
ON DELETE RESTRICT
ON UPDATE CASCADE,
FOREIGN KEY (building_id)
REFERENCES building (building_id)
ON DELETE RESTRICT
ON UPDATE CASCADE);


DROP TABLE IF EXISTS laundry_registry;

CREATE TABLE IF NOT EXISTS laundry_registry (
laundry_registry_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
washing_machine_id INTEGER NOT NULL,
clientele_id INTEGER NULL,
record_date DATE NOT NULL,
record_time TIME NOT NULL,
crash_status TINYINTEGER NOT NULL DEFAULT 0,
FOREIGN KEY (washing_machine_id)
REFERENCES washing_machine (washing_machine_id)
ON DELETE RESTRICT
ON UPDATE RESTRICT,
FOREIGN KEY (clientele_id)
REFERENCES clientele (clientele_id)
ON DELETE RESTRICT
ON UPDATE CASCADE);


DROP TABLE IF EXISTS record_range;

CREATE TABLE IF NOT EXISTS record_range (
record_time TIME NOT NULL PRIMARY KEY);


DROP TABLE IF EXISTS crash_registry;

CREATE TABLE IF NOT EXISTS crash_registry (
crash_registry_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
washing_machine_id INTEGER NOT NULL,
launch_date DATETIME NOT NULL,
crash_date DATETIME NULL,
FOREIGN KEY (washing_machine_id)
REFERENCES washing_machine (washing_machine_id)
ON DELETE RESTRICT
ON UPDATE CASCADE);
