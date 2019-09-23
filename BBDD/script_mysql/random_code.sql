SET SQL_SAFE_UPDATES = 0;
UPDATE tlicencias
SET fecha_inclusion = NOW() - INTERVAL FLOOR(RAND() * 300) DAY;