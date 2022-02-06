-- from the terminal run:
-- psql < craiglist.sql

DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    encrypted_password  password NOT NULL,
    preferred_region_id INTEGER REFERENCES regions
);

CREATE TABLE regions(
    id SERIAL PRIMARY KEY,
    region_name TEXT
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    category_name TEXT
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    useid INTEGER REFERENCES users,
    post_location TEXT,
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories   
);



