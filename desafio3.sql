SELECT u.name as usuario,
COUNT(*) as qtde_musicas_ouvidas,
ROUND(SUM(s.seconds_duration / 60), 2) as total_minutos
FROM SpotifyClone.history as h
INNER JOIN SpotifyClone.users as u
INNER JOIN SpotifyClone.songs as s
ON u.user_id = h.user_id AND s.song_id = h.song_id
GROUP BY usuario
ORDER BY usuario