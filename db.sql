--
-- PostgreSQL database dump
--

-- Dumped from database version 11.3
-- Dumped by pg_dump version 11.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bands; Type: TABLE; Schema: public; Owner: jacobstolberg
--

CREATE TABLE public.bands (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    password_digest character varying(256) NOT NULL,
    description text
);


ALTER TABLE public.bands OWNER TO jacobstolberg;

--
-- Name: bands_id_seq; Type: SEQUENCE; Schema: public; Owner: jacobstolberg
--

CREATE SEQUENCE public.bands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bands_id_seq OWNER TO jacobstolberg;

--
-- Name: bands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacobstolberg
--

ALTER SEQUENCE public.bands_id_seq OWNED BY public.bands.id;


--
-- Name: booking; Type: TABLE; Schema: public; Owner: jacobstolberg
--

CREATE TABLE public.booking (
    id integer NOT NULL,
    venue character varying(256),
    show_id integer,
    band_id integer
);


ALTER TABLE public.booking OWNER TO jacobstolberg;

--
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: jacobstolberg
--

CREATE SEQUENCE public.booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_id_seq OWNER TO jacobstolberg;

--
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacobstolberg
--

ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;


--
-- Name: shows; Type: TABLE; Schema: public; Owner: jacobstolberg
--

CREATE TABLE public.shows (
    id integer NOT NULL,
    date_time timestamp without time zone,
    tickets character varying(256)
);


ALTER TABLE public.shows OWNER TO jacobstolberg;

--
-- Name: shows_id_seq; Type: SEQUENCE; Schema: public; Owner: jacobstolberg
--

CREATE SEQUENCE public.shows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shows_id_seq OWNER TO jacobstolberg;

--
-- Name: shows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacobstolberg
--

ALTER SEQUENCE public.shows_id_seq OWNED BY public.shows.id;


--
-- Name: bands id; Type: DEFAULT; Schema: public; Owner: jacobstolberg
--

ALTER TABLE ONLY public.bands ALTER COLUMN id SET DEFAULT nextval('public.bands_id_seq'::regclass);


--
-- Name: booking id; Type: DEFAULT; Schema: public; Owner: jacobstolberg
--

ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);


--
-- Name: shows id; Type: DEFAULT; Schema: public; Owner: jacobstolberg
--

ALTER TABLE ONLY public.shows ALTER COLUMN id SET DEFAULT nextval('public.shows_id_seq'::regclass);


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: jacobstolberg
--

COPY public.bands (id, name, password_digest, description) FROM stdin;
1	Phish	123	Jim's favorite band.
2	String Cheese Incident	123	A gouda band.
3	Yonder Mountain String Band	123	A classic Bluegrass band.
\.


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: jacobstolberg
--

COPY public.booking (id, venue, show_id, band_id) FROM stdin;
\.


--
-- Data for Name: shows; Type: TABLE DATA; Schema: public; Owner: jacobstolberg
--

COPY public.shows (id, date_time, tickets) FROM stdin;
1	2019-06-05 08:00:00	Available
2	2019-06-10 08:00:00	Available
3	2019-06-15 08:00:00	Available
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobstolberg
--

SELECT pg_catalog.setval('public.bands_id_seq', 3, true);


--
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobstolberg
--

SELECT pg_catalog.setval('public.booking_id_seq', 1, false);


--
-- Name: shows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacobstolberg
--

SELECT pg_catalog.setval('public.shows_id_seq', 3, true);


--
-- Name: bands bands_pkey; Type: CONSTRAINT; Schema: public; Owner: jacobstolberg
--

ALTER TABLE ONLY public.bands
    ADD CONSTRAINT bands_pkey PRIMARY KEY (id);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: jacobstolberg
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- Name: shows shows_pkey; Type: CONSTRAINT; Schema: public; Owner: jacobstolberg
--

ALTER TABLE ONLY public.shows
    ADD CONSTRAINT shows_pkey PRIMARY KEY (id);


--
-- Name: booking booking_band_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jacobstolberg
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_band_id_fkey FOREIGN KEY (band_id) REFERENCES public.bands(id);


--
-- Name: booking booking_show_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jacobstolberg
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_show_id_fkey FOREIGN KEY (show_id) REFERENCES public.shows(id);


--
-- PostgreSQL database dump complete
--

