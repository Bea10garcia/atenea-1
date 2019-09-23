SELECT u.nombre, u.apellidos, r.*
FROM tusuarios u
	INNER JOIN troles r on u.rol = r.idRol
    WHERE u.idUsuario = 10