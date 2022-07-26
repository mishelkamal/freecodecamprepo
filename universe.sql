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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    galaxy_types character varying(30),
    distance_from_earth_in_light_years numeric,
    no_of_stars_in_billion integer,
    has_life boolean
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_million_kms numeric,
    orbital_period_in_days integer,
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_discovery; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_discovery (
    moon_discovery_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discoverer character varying(30) NOT NULL,
    year_of_discovery integer,
    moon_id integer
);


ALTER TABLE public.moon_discovery OWNER TO freecodecamp;

--
-- Name: moon_discovery_moon_discovery_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_discovery_moon_discovery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_discovery_moon_discovery_id_seq OWNER TO freecodecamp;

--
-- Name: moon_discovery_moon_discovery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_discovery_moon_discovery_id_seq OWNED BY public.moon_discovery.moon_discovery_id;


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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_type character varying(30),
    distance_from_earth_in_million_kms numeric,
    no_of_moons integer,
    has_life boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_light_years numeric,
    no_of_planets_orbiting integer,
    has_life boolean,
    galaxy_id integer
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
-- Name: moon_discovery moon_discovery_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_discovery ALTER COLUMN moon_discovery_id SET DEFAULT nextval('public.moon_discovery_moon_discovery_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing the Sun and its Solar System and therefore Earth', false, 13000, 'barred spiral galaxy', 26000, 300, true);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 'Visible only from the southern hemisphere is also the brightest patch of nebulosity in the sky', false, 13000, 'satellite dwarf galaxy', 158200, 30, false);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'Visible only from the southern hemisphere', false, 6500, 'satellite dwarf galaxy', 199000, 3, false);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 'Once called the Great Andromeda Nebula it is situated in the Andromeda constellation', false, 10000, 'great spiral galaxy', 2537000, 1000, false);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Being a diffuse object its visibility is strongly affected by even small amounts of light pollution', false, NULL, 'Spiral galaxy', 2723000, 40, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Centaurus A has been spotted with the naked eye by Stephen James', false, 13000, 'massive elliptical galaxy', 130500, NULL, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon is Earths only natural satellite', true, 4530, 0.384, 28, false, 3);
INSERT INTO public.moon VALUES (2, 'Europa', 'is the smallest of the four Galilean moons orbiting Jupiter', true, 4503, 628, 4, false, 5);
INSERT INTO public.moon VALUES (3, 'Titan', 'Titan is the largest moon of Saturn', true, 4003, 1000, 16, false, 6);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'satellite of Jupiter', true, 4503, 628.3, 7, false, 5);
INSERT INTO public.moon VALUES (5, 'Io', 'satellite of Jupiter', true, 4503, 628.3, 2, false, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 'satellite of Jupiter', true, 4503, 628.3, 17, false, 5);
INSERT INTO public.moon VALUES (7, 'Triton', 'satellite of Neptune', true, 4503, 4338, 6, false, 8);
INSERT INTO public.moon VALUES (8, 'Mimas', 'satellite of Saturn', true, 4530, 1272, 1, false, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'satellite of Saturn', true, 4530, 1272, 2, false, 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'satellite of Saturn', true, 4567, 1272, 80, false, 6);
INSERT INTO public.moon VALUES (11, 'Epimetheus', 'satellite of Saturn', true, 4567, 1272, 1, false, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 'satellite of Saturn', true, 4567, 1272, 3, false, 6);
INSERT INTO public.moon VALUES (13, 'Amalthea', 'satellite of Jupiter', true, 4503, 628.3, 1, false, 5);
INSERT INTO public.moon VALUES (14, 'Tethys', 'satellite of Saturn', true, 4567, 1272, 2, false, 6);
INSERT INTO public.moon VALUES (15, 'Phobos', 'satellite of Mars', true, 4503, 77.79, 1, false, 4);
INSERT INTO public.moon VALUES (16, 'Himalia', 'satellite of Jupiter', true, 4503, 628.3, 248, false, 5);
INSERT INTO public.moon VALUES (17, 'Daphnis', 'satellite of Saturn', true, 4567, 1272, 1, false, 6);
INSERT INTO public.moon VALUES (18, 'Elara', 'satellite of Jupiter', true, 4530, 1272, 259, false, 5);
INSERT INTO public.moon VALUES (19, 'Ananke', 'satellite of Jupiter', true, 4530, 1272, 630, false, 5);
INSERT INTO public.moon VALUES (20, 'Deimos', 'satellite of Mars', true, 4503, 77.79, 2, false, 4);


--
-- Data for Name: moon_discovery; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_discovery VALUES (1, 'Europa', ' Galileo Galilei ', 1610, 5);
INSERT INTO public.moon_discovery VALUES (2, 'Titan', 'Christiaan Huygens', 1655, 6);
INSERT INTO public.moon_discovery VALUES (3, 'Ganymede', ' Galileo Galilei ', 1610, 5);
INSERT INTO public.moon_discovery VALUES (4, 'Io', ' Galileo Galilei ', 1610, 5);
INSERT INTO public.moon_discovery VALUES (5, 'Callisto', ' Galileo Galilei ', 1610, 5);
INSERT INTO public.moon_discovery VALUES (6, 'Triton', 'William Lassell', 1846, 8);
INSERT INTO public.moon_discovery VALUES (7, 'Mimas', 'William Herschel', 1789, 6);
INSERT INTO public.moon_discovery VALUES (8, 'Enceladus', 'William Herschel', 1789, 6);
INSERT INTO public.moon_discovery VALUES (9, 'Iapetus', '  G. D. Cassini', 1671, 6);
INSERT INTO public.moon_discovery VALUES (10, 'Epimetheus', ' Richard Walker', 1966, 6);
INSERT INTO public.moon_discovery VALUES (11, 'Dione', '  G. D. Cassini', 1684, 6);
INSERT INTO public.moon_discovery VALUES (12, 'Amalthea', 'E. E. Barnard', 1892, 5);
INSERT INTO public.moon_discovery VALUES (13, 'Tethys', '  G. D. Cassini', 1684, 6);
INSERT INTO public.moon_discovery VALUES (14, 'Phobos', ' Asaph Hall ', 1877, 4);
INSERT INTO public.moon_discovery VALUES (15, 'Himalia', ' Charles D. Perrine', 1904, 5);
INSERT INTO public.moon_discovery VALUES (16, 'Daphnis', ' Cassini Imaging Science Team', 2005, 6);
INSERT INTO public.moon_discovery VALUES (17, 'Elara', ' Charles D. Perrine', 1905, 5);
INSERT INTO public.moon_discovery VALUES (18, 'Ananke', 'Seth B. Nicholson', 1951, 5);
INSERT INTO public.moon_discovery VALUES (19, 'Deimos', ' Asaph Hall ', 1877, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'smallest planet in the Solar System', true, 4503, 'terrestrial planet', 196.35, 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'the second planet from the Sun', true, 4503, 'terrestrial planet', 229.11, 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Earth is the third planet from the Sun', true, 4543, 'terrestrial planet', 0, 1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'fourth planet from the Sun', true, 4603, 'terrestrial planet', 174.8, 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is the fifth planet from the Sun', true, 4603, 'gas giant', 665.64, 53, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn is the sixth planet', true, 4503, 'gas giant', 1331.3, 53, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus is the seventh planet from the Sun', true, 4503, 'Ice Giant', 2981.4, 27, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Neptune is the eighth planet from the Sun', true, 4503, 'Ice Giant', 4378.6, 14, false, 1);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1b', 'Venus-like exoplanet', true, 7605, 'terrestrial planet', 39.46, 0, false, 2);
INSERT INTO public.planet VALUES (10, 'Proxima b', 'exoplanet orbiting in the habitable zone of the red dwarf', true, 4853, 'terrestrial planet', 40113, 0, false, 3);
INSERT INTO public.planet VALUES (11, 'Kepler-90 b', 'is the first seven planet system discovered by Kepler', true, 2000, 'terrestrial planet', 2835.8, 0, false, 5);
INSERT INTO public.planet VALUES (12, 'Tau Ceti f', 'super-Earth orbiting Tau Ceti', true, 5800, 'terrestrial planet', NULL, 0, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the only star in our solar system', true, 4603, 0.000015781, 8, false, 1);
INSERT INTO public.star VALUES (2, 'TRAPPIST-1', 'ultra-cool red dwarf star in the constellation Aquarius', true, 7600, 40.6, 7, false, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'small low-mass star', true, 4853, 4.25, 1, false, 1);
INSERT INTO public.star VALUES (4, 'Kepler-11', 'Sun-like star slightly larger than the Sun', true, 3200, 1679, 6, false, 1);
INSERT INTO public.star VALUES (5, 'Kepler-90', 'G type main sequence star located', true, 2000, 2544, 8, false, 1);
INSERT INTO public.star VALUES (6, 'Tau Ceti', 'single star in the constellation Cetus that is spectrally similar to the Sun', true, 5800, 11.9, 4, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_discovery_moon_discovery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_discovery_moon_discovery_id_seq', 19, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


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
-- Name: moon_discovery moon_discovery_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_discovery
    ADD CONSTRAINT moon_discovery_name_key UNIQUE (name);


--
-- Name: moon_discovery moon_discovery_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_discovery
    ADD CONSTRAINT moon_discovery_pkey PRIMARY KEY (moon_discovery_id);


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
-- Name: moon_discovery moon_discovery_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_discovery
    ADD CONSTRAINT moon_discovery_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

