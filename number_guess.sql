--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    secret_number integer NOT NULL,
    number_of_guesses integer,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.players.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (14, 283, 284, 60);
INSERT INTO public.games VALUES (15, 238, 239, 60);
INSERT INTO public.games VALUES (16, 381, 382, 61);
INSERT INTO public.games VALUES (17, 949, 950, 61);
INSERT INTO public.games VALUES (18, 325, 328, 60);
INSERT INTO public.games VALUES (19, 927, 928, 60);
INSERT INTO public.games VALUES (20, 382, 383, 60);
INSERT INTO public.games VALUES (21, 768, 769, 62);
INSERT INTO public.games VALUES (22, 949, 950, 62);
INSERT INTO public.games VALUES (23, 207, 208, 63);
INSERT INTO public.games VALUES (24, 906, 907, 63);
INSERT INTO public.games VALUES (25, 487, 490, 62);
INSERT INTO public.games VALUES (26, 483, 484, 62);
INSERT INTO public.games VALUES (27, 503, 504, 62);
INSERT INTO public.games VALUES (28, 55, 56, 64);
INSERT INTO public.games VALUES (29, 944, 945, 64);
INSERT INTO public.games VALUES (30, 461, 462, 65);
INSERT INTO public.games VALUES (31, 468, 469, 65);
INSERT INTO public.games VALUES (32, 724, 727, 64);
INSERT INTO public.games VALUES (33, 698, 699, 64);
INSERT INTO public.games VALUES (34, 632, 633, 64);
INSERT INTO public.games VALUES (35, 532, 533, 66);
INSERT INTO public.games VALUES (36, 74, 75, 66);
INSERT INTO public.games VALUES (37, 143, 144, 67);
INSERT INTO public.games VALUES (38, 360, 361, 67);
INSERT INTO public.games VALUES (39, 56, 59, 66);
INSERT INTO public.games VALUES (40, 874, 875, 66);
INSERT INTO public.games VALUES (41, 482, 483, 66);
INSERT INTO public.games VALUES (42, 494, 11, 68);
INSERT INTO public.games VALUES (43, 859, 14, 69);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (60, 'user_1725022257301');
INSERT INTO public.players VALUES (61, 'user_1725022257300');
INSERT INTO public.players VALUES (62, 'user_1725022309617');
INSERT INTO public.players VALUES (63, 'user_1725022309616');
INSERT INTO public.players VALUES (64, 'user_1725022353406');
INSERT INTO public.players VALUES (65, 'user_1725022353405');
INSERT INTO public.players VALUES (66, 'user_1725022407614');
INSERT INTO public.players VALUES (67, 'user_1725022407613');
INSERT INTO public.players VALUES (68, 'J');
INSERT INTO public.players VALUES (69, 'T');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 43, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 69, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: players users_user_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT users_user_name_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.players(user_id);


--
-- PostgreSQL database dump complete
--

