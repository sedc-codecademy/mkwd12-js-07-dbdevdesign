-- Run a cleanup before creating new tables
-- Completely delete the tables
DROP TABLE IF EXISTS artist_details, song_lyrics, playlists_songs, songs_genres, song, playlist, genre, artist, album;

-- Create artist table
CREATE TABLE artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

-- Query artist table to check if it has been created properly
-- SELECT * FROM artist;

-- Create artist_details tableto-One relationship with artist)
CREATE TABLE artist_details (
	id SERIAL PRIMARY KEY,
	date_of_birth DATE NOT NULL,
	full_name VARCHAR(100),
	country VARCHAR(100),
	city VARCHAR(100),
	is_married BOOLEAN DEFAULT false NOT NULL,
	spouse_name VARCHAR(100),
	artist_id INT UNIQUE REFERENCES artist(id)
);

-- Query artist_details table to check if it has been created properly
-- SELECT * FROM artist_details;

-- Create song table (Many-to-One relationship between song and artist)
CREATE TABLE song (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration INTERVAL NOT NULL,
	explicit BOOLEAN DEFAULT false NOT NULL,
	artist_id INT REFERENCES artist(id)
);

-- Query song table to check if it has been created properly
-- SELECT * FROM song;

-- Create song_lyrics table (One-to-One relationship with songs)
CREATE TABLE song_lyrics (
	id SERIAL PRIMARY KEY,
	lyrics TEXT NOT NULL,
	song_id INT UNIQUE REFERENCES song(id)
);

-- Query song_lyrics table to check if it has been created properly
-- SELECT * FROM song_lyrics;

-- Create playlist table
CREATE TABLE playlist (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100)
);

-- Query playlist table to check if it has been created properly
-- SELECT * FROM playlist;

-- Create playlist_songs table (Many-to-Many relationship between playlists and songs)
CREATE TABLE playlists_songs (
    playlist_id INT REFERENCES playlist(id),
    song_id INT REFERENCES song(id),
    PRIMARY KEY (playlist_id, song_id)
);

-- Query playlists_songs table to check if it has been created properly
-- SELECT * FROM playlists_songs;

-- Create genre table
CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Query genre table to check if it has been created properly
-- SELECT * FROM genre;

-- Create songs_genres table (Many-to-Many relationship between songs and genres)
CREATE TABLE songs_genres (
    song_id INT REFERENCES song(id),
    genre_id INT REFERENCES genre(id),
    PRIMARY KEY (song_id, genre_id)
);

-- Query songs_genres table to check if it has been created properly
-- SELECT * FROM songs_genres;

-- Create album table
CREATE TABLE album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    rating DECIMAL,
    artist_id INT REFERENCES artist(id)
);

-- Query album table to check if it has been created properly
-- SELECT * FROM album;

-- Clean tables from data
-- TRUNCATE TABLE artist_details, song_lyrics, playlists_songs, songs_genres, song, playlist, genre, artist, album CASCADE;