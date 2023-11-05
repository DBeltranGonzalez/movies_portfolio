SELECT visualizacion_id, fecha_visualizacion, nombre_colombia 
FROM visualizaciones 
JOIN peliculas ON (visualizaciones.pelicula_id = peliculas.pelicula_id)
JOIN plataformas ON (visualizaciones.plataforma_id = plataformas.plataforma_id)
WHERE EXTRACT(MONTH FROM fecha_visualizacion) = '03' 
AND plataformas.tipo_visualizacion_id = 2
ORDER BY fecha_visualizacion;

SELECT 
	EXTRACT(MONTH FROM fecha_visualizacion) AS mes,
	TO_CHAR(fecha_visualizacion, 'Month') AS nombre_mes,
	COUNT(pelicula_id) AS conteo
FROM visualizaciones
JOIN plataformas ON (visualizaciones.plataforma_id = plataformas.plataforma_id)
WHERE plataformas.tipo_visualizacion_id = 2
GROUP BY mes, nombre_mes
ORDER BY conteo DESC;

SELECT peliculas.nombre_colombia
FROM peliculas_generos AS pg
	LEFT JOIN peliculas ON pg.pelicula_id = peliculas.pelicula_id
	LEFT JOIN generos ON pg.genero_id = generos.genero_id
WHERE generos.genero = 'BELICO';

SELECT pg.genero_id, generos.genero, COUNT(pg.pelicula_id) AS ppg
FROM peliculas_generos as pg
JOIN generos ON (pg.genero_id = generos.genero_id)
GROUP BY(pg.genero_id), generos.genero
ORDER BY ppg DESC;