SELECT C.cancao_nome AS 'cancao', COUNT(H.usuario_id) AS 'reproducoes'
FROM SpotifyClone.historico AS H
INNER JOIN SpotifyClone.cancoes AS C
ON H.cancao_id = C.cancao_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao` ASC LIMIT 2;