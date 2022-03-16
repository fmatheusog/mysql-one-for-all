DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
  plan_id int auto_increment PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  price DECIMAL(8,2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.users(
  user_id int auto_increment PRIMARY KEY,
  name varchar(30) NOT NULL,
  age int NOT NULL,
  plan_id int NOT NULL,
  sub_date date NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artists(
  artist_id int auto_increment PRIMARY KEY,
  name VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.following_artists(
  user_id int NOT NULL,
  artist_id int NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
  PRIMARY KEY (user_id, artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albums(
  album_id int auto_increment PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  artist_id int NOT NULL,
  release_year year NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.songs(
  song_id int auto_increment PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  seconds_duration int NOT NULL,
  album_id int NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
  user_id int NOT NULL,
  song_id int NOT NULL,
  reproduction_date timestamp NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id),
  PRIMARY KEY (user_id, song_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (name, price)
VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

INSERT INTO SpotifyClone.users (
  name,
  age,
  sub_date,
  plan_id
  )
VALUES
  ('Thati', 23, '2019-10-20', 1),
  ('Cintia', 35, '2017-12-30', 4),
  ('Bill', 20, '2019-06-05', 2),
  ('Roger', 45, '2020-05-13', 3),
  ('Norman', 58, '2017-02-17', 3),
  ('Patrick', 33, '2017-01-06', 4),
  ('Vivian', 26, '2018-07-05', 2),
  ('Carol', 19, '2018-02-14', 2),
  ('Angelina', 42, '2018-04-29', 4),
  ('Paul', 46, '2017-01-17', 4);

INSERT INTO SpotifyClone.artists (name)
VALUES
  ('Fog'),
  ('Freedie Shannon'),
  ('Lance Day'),
  ('Peter Strong'),
  ('Tyler Isle'),
  ('Walter Phoenix');

INSERT INTO SpotifyClone.following_artists (
  user_id,
  artist_id
)
VALUES
  (1, 6),
  (1, 2),
  (1, 3),
  (2, 6),
  (2, 3),
  (3, 4),
  (3, 6),
  (4, 2),
  (5, 5),
  (5, 1),
  (6, 1),
  (6, 3),
  (6, 6),
  (7, 4),
  (7, 5),
  (8, 6),
  (8, 5),
  (9, 1),
  (9, 2),
  (9, 3),
  (10, 4),
  (10, 1);

INSERT INTO SpotifyClone.albums (
  name,
  release_year,
  artist_id
)
VALUES
  ("Apparatus", 2015, 1),
  ("Cabinet of fools", 2012, 5),
  ("Chained Down", 2007, 5),
  ("Envious", 1990, 6),
  ("Exuberant", 1993, 6),
  ("Hallowed Steam", 1995, 4),
  ("Incandescent", 1998, 3),
  ("Library of liberty", 2003, 2),
  ("No guarantees", 2015, 5),
  ("Temporary Culture", 2001, 2);

INSERT INTO SpotifyClone.songs (
  name,
  album_id,
  seconds_duration
)
VALUES
  ('Soul For Us', 1, 200),
  ('Reflections Of Magic', 1, 163),
  ('Dance With Her Own', 1, 116),
  ('Troubles Of My Inner Fire', 2, 203),
  ('Time Fireworks', 2, 152),
  ('Magic Circus', 3, 105),
  ('Honey, So Do I', 3, 207),
  ("Sweetie, Let's Go Wild", 3, 139),
  ('She Knows', 3, 244),
  ('Fantasy For Me', 4, 100),
  ('Celebration Of More', 4, 146),
  ('Rock His Everything', 4, 223),
  ('Home Forever', 4, 231),
  ('Diamond Power', 4, 241),
  ("Let's Be Silly", 4, 132),
  ('Thang Of Thunder', 5, 240),
  ('Words Of Her Life', 5, 185),
  ('Without My Streets', 5, 176),
  ('Need Of The Evening', 6, 190),
  ('History Of My Roses', 6, 222),
  ('Without My Love', 6, 111),
  ('Walking And Game', 6, 123),
  ('Young And Father', 6, 197),
  ('Finding My Traditions', 7, 179),
  ('Walking And Man', 7, 229),
  ('Hard And Time', 7, 135),
  ("Honey, I'm A Lone Wolf", 7, 150),
  ("She Thinks I Won't Stay Tonight", 8, 166),
  ("He Heard You're Bad For Me", 8, 154),
  ("He Hopes We Can't Stay", 8, 210),
  ('I Know I Know', 8, 117),
  ("He's Walking Away", 9, 159),
  ("He's Trouble", 9, 138),
  ('I Heard I Want To Bo Alone', 9, 120),
  ('I Ride Alone', 9, 151),
  ('Honey', 10, 79),
  ('You Cheated On Me', 10, 95),
  ("Wouldn't It Be Nice", 10, 213),
  ('Baby', 10, 136),
  ('You Make Me Feel So..', 10, 83);

INSERT INTO SpotifyClone.history (
  song_id,
  user_id,
  reproduction_date
)
VALUES
  (36, 1, '2020-02-28 10:45:55'),
  (25, 1, '2020-05-02 05:30:35'),
  (23, 1, '2020-03-06 11:22:33'),
  (14, 1, '2020-08-05 08:05:17'),
  (15, 1, '2020-09-14 16:32:22'),
  (34, 2, '2020-01-02 07:40:33'),
  (24, 2, '2020-05-16 06:16:22'),
  (21, 2, '2020-10-09 12:27:48'),
  (39, 2, '2020-09-21 13:14:46'),
  (6, 3, '2020-11-13 16:55:13'),
  (3, 3, '2020-12-05 18:38:30'),
  (26, 3, '2020-07-30 10:00:00'),
  (2, 4, '2021-08-15 17:10:10'),
  (35, 4, '2021-07-10 15:20:30'),
  (27, 4, '2021-01-09 01:44:33'),
  (7, 5, '2020-07-03 19:33:28'),
  (12, 5, '2017-02-24 21:14:22'),
  (14, 5, '2020-08-06 15:23:43'),
  (1, 5, '2020-11-10 13:52:27'),
  (38, 6, '2019-02-07 20:33:48'),
  (29, 6, '2017-01-24 00:31:17'),
  (30, 6, '2017-10-12 12:35:20'),
  (22, 6, '2018-05-29 14:56:41'),
  (5, 7, '2018-05-09 22:30:49'),
  (4, 7, '2020-07-27 12:52:58'),
  (11, 7, '2018-01-16 18:40:43'),
  (39, 8, '2018-03-21 16:56:40'),
  (40, 8, '2020-10-18 13:38:05'),
  (32, 8, '2019-05-25 08:14:03'),
  (33, 8, '2021-08-15 21:37:09'),
  (16, 9, '2021-05-24 17:23:45'),
  (17, 9, '2018-12-07 22:48:52'),
  (8, 9, '2021-03-14 06:14:26'),
  (9, 9, '2020-04-01 03:36:00'),
  (20, 10, '2017-02-06 08:21:34'),
  (21, 10, '2017-12-04 05:33:43'),
  (12, 10, '2017-07-27 05:24:49'),
  (13, 10, '2017-12-25 01:03:57');