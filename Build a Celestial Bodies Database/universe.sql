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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    description text,
    has_tail boolean NOT NULL,
    distance_from_earth numeric,
    age_in_millions_of_years integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    age_in_millions_of_years integer NOT NULL,
    description text,
    is_spherical boolean NOT NULL
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
    name character varying,
    planet_id integer,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer
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
    name character varying,
    star_id integer,
    planet_types text NOT NULL,
    distance_from_star numeric NOT NULL,
    has_life boolean
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
    name character varying,
    galaxy_id integer,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 'Most famous periodic comet, appears every 76 years.', true, 0.586, 4);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2, 'Bright comet visible to the naked eye in the 1990s.', true, 1.316, 2);
INSERT INTO public.comet VALUES (3, 'Comet NEOWISE', 3, 'Visible in 2020, won’t return for another 6,800 years.', true, 0.29, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000, 'Our home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1100, 'Next door neighbor', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000, 'Part of the local group', true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 2000, 'Contains a supermassive black hole', true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 2800, 'Known for its bright nucleus and large central bulge', true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 400, 'Classic spiral galaxy', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 4600);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, true, 4500);
INSERT INTO public.moon VALUES (4, 'Centauri Alpha I', 4, true, 1000);
INSERT INTO public.moon VALUES (5, 'Centauri Alpha II', 4, true, 1100);
INSERT INTO public.moon VALUES (6, 'Sirius Aa', 6, false, 600);
INSERT INTO public.moon VALUES (7, 'Sirius Ab', 6, true, 650);
INSERT INTO public.moon VALUES (8, 'Ganymede', 8, true, 4500);
INSERT INTO public.moon VALUES (9, 'Callisto', 8, true, 4400);
INSERT INTO public.moon VALUES (10, 'Io', 8, true, 4300);
INSERT INTO public.moon VALUES (11, 'Europa', 8, true, 4200);
INSERT INTO public.moon VALUES (12, 'Titan', 9, true, 4200);
INSERT INTO public.moon VALUES (13, 'Rhea', 9, true, 4100);
INSERT INTO public.moon VALUES (14, 'Iapetus', 9, false, 4000);
INSERT INTO public.moon VALUES (15, 'Dione', 9, true, 4000);
INSERT INTO public.moon VALUES (16, 'Triton', 7, true, 4500);
INSERT INTO public.moon VALUES (17, 'Nereid', 7, false, 4400);
INSERT INTO public.moon VALUES (18, 'Centauri Moon Alpha', 10, true, 2000);
INSERT INTO public.moon VALUES (19, 'Sirius B Moon I', 11, false, 3000);
INSERT INTO public.moon VALUES (20, 'AndroMoon Alpha', 12, true, 1200);
INSERT INTO public.moon VALUES (21, 'AndroMoon Beta', 12, true, 1300);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 1.5, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 'Terrestrial', 0.7, false);
INSERT INTO public.planet VALUES (4, 'Centauri Prime', 2, 'Gas Giant', 5, false);
INSERT INTO public.planet VALUES (5, 'Centauri Secunda', 2, 'Ice Giant', 8, false);
INSERT INTO public.planet VALUES (6, 'Sirius A I', 3, 'Gas Giant', 7, false);
INSERT INTO public.planet VALUES (7, 'Sirius A II', 3, 'Terrestrial', 4, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Gas Giant', 30, false);
INSERT INTO public.planet VALUES (9, 'Saturn', 1, 'Gas Giant', 9.5, false);
INSERT INTO public.planet VALUES (10, 'Jupiter', 1, 'Gas Giant', 5.2, false);
INSERT INTO public.planet VALUES (11, 'Centauri Tertius', 2, 'Ice Giant', 15, false);
INSERT INTO public.planet VALUES (12, 'Sirius B I', 3, 'Terrestrial', 2, false);
INSERT INTO public.planet VALUES (13, 'AndroPlanet Alpha', 5, 'Gas Giant', 10, true);
INSERT INTO public.planet VALUES (14, 'AndroPlanet Beta', 5, 'Ice Giant', 20, false);
INSERT INTO public.planet VALUES (15, 'M87Planet Alpha', 7, 'Gas Giant', 12, false);
INSERT INTO public.planet VALUES (16, 'M87Planet Beta', 7, 'Terrestrial', 7, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 500, 0, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 600, 4.37, false);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 200, 8.6, false);
INSERT INTO public.star VALUES (4, 'Nucleus of Andromeda', 2, 800, 2500000, false);
INSERT INTO public.star VALUES (5, 'AndroStar', 2, 1000, 2500500, true);
INSERT INTO public.star VALUES (6, 'NeptStar', 2, 300, 2500200, false);
INSERT INTO public.star VALUES (7, 'TriStar Alpha', 3, 900, 3000000, false);
INSERT INTO public.star VALUES (8, 'TriStar Beta', 3, 750, 3000100, true);
INSERT INTO public.star VALUES (9, 'M87* (Black hole)', 4, 1300, 53000000, false);
INSERT INTO public.star VALUES (10, 'Sombrero Nucleus', 5, 1100, 29000000, false);
INSERT INTO public.star VALUES (11, 'SomStar', 5, 600, 2900100, true);
INSERT INTO public.star VALUES (12, 'Whirl Alpha', 6, 300, 23000000, true);
INSERT INTO public.star VALUES (13, 'Whirl Beta', 6, 450, 2300200, false);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: comet comet_origin_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_origin_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

