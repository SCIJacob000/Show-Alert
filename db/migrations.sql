DROP DATABASE IF EXISTS show_stopper;
CREATE DTATBASE show_stopper;

\c show_stopper;

CREATE TABLE bands(
id SERIAL PRIMARY KEY,
name VARCHAR(256) NOT NULL,
password_digest VARCHAR(256) NOT NULL,
description TEXT
);

CREATE TABLE shows(
id SERIAL PRIMARY KEY,
show_date DATE,
show_time TIME,
tickets VARCHAR(256)
);

-- THROUGH TABLE
CREATE TABLE booking(
id SERIAL PRIMARY KEY,
venue VARCHAR(256),
show_id INTEGER REFERANCES shows(id), --foriegn key
band_id INTEGER REFERANCES bands(id) -- foriegn key
);
