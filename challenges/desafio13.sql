SELECT 
CASE
WHEN U.usuario_idade <= 30 THEN 'Até 30 anos'
WHEN U.usuario_idade BETWEEN 31 AND 60 THEN 'Entre 31 e 60 anos'
WHEN U.usuario_idade > 60 THEN 'Maior de 60 anos'
END AS 'faixa_etaria',
COUNT(DISTINCT U.usuario_id) AS 'total_pessoas_usuarias',
COUNT(CF.cancao_id) AS 'total_favoritadas'
FROM SpotifyClone.usuario AS U
LEFT JOIN SpotifyClone.cancao_favorita AS CF
ON U.usuario_id = CF.usuario_id
GROUP BY `faixa_etaria`
ORDER BY `faixa_etaria`;
