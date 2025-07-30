-- 1) Drop and recreate the database
DROP DATABASE IF EXISTS spotify_db;
CREATE DATABASE spotify_db;
USE spotify_db;

-- 2) Table schemas

CREATE TABLE artists (
  ID          VARCHAR(100) PRIMARY KEY,
  Name        VARCHAR(255),
  Gender      VARCHAR(50),
  Age         INT,
  Country     VARCHAR(100),
  Genres      TEXT,
  Popularity  INT,
  Followers   INT,
  URI         VARCHAR(255)
);

CREATE TABLE tracks (
  genre            VARCHAR(100),
  artist_name      VARCHAR(255),
  track_name       VARCHAR(255),
  track_id         VARCHAR(100) PRIMARY KEY,
  popularity       INT,
  acousticness     FLOAT,
  danceability     FLOAT,
  duration_ms      INT,
  energy           FLOAT,
  instrumentalness FLOAT,
  track_key        INT,
  liveness         FLOAT,
  loudness         FLOAT,
  mode             INT,
  speechiness      FLOAT,
  tempo            FLOAT,
  time_signature   INT,
  valence          FLOAT
);

-- 3) Load data from CSVs (must be in same folder as this .sql)
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'US Top 10K Artists.csv'
INTO TABLE artists
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID, Name, Gender, Age, Country, Genres, Popularity, Followers, URI);

LOAD DATA LOCAL INFILE 'Spotify Tracks DB.csv'
INTO TABLE tracks
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(genre, artist_name, track_name, track_id, popularity,
 acousticness, danceability, duration_ms, energy,
 instrumentalness, track_key, liveness, loudness,
 mode, speechiness, tempo, time_signature, valence);