SELECT 
	  ART.artista_nome AS 'artista',
    ALB.album_nome AS 'album',
    COUNT(UA.artista_id) AS 'pessoas_seguidoras'
FROM SpotifyClone.artista AS ART
INNER JOIN SpotifyClone.album AS ALB
ON ART.artista_id = ALB.artista_id
INNER JOIN SpotifyClone.usuario_artista AS UA
ON UA.artista_id = ART.artista_id
GROUP BY `artista`, `album`
ORDER BY `pessoas_seguidoras` DESC, `artista`, `album`;