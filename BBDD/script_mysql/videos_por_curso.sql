SELECT v.url, v.leccion , c.titulo
FROM tvideos v
INNER JOIN tcursos c on v.idcurso= c.IdCurso
	WHERE v.idcurso= 1;