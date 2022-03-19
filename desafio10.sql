SELECT s.name as nome, COUNT(*) as reproducoes
FROM SpotifyClone.songs as s
INNER JOIN SpotifyClone.history as h
ON h.song_id = s.song_id
INNER JOIN SpotifyClone.users as u
ON h.user_id = u.user_id
WHERE u.plan_id = 1 OR u.plan_id = 3
GROUP BY s.name
ORDER BY s.name ASC