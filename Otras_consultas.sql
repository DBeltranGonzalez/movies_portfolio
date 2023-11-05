SELECT
	personas.nombre_artistico AS director,
	plataformas.plataforma AS plataforma,
	COUNT(V.pelicula_id) AS conteo
FROM visualizaciones AS V
JOIN plataformas ON (V.plataforma_id = plataformas.plataforma_id)
JOIN peliculas ON (V.pelicula_id = peliculas.pelicula_id)
JOIN peliculas_personas ON (peliculas.pelicula_id = peliculas_personas.pelicula_id)
JOIN personas ON (peliculas_personas.persona_id = personas.persona_id)
GROUP BY director, plataforma
HAVING COUNT(V.pelicula_id) >= 3
ORDER BY conteo DESC;

SELECT
	plataformas.plataforma AS plataforma,
	ROUND(AVG(peliculas.año_estreno),0) AS promedio_año_estreno
FROM visualizaciones AS V
JOIN plataformas ON (V.plataforma_id = plataformas.plataforma_id)
JOIN peliculas ON (V.pelicula_id = peliculas.pelicula_id)
GROUP BY plataforma
ORDER BY promedio_año_estreno;