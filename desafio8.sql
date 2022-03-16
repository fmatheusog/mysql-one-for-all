SELECT
a.name as artista,
al.name as album
FROM SpotifyClone.artists as a
INNER JOIN SpotifyClone.albums as al
ON a.artist_id = al.artist_id
WHERE a.name = 'Walter Phoenix';