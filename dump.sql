--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

-- Started on 2019-02-20 00:30:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 25929)
-- Name: episode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.episode (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    number integer NOT NULL,
    related_show character varying(25) NOT NULL,
    related_season character varying(25) NOT NULL,
    long_description character varying(25),
    short_description character varying(25),
    image bytea,
    date_of_publish date NOT NULL,
    modify_date date,
    video_url character varying(100),
    "user's_rating" real
);


ALTER TABLE public.episode OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 25919)
-- Name: season; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.season (
    id integer NOT NULL,
    season_name character varying(25) NOT NULL,
    season_number integer NOT NULL,
    related_show character varying(25) NOT NULL,
    long_description character varying(25) NOT NULL,
    short_description character varying(25) NOT NULL,
    image bytea,
    date_of_publish date NOT NULL,
    last_modify_date date,
    video_url character varying(100),
    "user's_rating" real
);


ALTER TABLE public.season OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 25908)
-- Name: show; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.show (
    id integer NOT NULL,
    title character varying(25) NOT NULL,
    subtitle character varying(25) NOT NULL,
    date_of_start date NOT NULL,
    poster_image bytea,
    long_description character varying(25) NOT NULL,
    short_description character varying(25) NOT NULL,
    priority integer NOT NULL,
    date_of_publish date NOT NULL,
    video_url character varying(100),
    "user's_rating" real,
    last_modify_date date
);


ALTER TABLE public.show OWNER TO postgres;

--
-- TOC entry 2114 (class 0 OID 25929)
-- Dependencies: 183
-- Data for Name: episode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.episode (id, name, number, related_show, related_season, long_description, short_description, image, date_of_publish, modify_date, video_url, "user's_rating") FROM stdin;
1	pilot	1	breaking bad	1	first episode	1st episode	\N	2019-02-20	2019-02-20	not yet	10
\.


--
-- TOC entry 2113 (class 0 OID 25919)
-- Dependencies: 182
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.season (id, season_name, season_number, related_show, long_description, short_description, image, date_of_publish, last_modify_date, video_url, "user's_rating") FROM stdin;
1	first	1	breaking bad	first season	1st season	\N	2019-02-20	2019-02-20	not ready	10
\.


--
-- TOC entry 2112 (class 0 OID 25908)
-- Dependencies: 181
-- Data for Name: show; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.show (id, title, subtitle, date_of_start, poster_image, long_description, short_description, priority, date_of_publish, video_url, "user's_rating", last_modify_date) FROM stdin;
1	breaking bad	go cook	2008-01-20	\N	American story about a ma	good movie	1	2019-02-20	not ready yet	10	2019-02-20
\.


--
-- TOC entry 1995 (class 2606 OID 25966)
-- Name: episode_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.episode
    ADD CONSTRAINT episode_id PRIMARY KEY (id);


--
-- TOC entry 1993 (class 2606 OID 25968)
-- Name: season_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.season
    ADD CONSTRAINT season_id PRIMARY KEY (id);


--
-- TOC entry 1991 (class 2606 OID 25970)
-- Name: show_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT show_id PRIMARY KEY (id);


--
-- TOC entry 1997 (class 2606 OID 25971)
-- Name: has; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.season
    ADD CONSTRAINT has FOREIGN KEY (id) REFERENCES public.episode(id);


--
-- TOC entry 1996 (class 2606 OID 25981)
-- Name: has; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.show
    ADD CONSTRAINT has FOREIGN KEY (id) REFERENCES public.season(id);


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-02-20 00:30:31

--
-- PostgreSQL database dump complete
--

