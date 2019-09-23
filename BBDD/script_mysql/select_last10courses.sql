SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT idCurso, titulo, precio, categoria, idioma_curso
FROM tcursos
ORDER BY fecha_inclusion DESC
LIMIT 10;