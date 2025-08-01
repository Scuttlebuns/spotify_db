-- schema.sql: Drop, create DB, tables, and load data

DROP DATABASE IF EXISTS spotify_db;
CREATE DATABASE spotify_db;
USE spotify_db;

-- Drop tables if they exist
DROP TABLE IF EXISTS tracks;
DROP TABLE IF EXISTS artists;

-- Create artists table (columns in CSV order)
CREATE TABLE artists (
    Name VARCHAR(255),
    ID VARCHAR(100) PRIMARY KEY,
    Gender VARCHAR(50),
    Age INT,
    Country VARCHAR(100),
    Genres TEXT,
    Popularity INT,
    Followers INT,
    URI VARCHAR(255)
);

-- Create tracks table (columns in CSV order, renamed 'key' to 'track_key')
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
    track_key        VARCHAR(10),
    liveness         FLOAT,
    loudness         FLOAT,
    mode             VARCHAR(10),
    speechiness      FLOAT,
    tempo            FLOAT,
    time_signature   INT,
    valence          FLOAT
);

-- Enable loading local files
SET GLOBAL local_infile = 1;

-- Load data into artists
LOAD DATA LOCAL INFILE 'US Top 10K Artists.csv'
INTO TABLE artists
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Name, ID, Gender, Age, Country, Genres, Popularity, Followers, URI);

-- Load data into tracks
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
