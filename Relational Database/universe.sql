--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1+b1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1+b1)

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

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(32),
    type text,
    solar_mass_billions numeric,
    diameter_kpc numeric,
    kly_to_earth integer,
    millions_of_stars integer,
    contains_humans boolean NOT NULL,
    visible_naked_eye boolean NOT NULL
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
    planet_id integer NOT NULL,
    name character varying(32),
    alternative_names text,
    mass_eg integer,
    mean_radius_km integer,
    density_g_cm3 numeric,
    contains_humans boolean NOT NULL,
    visible_naked_eye boolean NOT NULL
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(32),
    type text,
    ngc_number integer,
    distance_ly integer,
    apparent_dimensions_minutes numeric,
    contains_humans boolean NOT NULL,
    visible_naked_eye boolean NOT NULL
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(32),
    alternative_names text,
    mass_zg integer,
    mean_radius_km integer,
    density_g_cm3 numeric,
    contains_humans boolean NOT NULL,
    visible_naked_eye boolean NOT NULL
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
    galaxy_id integer NOT NULL,
    name character varying(32),
    age_myr integer,
    spectral_type text,
    mass_solar numeric,
    distance_ly integer,
    radius_solar numeric,
    known_planets numeric,
    contains_humans boolean NOT NULL,
    visible_naked_eye boolean NOT NULL
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sb; Sbc; SB(rs)bc', 800, 26.8, 27, 250000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'SA(s)b', 1000, 46.56, 2500, 1000000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'SB(s)m', 10, 9.86, 160, 10000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'SB(s)m pec', 7, 5.78, 200, 200000, false, true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'SA(s)cd', 10, 18.74, 2730, 40000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Hoag''s Object', '(RP)E0 or (RP)SA0/a', 700, 36.79, 600000, 8000, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 'Luna, Cynthia, Selene', 73420000, 1737, 3.344, false, true);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 'Phobus', NULL, 11, 1.876, false, false);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 'Deimus', NULL, 6, 1.471, false, false);
INSERT INTO public.moon VALUES (4, 5, 'Io', 'Jupiter I', 89319380, 1822, 3.528, false, false);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 'Jupiter II', 47998440, 1561, 3.013, false, false);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 'Jupiter III', 148190000, 2634, 1.936, false, false);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 'Jupiter IV', 107593800, 2410, 1.8344, false, false);
INSERT INTO public.moon VALUES (8, 5, 'Amalthea', 'Jupiter V', 2080, 146, 0.857, false, false);
INSERT INTO public.moon VALUES (9, 5, 'Thebe', 'Jupiter XIV', NULL, 98, NULL, false, false);
INSERT INTO public.moon VALUES (10, 6, 'Titan', 'Saturni Luna', 134520000, 2575, 1.8798, false, false);
INSERT INTO public.moon VALUES (11, 6, 'Mimas', 'Saturn I', 37493, 198, 1.1479, false, false);
INSERT INTO public.moon VALUES (12, 6, 'Enceladus', 'Saturn II', 108022, 513, 1.609, false, false);
INSERT INTO public.moon VALUES (13, 6, 'Tethys', 'Saturn III', 617449, 1057, 0.984, false, false);
INSERT INTO public.moon VALUES (14, 6, 'Dione', 'Saturn IV', 1095452, 1122, 1.478, false, false);
INSERT INTO public.moon VALUES (15, 6, 'Rhea', 'Saturn V', 2306518, 1525, 1.236, false, false);
INSERT INTO public.moon VALUES (16, 6, 'Iapetus', 'Saturn VIII', 1805635, 1492, 1.088, false, false);
INSERT INTO public.moon VALUES (17, 8, 'Triton', 'the satellite of Neptune', 21390000, 1353, 2.061, false, false);
INSERT INTO public.moon VALUES (18, 8, 'Proteus', 'Neptune VIII', 44000, 396, 1.3, false, false);
INSERT INTO public.moon VALUES (19, 8, 'Nereid', 'Neptune II', NULL, 357, NULL, false, false);
INSERT INTO public.moon VALUES (20, 8, 'Larissa', 'Neptune VII', 4200, 204, 1.2, false, false);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 1, 'Helix Nebula', 'Emission nebula', 7293, 655, 1500, false, false);
INSERT INTO public.nebula VALUES (2, 1, 'Cat''s Eye Nebula', 'Emission nebula', 6543, 3300, 20, false, false);
INSERT INTO public.nebula VALUES (3, 1, 'Ring Nebula', 'Emission nebula', 6720, 2567, 230, false, false);
INSERT INTO public.nebula VALUES (4, 1, 'Dumbbell Nebula', 'Emission nebula', 6853, 1360, 480, false, false);
INSERT INTO public.nebula VALUES (5, 1, 'Orion Nebula', 'Diffuse nebula', 1976, 1344, 3900, false, false);
INSERT INTO public.nebula VALUES (6, 1, 'Eagle Nebula', 'Emission nebula', 6611, 5700, 4500, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Stilbon, Hermes', 330, 2440, 5.427, false, true);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Jīn-xīng, Shukra', 4868, 6052, 5.243, false, true);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Gaia, Terra, Tellus', 5972, 6371, 5.514, true, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Ares, Nergal, The Red Planet', 642, 3390, 3.9335, false, true);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Zeus, Thor', 1898200, 69911, 1.326, false, true);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Cronus', 568340, 58232, 0.687, false, true);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Georgium Sidus, Herschel', 86810, 25362, 1.27, false, true);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', '海王星, Далайн ван, Ποσειδώνας', 102413, 24622, 1.638, false, false);
INSERT INTO public.planet VALUES (9, 3, 'PSR B1257+12 A', 'Draugr', 120, NULL, NULL, false, false);
INSERT INTO public.planet VALUES (10, 2, 'Proxima Centauri b', 'Alpha Centauri Cb', 6390, 8282, NULL, false, false);
INSERT INTO public.planet VALUES (11, 2, 'Proxima Centauri c', 'Proxima c, Alpha Centauri Cc', 41804, NULL, NULL, false, false);
INSERT INTO public.planet VALUES (12, 4, 'Kepler-62f', ' KOI-701.04', 16722, 8983, NULL, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 4600, 'G2V', 1, 0, 1, 8, true, true);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 4850, 'M5.5Ve', 0.12, 4, 0.15, 2, false, false);
INSERT INTO public.star VALUES (3, 1, 'PSR B1257+12', 2000, 'Pulsar', 1.4, 2300, 0.000015, 3, false, false);
INSERT INTO public.star VALUES (4, 1, 'Kepler-62', 9000, 'K2V', 0.69, 992, 0.64, 5, false, false);
INSERT INTO public.star VALUES (5, 1, 'Sirius', 245, 'A0mA1 Va', 2.063, 8, 1.711, 0, false, true);
INSERT INTO public.star VALUES (6, 1, 'Spica', 13, 'B1V', 11.43, 255, 7.47, 0, false, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


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
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

