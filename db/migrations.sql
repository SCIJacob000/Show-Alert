<<<<<<< Updated upstream
=======
DROP DATABASE IF EXISTS show_stopper;
CREATE DATATBASE show_stopper;

\c show_stopper;

CREATE TABLE bands(
id SERIAL PRIMARY KEY,
name VARCHAR(256) NOT NULL,
password_digest VARCHAR(256) NOT NULL,
description TEXT
);

CREATE TABLE shows(
id SERIAL PRIMARY KEY,
date_time TIMESTAMP WITHOUT TIME ZONE,
tickets VARCHAR(256)
);

-- THROUGH TABLE
CREATE TABLE bookings(
id SERIAL PRIMARY KEY,
venue VARCHAR(256),
show_id INTEGER REFERENCES shows(id), --foriegn key
band_id INTEGER REFERENCES bands(id) -- foriegn key
);
>>>>>>> Stashed changes
