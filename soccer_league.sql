-- from the terminal run:
-- psql < soccer_league.sql
DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    team1 TEXT,
    team2 TEXT,
    match_date DATE
);

CREATE TABLE scored_goals(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE SET NULL,
    num_goals INTEGER,
    match_id INTEGER REFERENCES matches
);

CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    team_id INTEGER REFERENCES teams 
);


