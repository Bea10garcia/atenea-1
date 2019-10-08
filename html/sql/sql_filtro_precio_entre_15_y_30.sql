SELECT COUNT(v.idvideo) FROM tvideos v
INNER JOIN tcursos c ON c.IdCurso = v.idcurso
WHERE v.idvideo BETWEEN 15 AND 30
ORDER BY v.idvideo  ASC;