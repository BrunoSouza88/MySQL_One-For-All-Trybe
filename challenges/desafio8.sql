SELECT
    A.artista_nome AS 'artista',
    ALB.album_nome AS 'album'
FROM SpotifyClone.artista AS A
INNER JOIN SpotifyClone.album AS ALB
ON A.artista_id = ALB.artista_id
WHERE A.artista_nome LIKE 'Elis Regina';