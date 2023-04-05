SELECT
    COUNT(H.cancao_id) AS 'musicas_no_historico'
FROM SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.historico AS H
ON H.usuario_id = U.usuario_id
WHERE U.usuario_nome Like 'Barbara Liskov';