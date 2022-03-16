SELECT MIN(p.price) as faturamento_minimo,
MAX(p.price) as faturamento_maximo,
ROUND((SUM(p.price) / count(p.price)), 2) as faturamento_medio,
SUM(p.price) as faturamento_total
FROM SpotifyClone.users as u
INNER JOIN SpotifyClone.plans as p
ON p.plan_id = u.plan_id