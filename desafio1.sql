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
  ('Gratuito', 0.00),
  ('Individual', 15.99),
  ('Universitário', 8.99),
  ('Família', 26.99);

INSERT INTO SpotifyClone.users (
  name,
  age,
  plan_id,
  sub_date
  )
VALUES
  ('User 1', 20, 4, '2021-03-01'),
  ('User 2', 21, 4, '2021-03-01'),
  ('User 3', 22, 1, '2021-03-01'),
  ('User 4', 23, 2, '2021-03-01'),
  ('User 5', 24, 2, '2021-03-01'),
  ('User 6', 25, 1, '2021-03-01'),
  ('User 7', 26, 1, '2021-03-01'),
  ('User 8', 27, 2, '2021-03-01'),
  ('User 9', 28, 4, '2021-03-01'),
  ('User 10', 29, 4, '2021-03-01');

INSERT INTO SpotifyClone.artists (name)
VALUES
  ('Artist 1'),
  ('Artist 2'),
  ('Artist 3'),
  ('Artist 4'),
  ('Artist 5'),
  ('Artist 6');

INSERT INTO SpotifyClone.following_artists (
  user_id,
  artist_id
)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (3, 5),
  (3, 6),
  (4, 1),
  (4, 2),
  (5, 1),
  (5, 2),
  (6, 1),
  (6, 2),
  (7, 1),
  (7, 2),
  (8, 1),
  (8, 2),
  (9, 1),
  (9, 2),
  (10, 1),
  (10, 2),
  (10, 3),
  (10, 4);

INSERT INTO SpotifyClone.albums (
  name,
  artist_id,
  release_year
)
VALUES
  ('Album 1', 1, 2015),
  ('Album 2', 1, 2015),
  ('Album 3', 1, 2016),
  ('Album 4', 1, 2017),
  ('Album 5', 1, 2018),
  ('Album 6', 1, 2018),
  ('Album 7', 1, 2019),
  ('Album 8', 1, 2020),
  ('Album 9', 1, 2021),
  ('Album 10', 1, 2022);

INSERT INTO SpotifyClone.songs (
  name,
  seconds_duration,
  album_id
)
VALUES
  ('Song 1', 121, 1),
  ('Song 2', 132, 1),
  ('Song 3', 143, 1),
  ('Song 4', 154, 1),
  ('Song 5', 165, 1),
  ('Song 6', 121, 1),
  ('Song 7', 132, 1),
  ('Song 8', 143, 1),
  ('Song 9', 154, 1),
  ('Song 10', 165, 2),
  ('Song 11', 121, 2),
  ('Song 12', 132, 2),
  ('Song 13', 143, 2),
  ('Song 14', 154, 2),
  ('Song 15', 165, 2),
  ('Song 16', 121, 2),
  ('Song 17', 132, 2),
  ('Song 18', 143, 2),
  ('Song 19', 154, 2),
  ('Song 20', 165, 2),
  ('Song 21', 121, 3),
  ('Song 22', 132, 3),
  ('Song 23', 143, 3),
  ('Song 24', 154, 3),
  ('Song 25', 165, 3),
  ('Song 26', 121, 3),
  ('Song 27', 132, 3),
  ('Song 28', 143, 3),
  ('Song 29', 154, 3),
  ('Song 30', 165, 3),
  ('Song 31', 121, 4),
  ('Song 32', 132, 4),
  ('Song 33', 143, 4),
  ('Song 34', 154, 4),
  ('Song 35', 165, 4),
  ('Song 36', 121, 4),
  ('Song 37', 132, 4),
  ('Song 38', 143, 4),
  ('Song 39', 154, 4),
  ('Song 40', 165, 4);

INSERT INTO SpotifyClone.history (
  user_id,
  song_id,
  reproduction_date
)
VALUES
(1, 1, '2021-03-02 08:00:30'),
(1, 2, '2021-03-02 09:01:20'),
(1, 3, '2021-03-02 10:02:40'),
(1, 4, '2021-03-02 11:03:10'),
(2, 5, '2021-03-02 12:04:20'),
(2, 6, '2021-03-02 13:05:50'),
(2, 7, '2021-03-02 14:06:30'),
(2, 8, '2021-03-03 08:07:40'),
(2, 9, '2021-03-03 09:08:10'),
(2, 10, '2021-03-03 10:09:20'),
(2, 11, '2021-03-03 11:10:30'),
(3, 12, '2021-03-03 12:11:10'),
(3, 13, '2021-03-04 05:12:20'),
(3, 14, '2021-03-04 06:13:20'),
(3, 15, '2021-03-04 07:14:30'),
(3, 16, '2021-03-04 08:15:50'),
(3, 17, '2021-03-04 09:16:40'),
(4, 18, '2021-03-02 10:17:30'),
(4, 19, '2021-03-02 11:18:20'),
(4, 20, '2021-03-02 12:19:10'),
(5, 21, '2021-03-02 13:20:20'),
(5, 22, '2021-03-02 14:21:30'),
(5, 23, '2021-03-02 15:22:40'),
(6, 24, '2021-03-02 16:23:50'),
(6, 25, '2021-03-02 17:24:40'),
(7, 26, '2021-03-02 18:25:30'),
(7, 27, '2021-03-03 08:26:20'),
(8, 28, '2021-03-02 09:27:10'),
(8, 29, '2021-03-02 10:28:10'),
(8, 30, '2021-03-02 11:29:09'),
(9, 31, '2021-03-02 03:30:08'),
(9, 32, '2021-03-02 04:01:07'),
(9, 33, '2021-03-02 05:02:06'),
(10, 34, '2021-03-02 06:03:05'),
(10, 35, '2021-03-02 07:04:04'),
(10, 36, '2021-03-02 08:05:03'),
(10, 37, '2021-03-02 09:06:02'),
(10, 38, '2021-03-02 10:07:01');