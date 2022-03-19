SELECT COUNT(*) as quantidade_musicas_no_historico
FROM SpotifyClone.history as h
INNER JOIN SpotifyClone.users as u
ON u.user_id = h.user_id
WHERE u.name = "Bill"