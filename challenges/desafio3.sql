SELECT 
	  U.usuario_nome AS 'pessoa_usuaria',
	  COUNT(DISTINCT H.cancao_id) AS 'musicas_ouvidas',
    ROUND(SUM(S.cancao_duracao)/60, 2) AS 'total_minutos'
FROM SpotifyClone.historico AS H
INNER JOIN SpotifyClone.usuario AS U
ON H.usuario_id = U.usuario_id
INNER JOIN SpotifyClone.cancoes AS S
ON H.cancao_id = S.cancao_id
GROUP BY `pessoa_usuaria`;