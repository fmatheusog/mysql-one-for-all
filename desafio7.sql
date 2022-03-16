SELECT
art.name as artista,
al.name as album,
COUNT(f.artist_id) as seguidores 
FROM SpotifyClone.artists as art
INNER JOIN SpotifyClone.albums as al
ON al.artist_id = art.artist_id
INNER JOIN SpotifyClone.following_artists as f
ON f.artist_id = art.artist_id
GROUP BY al.name, art.name
ORDER BY seguidores DESC, artista, album