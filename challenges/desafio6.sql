SELECT
	MIN(plano_valor) AS 'faturamento_minimo',
	MAX(plano_valor) AS 'faturamento_maximo',
	ROUND(AVG(plano_valor), 2) AS 'faturamento_medio',
	ROUND(SUM(plano_valor), 2) AS 'faturamento_total'
FROM SpotifyClone.usuario AS U
INNER JOIN SpotifyClone.planos AS P
ON P.plano_id = U.plano_id;