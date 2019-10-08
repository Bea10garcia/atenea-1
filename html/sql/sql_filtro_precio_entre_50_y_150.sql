SELECT v.idcurso, url, c.precio FROM tvideos v
INNER JOIN tcursos c ON v.idcurso=c.IdCurso
WHERE c.precio BETWEEN 50 AND 150
ORDER BY c.titulo  ASC;