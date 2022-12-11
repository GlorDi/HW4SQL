CREATE TABLE IF NOT	EXISTS musical_genre (
	genre_id SERIAL PRIMARY KEY,
	name_genere VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
	artist_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_artist (
	genre_id INTEGER REFERENCES musical_genre(genre_id),
	artist_id INTEGER REFERENCES artist(artist_id),
	CONSTRAINT genre_artist_id PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	name_album VARCHAR(80) NOT NULL,
	year_album NUMERIC NOT NULL
);

CREATE TABLE IF NOT EXISTS album_artist (
	artist_id INTEGER REFERENCES artist(artist_id),
	album_id INTEGER REFERENCES album(album_id),
	CONSTRAINT album_artist_id PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS track (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(100) NOT NULL,
	duration NUMERIC NOT NULL,
	album_id INTEGER NOT NULL REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY,
	year_collection NUMERIC NOT NULL,
	name_collection VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS collection_track (
	track_id INTEGER REFERENCES track(track_id),
	collection_id INTEGER REFERENCES collection(collection_id),
	CONSTRAINT collection_track_id PRIMARY KEY (collection_id, track_id)
);