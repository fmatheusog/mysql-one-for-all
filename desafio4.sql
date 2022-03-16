SELECT DISTINCT u.name AS usuario, 
IF(MAX(YEAR(r.reproduction_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.users AS u
INNER JOIN SpotifyClone.history AS r
ON u.user_id = r.user_id
GROUP BY u.name ORDER BY u.name ASC;