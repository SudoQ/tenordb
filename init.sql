--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.scalepatternnote DROP CONSTRAINT scalepatternnote_sp_id_fkey;
ALTER TABLE ONLY public.scalepatternnote DROP CONSTRAINT scalepatternnote_rn_id_fkey;
ALTER TABLE ONLY public.scalenote DROP CONSTRAINT scalenote_s_id_fkey;
ALTER TABLE ONLY public.scalenote DROP CONSTRAINT scalenote_rn_id_fkey;
ALTER TABLE ONLY public.scalenote DROP CONSTRAINT scalenote_an_id_fkey;
ALTER TABLE ONLY public.scale DROP CONSTRAINT scale_sp_id_fkey;
ALTER TABLE ONLY public.scale DROP CONSTRAINT scale_root_an_id_fkey;
ALTER TABLE ONLY public.chordpatternnote DROP CONSTRAINT chordpatternnote_rn_id_fkey;
ALTER TABLE ONLY public.chordpatternnote DROP CONSTRAINT chordpatternnote_cp_id_fkey;
ALTER TABLE ONLY public.chordnote DROP CONSTRAINT chordnote_rn_id_fkey;
ALTER TABLE ONLY public.chordnote DROP CONSTRAINT chordnote_c_id_fkey;
ALTER TABLE ONLY public.chordnote DROP CONSTRAINT chordnote_an_id_fkey;
ALTER TABLE ONLY public.chord DROP CONSTRAINT chord_root_an_id_fkey;
ALTER TABLE ONLY public.chord DROP CONSTRAINT chord_cp_id_fkey;
ALTER TABLE ONLY public.scalepattern DROP CONSTRAINT scalepattern_pkey;
ALTER TABLE ONLY public.scale DROP CONSTRAINT scale_pkey;
ALTER TABLE ONLY public.relnote DROP CONSTRAINT relnote_pkey;
ALTER TABLE ONLY public.chordpattern DROP CONSTRAINT chordpattern_pkey;
ALTER TABLE ONLY public.chord DROP CONSTRAINT chord_pkey;
ALTER TABLE ONLY public.absnote DROP CONSTRAINT absnote_pkey;
DROP TABLE public.scalepatternnote;
DROP TABLE public.scalepattern;
DROP TABLE public.scalenote;
DROP TABLE public.scale;
DROP TABLE public.relnote;
DROP TABLE public.chordpatternnote;
DROP TABLE public.chordpattern;
DROP TABLE public.chordnote;
DROP TABLE public.chord;
DROP TABLE public.absnote;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: absnote; Type: TABLE; Schema: public; Owner: simon; Tablespace: 
--

CREATE TABLE absnote (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.absnote OWNER TO simon;

--
-- Name: chord; Type: TABLE; Schema: public; Owner: simon; Tablespace: 
--

CREATE TABLE chord (
    id integer NOT NULL,
    cp_id integer NOT NULL,
    root_an_id integer NOT NULL
);


ALTER TABLE public.chord OWNER TO simon;

--
-- Name: chordnote; Type: TABLE; Schema: public; Owner: simon; Tablespace: 
--

CREATE TABLE chordnote (
    an_id integer NOT NULL,
    rn_id integer NOT NULL,
    c_id integer NOT NULL
);


ALTER TABLE public.chordnote OWNER TO simon;

--
-- Name: chordpattern; Type: TABLE; Schema: public; Owner: simon; Tablespace: 
--

CREATE TABLE chordpattern (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.chordpattern OWNER TO simon;

--
-- Name: chordpatternnote; Type: TABLE; Schema: public; Owner: simon; Tablespace: 
--

CREATE TABLE chordpatternnote (
    cp_id integer NOT NULL,
    rn_id integer NOT NULL
);


ALTER TABLE public.chordpatternnote OWNER TO simon;

--
-- Name: relnote; Type: TABLE; Schema: public; Owner: simon; Tablespace: 
--

CREATE TABLE relnote (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.relnote OWNER TO simon;

--
-- Name: scale; Type: TABLE; Schema: public; Owner: simon; Tablespace: 
--

CREATE TABLE scale (
    id integer NOT NULL,
    sp_id integer NOT NULL,
    root_an_id integer NOT NULL
);


ALTER TABLE public.scale OWNER TO simon;

--
-- Name: scalenote; Type: TABLE; Schema: public; Owner: simon; Tablespace: 
--

CREATE TABLE scalenote (
    an_id integer NOT NULL,
    rn_id integer NOT NULL,
    s_id integer NOT NULL
);


ALTER TABLE public.scalenote OWNER TO simon;

--
-- Name: scalepattern; Type: TABLE; Schema: public; Owner: simon; Tablespace: 
--

CREATE TABLE scalepattern (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.scalepattern OWNER TO simon;

--
-- Name: scalepatternnote; Type: TABLE; Schema: public; Owner: simon; Tablespace: 
--

CREATE TABLE scalepatternnote (
    sp_id integer NOT NULL,
    rn_id integer NOT NULL
);


ALTER TABLE public.scalepatternnote OWNER TO simon;

--
-- Data for Name: absnote; Type: TABLE DATA; Schema: public; Owner: simon
--

COPY absnote (id, name) FROM stdin;
0	C
1	Db
2	D
3	Eb
4	E
5	F
6	Gb
7	G
8	Ab
9	A
10	Bb
11	B
\.


--
-- Data for Name: chord; Type: TABLE DATA; Schema: public; Owner: simon
--

COPY chord (id, cp_id, root_an_id) FROM stdin;
0	0	0
1	0	1
2	0	2
3	0	3
4	0	4
5	0	5
6	0	6
7	0	7
8	0	8
9	0	9
10	0	10
11	0	11
12	1	0
13	1	1
14	1	2
15	1	3
16	1	4
17	1	5
18	1	6
19	1	7
20	1	8
21	1	9
22	1	10
23	1	11
24	2	0
25	2	1
26	2	2
27	2	3
28	2	4
29	2	5
30	2	6
31	2	7
32	2	8
33	2	9
34	2	10
35	2	11
36	3	0
37	3	1
38	3	2
39	3	3
40	3	4
41	3	5
42	3	6
43	3	7
44	3	8
45	3	9
46	3	10
47	3	11
48	4	0
49	4	1
50	4	2
51	4	3
52	4	4
53	4	5
54	4	6
55	4	7
56	4	8
57	4	9
58	4	10
59	4	11
\.


--
-- Data for Name: chordnote; Type: TABLE DATA; Schema: public; Owner: simon
--

COPY chordnote (an_id, rn_id, c_id) FROM stdin;
0	0	0
4	4	0
7	7	0
1	0	1
5	4	1
8	7	1
2	0	2
6	4	2
9	7	2
3	0	3
7	4	3
10	7	3
4	0	4
8	4	4
11	7	4
5	0	5
9	4	5
0	7	5
6	0	6
10	4	6
1	7	6
7	0	7
11	4	7
2	7	7
8	0	8
0	4	8
3	7	8
9	0	9
1	4	9
4	7	9
10	0	10
2	4	10
5	7	10
11	0	11
3	4	11
6	7	11
0	0	12
3	3	12
7	7	12
1	0	13
4	3	13
8	7	13
2	0	14
5	3	14
9	7	14
3	0	15
6	3	15
10	7	15
4	0	16
7	3	16
11	7	16
5	0	17
8	3	17
0	7	17
6	0	18
9	3	18
1	7	18
7	0	19
10	3	19
2	7	19
8	0	20
11	3	20
3	7	20
9	0	21
0	3	21
4	7	21
10	0	22
1	3	22
5	7	22
11	0	23
2	3	23
6	7	23
0	0	24
4	4	24
7	7	24
10	10	24
1	0	25
5	4	25
8	7	25
11	10	25
2	0	26
6	4	26
9	7	26
0	10	26
3	0	27
7	4	27
10	7	27
1	10	27
4	0	28
8	4	28
11	7	28
2	10	28
5	0	29
9	4	29
0	7	29
3	10	29
6	0	30
10	4	30
1	7	30
4	10	30
7	0	31
11	4	31
2	7	31
5	10	31
8	0	32
0	4	32
3	7	32
6	10	32
9	0	33
1	4	33
4	7	33
7	10	33
10	0	34
2	4	34
5	7	34
8	10	34
11	0	35
3	4	35
6	7	35
9	10	35
0	0	36
4	4	36
7	7	36
11	11	36
1	0	37
5	4	37
8	7	37
0	11	37
2	0	38
6	4	38
9	7	38
1	11	38
3	0	39
7	4	39
10	7	39
2	11	39
4	0	40
8	4	40
11	7	40
3	11	40
5	0	41
9	4	41
0	7	41
4	11	41
6	0	42
10	4	42
1	7	42
5	11	42
7	0	43
11	4	43
2	7	43
6	11	43
8	0	44
0	4	44
3	7	44
7	11	44
9	0	45
1	4	45
4	7	45
8	11	45
10	0	46
2	4	46
5	7	46
9	11	46
11	0	47
3	4	47
6	7	47
10	11	47
0	0	48
3	3	48
7	7	48
10	10	48
1	0	49
4	3	49
8	7	49
11	10	49
2	0	50
5	3	50
9	7	50
0	10	50
3	0	51
6	3	51
10	7	51
1	10	51
4	0	52
7	3	52
11	7	52
2	10	52
5	0	53
8	3	53
0	7	53
3	10	53
6	0	54
9	3	54
1	7	54
4	10	54
7	0	55
10	3	55
2	7	55
5	10	55
8	0	56
11	3	56
3	7	56
6	10	56
9	0	57
0	3	57
4	7	57
7	10	57
10	0	58
1	3	58
5	7	58
8	10	58
11	0	59
2	3	59
6	7	59
9	10	59
\.


--
-- Data for Name: chordpattern; Type: TABLE DATA; Schema: public; Owner: simon
--

COPY chordpattern (id, name) FROM stdin;
0	major
1	minor
2	7
3	maj7
4	m7
\.


--
-- Data for Name: chordpatternnote; Type: TABLE DATA; Schema: public; Owner: simon
--

COPY chordpatternnote (cp_id, rn_id) FROM stdin;
0	0
0	4
0	7
1	0
1	3
1	7
2	0
2	4
2	7
2	10
3	0
3	4
3	7
3	11
4	0
4	3
4	7
4	10
\.


--
-- Data for Name: relnote; Type: TABLE DATA; Schema: public; Owner: simon
--

COPY relnote (id, name) FROM stdin;
0	
1	
2	
3	
4	
5	
6	
7	
8	
9	
10	
11	
\.


--
-- Data for Name: scale; Type: TABLE DATA; Schema: public; Owner: simon
--

COPY scale (id, sp_id, root_an_id) FROM stdin;
0	0	0
1	0	1
2	0	2
3	0	3
4	0	4
5	0	5
6	0	6
7	0	7
8	0	8
9	0	9
10	0	10
11	0	11
12	1	0
13	1	1
14	1	2
15	1	3
16	1	4
17	1	5
18	1	6
19	1	7
20	1	8
21	1	9
22	1	10
23	1	11
\.


--
-- Data for Name: scalenote; Type: TABLE DATA; Schema: public; Owner: simon
--

COPY scalenote (an_id, rn_id, s_id) FROM stdin;
0	0	0
2	2	0
4	4	0
5	5	0
7	7	0
9	9	0
11	11	0
1	0	1
3	2	1
5	4	1
6	5	1
8	7	1
10	9	1
0	11	1
2	0	2
4	2	2
6	4	2
7	5	2
9	7	2
11	9	2
1	11	2
3	0	3
5	2	3
7	4	3
8	5	3
10	7	3
0	9	3
2	11	3
4	0	4
6	2	4
8	4	4
9	5	4
11	7	4
1	9	4
3	11	4
5	0	5
7	2	5
9	4	5
10	5	5
0	7	5
2	9	5
4	11	5
6	0	6
8	2	6
10	4	6
11	5	6
1	7	6
3	9	6
5	11	6
7	0	7
9	2	7
11	4	7
0	5	7
2	7	7
4	9	7
6	11	7
8	0	8
10	2	8
0	4	8
1	5	8
3	7	8
5	9	8
7	11	8
9	0	9
11	2	9
1	4	9
2	5	9
4	7	9
6	9	9
8	11	9
10	0	10
0	2	10
2	4	10
3	5	10
5	7	10
7	9	10
9	11	10
11	0	11
1	2	11
3	4	11
4	5	11
6	7	11
8	9	11
10	11	11
0	0	12
2	2	12
3	3	12
5	5	12
7	7	12
8	8	12
10	10	12
1	0	13
3	2	13
4	3	13
6	5	13
8	7	13
9	8	13
11	10	13
2	0	14
4	2	14
5	3	14
7	5	14
9	7	14
10	8	14
0	10	14
3	0	15
5	2	15
6	3	15
8	5	15
10	7	15
11	8	15
1	10	15
4	0	16
6	2	16
7	3	16
9	5	16
11	7	16
0	8	16
2	10	16
5	0	17
7	2	17
8	3	17
10	5	17
0	7	17
1	8	17
3	10	17
6	0	18
8	2	18
9	3	18
11	5	18
1	7	18
2	8	18
4	10	18
7	0	19
9	2	19
10	3	19
0	5	19
2	7	19
3	8	19
5	10	19
8	0	20
10	2	20
11	3	20
1	5	20
3	7	20
4	8	20
6	10	20
9	0	21
11	2	21
0	3	21
2	5	21
4	7	21
5	8	21
7	10	21
10	0	22
0	2	22
1	3	22
3	5	22
5	7	22
6	8	22
8	10	22
11	0	23
1	2	23
2	3	23
4	5	23
6	7	23
7	8	23
9	10	23
\.


--
-- Data for Name: scalepattern; Type: TABLE DATA; Schema: public; Owner: simon
--

COPY scalepattern (id, name) FROM stdin;
0	major
1	minor
\.


--
-- Data for Name: scalepatternnote; Type: TABLE DATA; Schema: public; Owner: simon
--

COPY scalepatternnote (sp_id, rn_id) FROM stdin;
0	0
0	2
0	4
0	5
0	7
0	9
0	11
1	0
1	2
1	3
1	5
1	7
1	8
1	10
\.


--
-- Name: absnote_pkey; Type: CONSTRAINT; Schema: public; Owner: simon; Tablespace: 
--

ALTER TABLE ONLY absnote
    ADD CONSTRAINT absnote_pkey PRIMARY KEY (id);


--
-- Name: chord_pkey; Type: CONSTRAINT; Schema: public; Owner: simon; Tablespace: 
--

ALTER TABLE ONLY chord
    ADD CONSTRAINT chord_pkey PRIMARY KEY (id);


--
-- Name: chordpattern_pkey; Type: CONSTRAINT; Schema: public; Owner: simon; Tablespace: 
--

ALTER TABLE ONLY chordpattern
    ADD CONSTRAINT chordpattern_pkey PRIMARY KEY (id);


--
-- Name: relnote_pkey; Type: CONSTRAINT; Schema: public; Owner: simon; Tablespace: 
--

ALTER TABLE ONLY relnote
    ADD CONSTRAINT relnote_pkey PRIMARY KEY (id);


--
-- Name: scale_pkey; Type: CONSTRAINT; Schema: public; Owner: simon; Tablespace: 
--

ALTER TABLE ONLY scale
    ADD CONSTRAINT scale_pkey PRIMARY KEY (id);


--
-- Name: scalepattern_pkey; Type: CONSTRAINT; Schema: public; Owner: simon; Tablespace: 
--

ALTER TABLE ONLY scalepattern
    ADD CONSTRAINT scalepattern_pkey PRIMARY KEY (id);


--
-- Name: chord_cp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY chord
    ADD CONSTRAINT chord_cp_id_fkey FOREIGN KEY (cp_id) REFERENCES chordpattern(id);


--
-- Name: chord_root_an_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY chord
    ADD CONSTRAINT chord_root_an_id_fkey FOREIGN KEY (root_an_id) REFERENCES absnote(id);


--
-- Name: chordnote_an_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY chordnote
    ADD CONSTRAINT chordnote_an_id_fkey FOREIGN KEY (an_id) REFERENCES absnote(id);


--
-- Name: chordnote_c_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY chordnote
    ADD CONSTRAINT chordnote_c_id_fkey FOREIGN KEY (c_id) REFERENCES chord(id);


--
-- Name: chordnote_rn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY chordnote
    ADD CONSTRAINT chordnote_rn_id_fkey FOREIGN KEY (rn_id) REFERENCES relnote(id);


--
-- Name: chordpatternnote_cp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY chordpatternnote
    ADD CONSTRAINT chordpatternnote_cp_id_fkey FOREIGN KEY (cp_id) REFERENCES chordpattern(id);


--
-- Name: chordpatternnote_rn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY chordpatternnote
    ADD CONSTRAINT chordpatternnote_rn_id_fkey FOREIGN KEY (rn_id) REFERENCES relnote(id);


--
-- Name: scale_root_an_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY scale
    ADD CONSTRAINT scale_root_an_id_fkey FOREIGN KEY (root_an_id) REFERENCES absnote(id);


--
-- Name: scale_sp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY scale
    ADD CONSTRAINT scale_sp_id_fkey FOREIGN KEY (sp_id) REFERENCES scalepattern(id);


--
-- Name: scalenote_an_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY scalenote
    ADD CONSTRAINT scalenote_an_id_fkey FOREIGN KEY (an_id) REFERENCES absnote(id);


--
-- Name: scalenote_rn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY scalenote
    ADD CONSTRAINT scalenote_rn_id_fkey FOREIGN KEY (rn_id) REFERENCES relnote(id);


--
-- Name: scalenote_s_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY scalenote
    ADD CONSTRAINT scalenote_s_id_fkey FOREIGN KEY (s_id) REFERENCES scale(id);


--
-- Name: scalepatternnote_rn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY scalepatternnote
    ADD CONSTRAINT scalepatternnote_rn_id_fkey FOREIGN KEY (rn_id) REFERENCES relnote(id);


--
-- Name: scalepatternnote_sp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: simon
--

ALTER TABLE ONLY scalepatternnote
    ADD CONSTRAINT scalepatternnote_sp_id_fkey FOREIGN KEY (sp_id) REFERENCES scalepattern(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

