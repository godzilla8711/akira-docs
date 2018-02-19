DROP DATABASE gpsdb;

----------------
-- Database: GPSDB
CREATE DATABASE gpsdb
  WITH 
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'en_US.UTF-8'
  LC_CTYPE = 'en_US.UTF-8'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;

COMMENT ON DATABASE postgres IS 'GPS Database';

\connect gpsdb

--------------
-- Schema: GPS
CREATE SCHEMA gps AUTHORIZATION postgres;
COMMENT ON SCHEMA gps IS 'GPS data schema';
GRANT ALL ON SCHEMA gps TO postgres;
-- GRANT ALL ON SCHEMA gps TO PUBLIC;

------------------
-- Table: GPS Data

CREATE TABLE IF NOT EXISTS gps.location (
  id serial PRIMARY KEY,
  timestamp timestamp NOT NULL,
  latitude double precision NOT NULL,
  longitude double precision NOT NULL,
  altitude double precision NOT NULL
);

insert into gps.location (timestamp, latitude, longitude, altitude)
values ( '2018-01-30T04:47:09.000Z', 39.00687166666667, -76.88168833333333, 57.7);
insert into gps.location (timestamp, latitude, longitude, altitude)
values ( '2018-01-30T04:47:09.100Z', 39.00787166666667, -76.88268833333333, 57.8);
insert into gps.location (timestamp, latitude, longitude, altitude)
values ( '2018-01-30T04:47:09.200Z', 39.00887166666667, -76.88368833333333, 57.9);

select * from gps.location;
