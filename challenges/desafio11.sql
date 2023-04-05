SELECT ALB.album_nome AS 'album', COUNT(CF.cancao_id) AS 'favoritadas'
FROM SpotifyClone.cancao_favorita AS CF
INNER JOIN SpotifyClone.cancoes AS C
ON CF.cancao_id = C.cancao_id
INNER JOIN SpotifyClone.album AS ALB
ON ALB.album_id = C.album_id
INNER JOIN SpotifyClone.artista AS A
ON A.artista_id = ALB.artista_id
GROUP BY `album` 
ORDER BY `favoritadas` DESC, `favoritadas` LIMIT 3;