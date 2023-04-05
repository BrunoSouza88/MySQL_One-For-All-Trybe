SELECT A.artista_nome AS 'artista',
CASE
WHEN COUNT(CF.cancao_id) >= 5 THEN 'A'
 WHEN COUNT(CF.cancao_id) BETWEEN 3 AND 4 THEN 'B'
WHEN COUNT(CF.cancao_id) BETWEEN 1 AND 2 THEN 'C'
WHEN COUNT(CF.cancao_id) = 0 THEN '-'
END AS 'ranking'
FROM SpotifyClone.cancao_favorita AS CF
INNER JOIN SpotifyClone.cancoes AS C
ON CF.cancao_id = C.cancao_id
INNER JOIN SpotifyClone.album AS ALB
ON ALB.album_id = C.album_id
RIGHT JOIN SpotifyClone.artista AS A
ON A.artista_id = ALB.artista_id
GROUP BY `artista` 
ORDER BY COUNT(CF.cancao_id) DESC, A.artista_nome ASC;