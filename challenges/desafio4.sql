SELECT 
    U.usuario_nome AS 'pessoa_usuaria', 
    IF(MAX(YEAR(H.historico_data)) >= 2021, 'Ativa', 'Inativa') AS 'status_pessoa_usuaria'
FROM SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.historico AS H
ON U.usuario_id = H.usuario_id
GROUP BY U.usuario_nome
ORDER BY U.usuario_nome;