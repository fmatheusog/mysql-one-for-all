DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
  plan_id int auto_increment PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  price decimal(5,2) NOT NULL
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
  id int auto_increment PRIMARY KEY,
  user_id int NOT NULL,
  artist_id int NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
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
  id int auto_increment PRIMARY KEY,
  user_id int NOT NULL,
  song_id int NOT NULL,
  date timestamp NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
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
  ('Felipe', 24, 4, '2021-03-01'),
  ('Leonardo', 21, 4, '2021-03-01'),
  ('João', 20, 1, '2021-09-25'),
  ('Lucas', 24, 2, '2021-05-15'),
  ('Pedro', 24, 3, '2022-01-05');

INSERT INTO SpotifyClone.artists (name)
VALUES
  ('Artist 1'),
  ('Artist 2'),
  ('Artist 3'),
  ('Artist 4'),
  ('Artist 5');

INSERT INTO SpotifyClone.following_artists (
  user_id,
  artist_id
)
VALUES
  (1, 1),
  (1, 2),
  (2, 4),
  (2, 5),
  (3, 2),
  (3, 3),
  (4, 1),
  (5, 1),
  (5, 2),
  (5, 3),
  (5, 4);

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
  ('Song 40', 165, 4),
  ('Song 41', 121, 5),
  ('Song 42', 132, 5),
  ('Song 43', 143, 5),
  ('Song 44', 154, 5),
  ('Song 45', 165, 5),
  ('Song 46', 121, 5),
  ('Song 47', 132, 5),
  ('Song 48', 143, 5),
  ('Song 49', 154, 5),
  ('Song 50', 165, 5);

INSERT INTO SpotifyClone.history (
  user_id,
  song_id,
  date
)
VALUES
  (1, 1, '2021-03-01 14:35:22'),
  (1, 2, '2021-03-02 02:15:05'),
  (1, 4, '2021-03-04 08:47:35'),
  (1, 5, '2021-03-04 10:20:12'),
  (1, 6, '2021-03-04 10:25:10'),
  (1, 7, '2021-03-05 23:22:21'),
  (1, 8, '2021-03-05 23:33:34'),
  (1, 9, '2021-03-05 23:44:45'),
  (1, 10, '2021-03-06 09:15:30'),
  (2, 2, '2021-03-01 03:10:22'),
  (2, 4, '2021-03-02 04:09:22'),
  (2, 6, '2021-03-03 05:08:22'),
  (2, 8, '2021-03-04 06:07:22'),
  (2, 10, '2021-03-05 07:06:22'),
  (2, 12, '2021-03-06 08:05:22'),
  (2, 14, '2021-03-07 09:04:22'),
  (2, 16, '2021-03-08 10:03:22'),
  (2, 18, '2021-03-09 11:02:22'),
  (2, 20, '2021-03-09 12:01:22'),
  (3, 1, '2021-09-25 01:11:22'),
  (3, 3, '2021-09-26 03:22:12'),
  (3, 5, '2021-09-26 03:33:32'),
  (3, 7, '2021-10-05 05:44:52'),
  (3, 9, '2021-10-05 05:55:32'),
  (3, 11, '2021-10-06 07:55:32'),
  (3, 13, '2021-10-06 07:44:15'),
  (3, 15, '2021-10-06 07:33:17'),
  (3, 17, '2021-10-07 07:22:34'),
  (3, 19, '2021-12-08 09:11:33'),
  (4, 40, '2021-05-15 11:02:32'),
  (4, 41, '2021-05-16 12:03:31'),
  (4, 42, '2021-05-16 12:10:30'),
  (4, 43, '2021-05-18 13:40:05'),
  (4, 44, '2021-05-19 13:45:19'),
  (4, 45, '2021-05-19 14:05:34'),
  (4, 46, '2021-05-19 14:15:28'),
  (4, 47, '2021-05-20 15:35:22'),
  (4, 48, '2021-06-01 08:20:15'),
  (4, 49, '2021-06-01 08:30:42'),
  (5, 30, '2022-01-05 15:12:33'),
  (5, 31, '2022-01-05 16:40:56'),
  (5, 32, '2022-01-06 08:01:03'),
  (5, 33, '2022-01-06 08:10:08'),
  (5, 34, '2022-01-06 08:34:18'),
  (5, 35, '2022-01-08 20:15:43'),
  (5, 36, '2022-01-08 20:35:02'),
  (5, 37, '2022-01-08 20:55:09'),
  (5, 38, '2022-01-08 21:30:05'),
  (5, 39, '2022-01-09 14:14:14');