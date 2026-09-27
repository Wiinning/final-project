--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    galaxy_type character varying(60) NOT NULL,
    description text NOT NULL,
    is_local_group boolean NOT NULL
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    mean_radius_km numeric(10,3) NOT NULL,
    discovery_year integer,
    description text NOT NULL,
    CONSTRAINT moon_mean_radius_km_check CHECK ((mean_radius_km > (0)::numeric))
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type_id integer NOT NULL,
    orbital_period_days numeric(12,4) NOT NULL,
    has_confirmed_life boolean DEFAULT false NOT NULL,
    description text NOT NULL,
    CONSTRAINT planet_orbital_period_days_check CHECK ((orbital_period_days > (0)::numeric))
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(30) NOT NULL,
    temperature_kelvin integer NOT NULL,
    description text NOT NULL,
    CONSTRAINT star_temperature_kelvin_check CHECK ((temperature_kelvin > 0))
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred spiral', 'Home galaxy of the Solar System.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Also known as M31; a major Local Group galaxy.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Also known as M33; a Local Group spiral galaxy.', true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Magellanic irregular', 'Satellite galaxy of the Milky Way.', true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Dwarf irregular', 'Nearby dwarf galaxy in the Local Group.', true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 'Also known as M51a; an interacting spiral galaxy.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.400, NULL, 'Earths natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.267, 1877, 'Larger and inner moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.200, 1877, 'Smaller and outer moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.600, 1610, 'Volcanically active Galilean moon.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.800, 1610, 'Icy Galilean moon with evidence for a subsurface ocean.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.100, 1610, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.300, 1610, 'Heavily cratered Galilean moon.');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2574.730, 1655, 'Largest moon of Saturn; has a thick atmosphere.');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252.100, 1789, 'Icy moon with water-rich plumes.');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198.200, 1789, 'Small moon with the large Herschel impact crater.');
INSERT INTO public.moon VALUES (11, 'Tethys', 6, 531.100, 1684, 'Icy moon with the large Odysseus crater.');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 561.400, 1684, 'Icy moon of Saturn with bright fractured terrain.');
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 763.800, 1672, 'Second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 734.500, 1671, 'Moon with strongly contrasting light and dark hemispheres.');
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 235.800, 1948, 'Small Uranian moon with varied terrain.');
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 578.900, 1851, 'Uranian moon with extensive canyon systems.');
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 584.700, 1851, 'Dark major moon of Uranus.');
INSERT INTO public.moon VALUES (18, 'Titania', 7, 788.900, 1787, 'Largest moon of Uranus.');
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 761.400, 1787, 'Outermost of the five major Uranian moons.');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 1353.400, 1846, 'Largest moon of Neptune; follows a retrograde orbit.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, 87.9691, false, 'Innermost planet of the Solar System.');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, 224.7010, false, 'Rocky planet with a dense carbon dioxide atmosphere.');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 365.2564, true, 'The only planet with confirmed life.');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, 686.9800, false, 'Rocky planet with two small moons.');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, 4332.5890, false, 'Largest planet in the Solar System.');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, 10759.2200, false, 'Gas giant surrounded by a prominent ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, 30688.5000, false, 'Ice giant with an extreme axial tilt.');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, 60182.0000, false, 'Outermost major planet of the Solar System.');
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1 b', 2, 1, 1.5109, false, 'Innermost known planet of TRAPPIST-1.');
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1 e', 2, 1, 6.0996, false, 'Earth-sized planet in the TRAPPIST-1 system.');
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 3, 1, 11.1860, false, 'Terrestrial-mass planet orbiting Proxima Centauri.');
INSERT INTO public.planet VALUES (12, 'Kepler-186 f', 4, 1, 129.9440, false, 'Earth-sized planet orbiting Kepler-186.');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planet with a predominantly solid surface.');
INSERT INTO public.planet_type VALUES (2, 'Gas giant', 'Giant planet composed mostly of hydrogen and helium.');
INSERT INTO public.planet_type VALUES (3, 'Ice giant', 'Giant planet enriched in heavier volatile substances.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2 V', 5772, 'The star at the center of the Solar System.');
INSERT INTO public.star VALUES (2, 'TRAPPIST-1', 1, 'M8 V', 2566, 'Ultracool dwarf with seven known terrestrial planets.');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 'M5.5 V', 3042, 'The nearest star to the Sun.');
INSERT INTO public.star VALUES (4, 'Kepler-186', 1, 'M1 V', 3755, 'Red dwarf hosting the planet Kepler-186 f.');
INSERT INTO public.star VALUES (5, 'Sirius A', 1, 'A1 V', 9940, 'The brighter star in the Sirius binary system.');
INSERT INTO public.star VALUES (6, 'Vega', 1, 'A0 V', 9602, 'Bright main-sequence star in Lyra.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

