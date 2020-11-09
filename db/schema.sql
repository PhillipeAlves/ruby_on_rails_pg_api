CREATE DATABASE my_database;

CREATE TABLE my_tables
(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL
);

INSERT INTO my_tables
    (content)
VALUES
    ('random text');
