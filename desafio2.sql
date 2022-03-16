SELECT
(SELECT count(*) from SpotifyClone.songs) AS cancoes,
(SELECT count(*) from SpotifyClone.artists) AS artistas,
(SELECT count(*) from SpotifyClone.albums) AS albuns