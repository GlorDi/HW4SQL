SELECT mg.name_genere, count(a.name) FROM musical_genre mg
LEFT JOIN artist a ON mg.genre_id = a.artist_id
LEFT JOIN genre_artist ga ON ga.genre_id = a.artist_id
GROUP BY mg.name_genere
ORDER BY count(a.name) DESC;

SELECT count(track_id) FROM track
JOIN album a ON track.album_id = a.album_id
WHERE year_album BETWEEN 2019 AND 2020;

SELECT a.name_album, AVG(t.duration) FROM album a
LEFT JOIN track t ON t.album_id = a.album_id
GROUP BY a.name_album;

SELECT DISTINCT a.name FROM artist a 
WHERE a.name NOT IN (
	SELECT DISTINCT a.name FROM artist a
	LEFT JOIN album_artist aa ON aa.album_id = a.artist_id
	LEFT JOIN album a2 ON a2.album_id = aa.artist_id 
	WHERE a2.year_album = 2020
);

SELECT DISTINCT name_collection FROM collection
JOIN collection_track USING(collection_id)
JOIN track USING(track_id)
JOIN album USING(album_id)
JOIN album_artist USING(album_id)
JOIN artist USING(artist_id)
WHERE name LIKE '%Рома%';

SELECT name_album FROM album
JOIN album_artist USING(album_id)
JOIN artist USING(artist_id)
JOIN genre_artist USING(artist_id)
JOIN musical_genre USING(genre_id)
GROUP BY name_album
HAVING count(DISTINCT name_album) > 1;

SELECT track_name FROM track
JOIN collection_track USING(track_id)
WHERE track_id IS NULL;

SELECT artist.name, duration FROM track
JOIN album USING(album_id)
JOIN album_artist USING(album_id)
JOIN artist USING(artist_id)
GROUP BY artist.name, track.duration
HAVING track.duration = (SELECT min(duration) FROM track);

SELECT name_album, count(*) FROM album
JOIN track USING(album_id)
GROUP BY name_album
HAVING count(*) = (SELECT count(*) FROM album
	JOIN track USING(album_id)
	GROUP BY name_album
	ORDER BY count
	LIMIT 1);