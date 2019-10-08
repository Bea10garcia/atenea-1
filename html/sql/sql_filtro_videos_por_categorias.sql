SELECT c.titulo,c.imagen FROM tcursos c
INNER JOIN tvideos v ON c.IdCurso = v.idcurso
	INNER JOIN tcategorias cat ON cat.idtcategorias = c.categoria
WHERE cat.idtcategorias = 1;