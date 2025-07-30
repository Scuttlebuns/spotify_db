
-- Drop tables if they exist
DROP TABLE IF EXISTS tracks;
DROP TABLE IF EXISTS artists;

-- Create artists table
CREATE TABLE artists (
    Name,
    ID,
    Gender,
    Age,
    Country,
    Genres,
    Popularity,
    Followers,
    URI,
    PRIMARY KEY (artist_id)
);

-- Create tracks table
CREATE TABLE tracks (
    genre,
    artist_name,
    track_name,
    track_id,
    popularity,
    acousticness,
    danceability,
    duration_ms,
    energy,
    instrumentalness,
    key,
    liveness,
    loudness,
    mode,
    speechiness,
    tempo,
    time_signature,
    valence,
    PRIMARY KEY (track_id)
);

-- Load data into artists
LOAD DATA INFILE '/path/to/US_Top_10K_Artists.csv'
INTO TABLE artists
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into tracks
LOAD DATA INFILE '/path/to/Spotify_Tracks_DB.csv'
INTO TABLE tracks
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
