DROP TRIGGER IF EXISTS au_crash_registry;
CREATE TRIGGER IF NOT EXISTS au_crash_registry
    AFTER UPDATE
    ON crash_registry
BEGIN
    UPDATE laundry_registry
    SET crash_status = iif(new.crash_date is not null, 1, 0)
    WHERE washing_machine_id = new.washing_machine_id;
END;


DROP TRIGGER IF EXISTS ai_crash_registry;
CREATE TRIGGER IF NOT EXISTS ai_crash_registry
    AFTER INSERT
    ON crash_registry
BEGIN
    UPDATE laundry_registry
    SET crash_status = 0
    WHERE washing_machine_id = new.washing_machine_id
      AND record_date >= new.launch_date;
END;