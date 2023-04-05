SELECT 
	  COUNT(DISTINCT C.cancao_id) AS 'cancoes', 
    COUNT(DISTINCT A.artista_id) AS 'artistas',
    COUNT(DISTINCT ALB.album_id) AS 'albuns' 
FROM SpotifyClone.cancoes AS C 
INNER JOIN SpotifyClone.album AS ALB ON C.album_id = ALB.album_id
INNER JOIN SpotifyClone.artista AS A ON ALB.artista_id = A.artista_id;