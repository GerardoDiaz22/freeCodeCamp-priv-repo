--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_table_access_method = heap;

--
-- Name: black_holes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_holes (
    name character varying(20) NOT NULL,
    black_holes_id integer NOT NULL,
    age integer,
    size integer
);


ALTER TABLE public.black_holes OWNER TO freecodecamp;

--
-- Name: black_holes_black_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_black_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_black_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_black_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_black_id_seq OWNED BY public.black_holes.black_holes_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    age integer,
    distance_from_earth integer,
    size numeric,
    is_flat boolean,
    has_life boolean,
    name character varying(20) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    description text,
    age integer,
    distance_from_earth integer,
    size numeric,
    is_flat boolean,
    has_life boolean,
    planet_id integer,
    name character varying(20) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    description text,
    age integer,
    distance_from_earth integer,
    size numeric,
    is_flat boolean,
    has_life boolean,
    star_id integer,
    name character varying(20) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    description text,
    age integer,
    distance_from_earth integer,
    size numeric,
    is_flat boolean,
    has_life boolean,
    galaxy_id integer,
    name character varying(20) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_holes black_holes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes ALTER COLUMN black_holes_id SET DEFAULT nextval('public.black_holes_black_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_holes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_holes VALUES ('Master', 1, NULL, NULL);
INSERT INTO public.black_holes VALUES ('Naster', 2, NULL, NULL);
INSERT INTO public.black_holes VALUES ('Baster', 3, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'thisone', 50, 200, 300.50, true, false, 'Nova');
INSERT INTO public.galaxy VALUES (2, 'thisone', 503, 230, 100.50, true, false, 'Rino');
INSERT INTO public.galaxy VALUES (3, 'thisone', 501, 230, 100.50, true, false, 'Mino');
INSERT INTO public.galaxy VALUES (4, 'thisone', 502, 23, 100.50, true, false, 'Fino');
INSERT INTO public.galaxy VALUES (5, 'thisone', 502, 23, 1.50, false, false, 'Gino');
INSERT INTO public.galaxy VALUES (6, 'thisone', 150, 233, 1.50, false, false, 'Uino');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'thisone', 150, 33, 1.50, false, false, 5, 'Phobos');
INSERT INTO public.moon VALUES (2, 'thisone', 150, 33, 1.50, false, false, 1, 'Nhobos');
INSERT INTO public.moon VALUES (3, 'thisone', 150, 33, 1.50, false, false, 1, 'Ahobos');
INSERT INTO public.moon VALUES (4, 'thisone', 150, 33, 1.50, false, false, 1, 'Ghobos');
INSERT INTO public.moon VALUES (5, 'thisone', 150, 33, 1.50, false, false, 1, 'Ggobos');
INSERT INTO public.moon VALUES (6, 'thisone', 150, 33, 1.50, false, false, 1, 'Fgobos');
INSERT INTO public.moon VALUES (7, 'thisone', 150, 33, 1.50, false, false, 2, 'Minos4');
INSERT INTO public.moon VALUES (8, 'thisone', 150, 33, 1.50, false, false, 2, 'Minos3');
INSERT INTO public.moon VALUES (9, 'thisone', 150, 33, 1.50, false, false, 2, 'Minos5');
INSERT INTO public.moon VALUES (10, 'thisone', 150, 33, 1.50, false, false, 2, 'Minos8');
INSERT INTO public.moon VALUES (11, 'thisone', 150, 33, 1.50, false, false, 2, 'Minos1');
INSERT INTO public.moon VALUES (12, 'thisone', 150, 33, 1.50, false, false, 5, 'Klas');
INSERT INTO public.moon VALUES (13, 'thisone', 150, 33, 1.50, false, false, 5, 'Llas');
INSERT INTO public.moon VALUES (14, 'thisone', 150, 33, 1.50, false, false, 5, 'Alas');
INSERT INTO public.moon VALUES (15, 'thisone', 150, 33, 1.50, false, false, 6, 'Jup');
INSERT INTO public.moon VALUES (16, 'thisone', 150, 33, 1.50, false, false, 6, 'Pup');
INSERT INTO public.moon VALUES (17, 'thisone', 150, 33, 1.50, false, false, 6, 'Fup');
INSERT INTO public.moon VALUES (18, 'thisone', 150, 33, 1.50, false, false, 4, 'Tonos');
INSERT INTO public.moon VALUES (19, 'thisone', 150, 33, 1.50, false, false, 4, 'Gonos');
INSERT INTO public.moon VALUES (20, 'thisone', 150, 33, 1.50, false, false, 4, 'Donos');
INSERT INTO public.moon VALUES (21, 'thisone', 150, 33, 1.50, false, false, 4, 'Yonos');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'thisone', 150, 33, 1.50, false, false, 1, 'Mars');
INSERT INTO public.planet VALUES (2, 'thisone', 150, 33, 1.50, false, false, 1, 'Mara');
INSERT INTO public.planet VALUES (3, 'thisone', 150, 33, 1.50, false, false, 1, 'Aara');
INSERT INTO public.planet VALUES (4, 'thisone', 150, 33, 1.50, false, false, 1, 'Gara');
INSERT INTO public.planet VALUES (5, 'thisone', 150, 33, 1.50, false, false, 1, 'Jara');
INSERT INTO public.planet VALUES (6, 'thisone', 150, 33, 1.50, false, false, 1, 'Lara');
INSERT INTO public.planet VALUES (7, 'thisone', 150, 33, 1.50, false, false, 1, 'Para');
INSERT INTO public.planet VALUES (8, 'thisone', 150, 33, 1.50, false, false, 1, 'Iara');
INSERT INTO public.planet VALUES (9, 'thisone', 150, 33, 1.50, false, false, 2, 'Venus');
INSERT INTO public.planet VALUES (10, 'thisone', 150, 33, 1.50, false, false, 2, 'Eenus');
INSERT INTO public.planet VALUES (11, 'thisone', 150, 33, 1.50, false, false, 2, 'Tenus');
INSERT INTO public.planet VALUES (12, 'thisone', 150, 33, 1.50, false, false, 2, 'Henus');
INSERT INTO public.planet VALUES (13, 'thisone', 150, 33, 1.50, false, false, 4, 'Kil');
INSERT INTO public.planet VALUES (14, 'thisone', 150, 33, 1.50, false, false, 6, 'Bin');
INSERT INTO public.planet VALUES (15, 'thisone', 150, 33, 1.50, false, false, 6, 'Min');
INSERT INTO public.planet VALUES (16, 'thisone', 150, 33, 1.50, false, false, 5, 'Pin');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'thisone', 150, 233, 1.50, false, false, 1, 'Hana');
INSERT INTO public.star VALUES (2, 'thisone', 150, 233, 1.50, false, false, 1, 'Mana');
INSERT INTO public.star VALUES (3, 'thisone', 150, 233, 1.50, false, false, 3, 'Aana');
INSERT INTO public.star VALUES (4, 'thisone', 150, 33, 1.50, false, false, 2, 'Fana');
INSERT INTO public.star VALUES (5, 'thisone', 150, 33, 1.50, false, false, 4, 'Kana');
INSERT INTO public.star VALUES (6, 'thisone', 150, 33, 1.50, false, false, 6, 'Oana');


--
-- Name: black_holes_black_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_black_id_seq', 33, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_holes black_holes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_name_key UNIQUE (name);


--
-- Name: black_holes black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_holes
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_holes_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

