SELECT COUNT(v.idvideo) FROM tvideos v
INNER JOIN tcursos c ON c.IdCurso = v.idcurso
WHERE v.idvideo < 15
ORDER BY v.idvideo  ASC;