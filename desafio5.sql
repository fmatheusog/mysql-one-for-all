SELECT s.name as cancao, count(h.song_id) as reproducoes
FROM SpotifyClone.songs as s
INNER JOIN SpotifyClone.history as h
ON h.song_id = s.song_id
GROUP BY s.name
ORDER BY reproducoes DESC, cancao
LIMIT 2;