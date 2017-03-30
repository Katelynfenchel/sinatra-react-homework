-- psql -a -f migrations.sql

CREATE DATABASE place;

\c place;

CREATE TABLE  where(id SERIAL PRIMARY KEY, country varchar(255), city varchar(255));
