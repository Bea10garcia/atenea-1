SET SQL_SAFE_UPDATES = 0;
UPDATE tlicencias
SET licencia = lpad(conv(floor(rand()*pow(36,6)), 10, 36), 6, 0);