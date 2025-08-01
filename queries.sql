-- 1. Count of artists by country
SELECT Country, COUNT(*) AS artist_count
FROM artists
GROUP BY Country
ORDER BY artist_count DESC;

-- 2. Count of tracks by genre
SELECT genre, COUNT(*) AS track_count
FROM tracks
GROUP BY genre
ORDER BY track_count DESC;

-- 3. Top 10 most popular artists
SELECT Name, Popularity
FROM artists
ORDER BY Popularity DESC
LIMIT 10;

-- 4. Top 10 tracks by energy
SELECT track_name, energy
FROM tracks
ORDER BY energy DESC
LIMIT 10;

-- 5. Average danceability by artist
SELECT artist_name, ROUND(AVG(danceability), 3) AS avg_danceability
FROM tracks
GROUP BY artist_name
ORDER BY avg_danceability DESC
LIMIT 10;

-- 6. Tracks by U.S. artists (join)
SELECT t.track_name, a.Name AS artist, a.Country
FROM tracks AS t
JOIN artists AS a
  ON t.artist_name = a.Name
WHERE a.Country = 'US'
LIMIT 10;

-- 7. Number of tracks per artist (join & HAVING)
SELECT a.Name AS artist, COUNT(t.track_id) AS total_tracks
FROM artists a
JOIN tracks t ON a.Name = t.artist_name
GROUP BY a.Name
HAVING total_tracks > 5
ORDER BY total_tracks DESC
LIMIT 10;

-- 8. Average valence per genre
SELECT genre, ROUND(AVG(valence), 3) AS avg_valence
FROM tracks
GROUP BY genre
ORDER BY avg_valence DESC;

-- 9. Tracks with above-average popularity (subquery)
SELECT track_name, popularity
FROM tracks
WHERE popularity > (
  SELECT AVG(popularity)
  FROM tracks
);

-- 10. Create a view for high-popularity tracks
CREATE VIEW high_popularity_tracks AS
SELECT track_name, artist_name, popularity
FROM tracks
WHERE popularity >= 80;

-- 11. Query the high_popularity_tracks view
SELECT *
FROM high_popularity_tracks;

-- 12. Average track duration per genre
SELECT genre, ROUND(AVG(duration_ms)/1000, 1) AS avg_duration_sec
FROM tracks
GROUP BY genre
ORDER BY avg_duration_sec DESC;

-- 13. Most common track keys by genre
SELECT t.genre, t.track_key, COUNT(*) AS count
FROM tracks t
JOIN artists a ON t.artist_name = a.Name
GROUP BY t.genre, t.track_key
ORDER BY count DESC
LIMIT 10;

-- 14. Average energy by track key
SELECT t.track_key, ROUND(AVG(t.energy), 3) AS avg_energy
FROM tracks t
JOIN artists a ON t.artist_name = a.Name
GROUP BY t.track_key
ORDER BY avg_energy DESC;