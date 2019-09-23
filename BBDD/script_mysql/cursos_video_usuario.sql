SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
/*PROBARLO DE LA FORMA MAS LARGA TABLA POR TABLA
SELECT  f.title, c.first_name, c.last_name, r.inventory_id, c.customer_id, r.customer_id
FROM customer c, rental r, film f, inventory i 
WHERE (c.customer_id=r.customer_id) AND (r.inventory_id=i.inventory_id) AND (i.film_id= f.film_id)
order by c.customer_id
*/
/*CON INNER JOIN*/
SELECT  v.*
FROM tvideos v
INNER JOIN tusers_has_tcourses uc on v.idvideo = uc.tcursos_IdCurso
	WHERE v.idcurso = 1 AND idvideo = uc.idUltimoVideo AND uc.tusuarios_idUsuario= 4 ;

