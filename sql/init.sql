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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: absnote; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE absnote (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: chord; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chord (
    id integer NOT NULL,
    cp_id integer NOT NULL,
    root_an_id integer NOT NULL
);


--
-- Name: chordnote; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chordnote (
    an_id integer NOT NULL,
    rn_id integer NOT NULL,
    c_id integer NOT NULL
);


--
-- Name: chordpattern; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chordpattern (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: chordpatternnote; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE chordpatternnote (
    cp_id integer NOT NULL,
    rn_id integer NOT NULL
);


--
-- Name: relnote; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE relnote (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: scale; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE scale (
    id integer NOT NULL,
    sp_id integer NOT NULL,
    root_an_id integer NOT NULL
);


--
-- Name: scalenote; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE scalenote (
    an_id integer NOT NULL,
    rn_id integer NOT NULL,
    s_id integer NOT NULL
);


--
-- Name: scalepattern; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE scalepattern (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: scalepatternnote; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE scalepatternnote (
    sp_id integer NOT NULL,
    rn_id integer NOT NULL
);


--
-- Data for Name: absnote; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: chord; Type: TABLE DATA; Schema: public; Owner: -
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
48	6	0
49	6	1
50	6	2
51	6	3
52	6	4
53	6	5
54	6	6
55	6	7
56	6	8
57	6	9
58	6	10
59	6	11
60	8	0
61	8	1
62	8	2
63	8	3
64	8	4
65	8	5
66	8	6
67	8	7
68	8	8
69	8	9
70	8	10
71	8	11
72	9	0
73	9	1
74	9	2
75	9	3
76	9	4
77	9	5
78	9	6
79	9	7
80	9	8
81	9	9
82	9	10
83	9	11
84	17	0
85	17	1
86	17	2
87	17	3
88	17	4
89	17	5
90	17	6
91	17	7
92	17	8
93	17	9
94	17	10
95	17	11
96	20	0
97	20	1
98	20	2
99	20	3
100	20	4
101	20	5
102	20	6
103	20	7
104	20	8
105	20	9
106	20	10
107	20	11
108	22	0
109	22	1
110	22	2
111	22	3
112	22	4
113	22	5
114	22	6
115	22	7
116	22	8
117	22	9
118	22	10
119	22	11
120	24	0
121	24	1
122	24	2
123	24	3
124	24	4
125	24	5
126	24	6
127	24	7
128	24	8
129	24	9
130	24	10
131	24	11
132	7	0
133	7	1
134	7	2
135	7	3
136	7	4
137	7	5
138	7	6
139	7	7
140	7	8
141	7	9
142	7	10
143	7	11
144	12	0
145	12	1
146	12	2
147	12	3
148	12	4
149	12	5
150	12	6
151	12	7
152	12	8
153	12	9
154	12	10
155	12	11
156	14	0
157	14	1
158	14	2
159	14	3
160	14	4
161	14	5
162	14	6
163	14	7
164	14	8
165	14	9
166	14	10
167	14	11
168	16	0
169	16	1
170	16	2
171	16	3
172	16	4
173	16	5
174	16	6
175	16	7
176	16	8
177	16	9
178	16	10
179	16	11
180	25	0
181	25	1
182	25	2
183	25	3
184	25	4
185	25	5
186	25	6
187	25	7
188	25	8
189	25	9
190	25	10
191	25	11
192	4	0
193	4	1
194	4	2
195	4	3
196	4	4
197	4	5
198	4	6
199	4	7
200	4	8
201	4	9
202	4	10
203	4	11
204	5	0
205	5	1
206	5	2
207	5	3
208	5	4
209	5	5
210	5	6
211	5	7
212	5	8
213	5	9
214	5	10
215	5	11
216	11	0
217	11	1
218	11	2
219	11	3
220	11	4
221	11	5
222	11	6
223	11	7
224	11	8
225	11	9
226	11	10
227	11	11
228	15	0
229	15	1
230	15	2
231	15	3
232	15	4
233	15	5
234	15	6
235	15	7
236	15	8
237	15	9
238	15	10
239	15	11
240	23	0
241	23	1
242	23	2
243	23	3
244	23	4
245	23	5
246	23	6
247	23	7
248	23	8
249	23	9
250	23	10
251	23	11
252	10	0
253	10	1
254	10	2
255	10	3
256	10	4
257	10	5
258	10	6
259	10	7
260	10	8
261	10	9
262	10	10
263	10	11
264	13	0
265	13	1
266	13	2
267	13	3
268	13	4
269	13	5
270	13	6
271	13	7
272	13	8
273	13	9
274	13	10
275	13	11
276	18	0
277	18	1
278	18	2
279	18	3
280	18	4
281	18	5
282	18	6
283	18	7
284	18	8
285	18	9
286	18	10
287	18	11
288	19	0
289	19	1
290	19	2
291	19	3
292	19	4
293	19	5
294	19	6
295	19	7
296	19	8
297	19	9
298	19	10
299	19	11
300	21	0
301	21	1
302	21	2
303	21	3
304	21	4
305	21	5
306	21	6
307	21	7
308	21	8
309	21	9
310	21	10
311	21	11
\.


--
-- Data for Name: chordnote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chordnote (an_id, rn_id, c_id) FROM stdin;
0	0	0
4	4	0
7	7	0
11	11	0
1	0	1
5	4	1
8	7	1
0	11	1
2	0	2
6	4	2
9	7	2
1	11	2
3	0	3
7	4	3
10	7	3
2	11	3
4	0	4
8	4	4
11	7	4
3	11	4
5	0	5
9	4	5
0	7	5
4	11	5
6	0	6
10	4	6
1	7	6
5	11	6
7	0	7
11	4	7
2	7	7
6	11	7
8	0	8
0	4	8
3	7	8
7	11	8
9	0	9
1	4	9
4	7	9
8	11	9
10	0	10
2	4	10
5	7	10
9	11	10
11	0	11
3	4	11
6	7	11
10	11	11
0	0	12
4	4	12
8	8	12
11	11	12
1	0	13
5	4	13
9	8	13
0	11	13
2	0	14
6	4	14
10	8	14
1	11	14
3	0	15
7	4	15
11	8	15
2	11	15
4	0	16
8	4	16
0	8	16
3	11	16
5	0	17
9	4	17
1	8	17
4	11	17
6	0	18
10	4	18
2	8	18
5	11	18
7	0	19
11	4	19
3	8	19
6	11	19
8	0	20
0	4	20
4	8	20
7	11	20
9	0	21
1	4	21
5	8	21
8	11	21
10	0	22
2	4	22
6	8	22
9	11	22
11	0	23
3	4	23
7	8	23
10	11	23
0	0	24
3	3	24
7	7	24
1	0	25
4	3	25
8	7	25
2	0	26
5	3	26
9	7	26
3	0	27
6	3	27
10	7	27
4	0	28
7	3	28
11	7	28
5	0	29
8	3	29
0	7	29
6	0	30
9	3	30
1	7	30
7	0	31
10	3	31
2	7	31
8	0	32
11	3	32
3	7	32
9	0	33
0	3	33
4	7	33
10	0	34
1	3	34
5	7	34
11	0	35
2	3	35
6	7	35
0	0	36
3	3	36
7	7	36
10	10	36
2	2	36
1	0	37
4	3	37
8	7	37
11	10	37
3	2	37
2	0	38
5	3	38
9	7	38
0	10	38
4	2	38
3	0	39
6	3	39
10	7	39
1	10	39
5	2	39
4	0	40
7	3	40
11	7	40
2	10	40
6	2	40
5	0	41
8	3	41
0	7	41
3	10	41
7	2	41
6	0	42
9	3	42
1	7	42
4	10	42
8	2	42
7	0	43
10	3	43
2	7	43
5	10	43
9	2	43
8	0	44
11	3	44
3	7	44
6	10	44
10	2	44
9	0	45
0	3	45
4	7	45
7	10	45
11	2	45
10	0	46
1	3	46
5	7	46
8	10	46
0	2	46
11	0	47
2	3	47
6	7	47
9	10	47
1	2	47
0	0	48
2	2	48
7	7	48
1	0	49
3	2	49
8	7	49
2	0	50
4	2	50
9	7	50
3	0	51
5	2	51
10	7	51
4	0	52
6	2	52
11	7	52
5	0	53
7	2	53
0	7	53
6	0	54
8	2	54
1	7	54
7	0	55
9	2	55
2	7	55
8	0	56
10	2	56
3	7	56
9	0	57
11	2	57
4	7	57
10	0	58
0	2	58
5	7	58
11	0	59
1	2	59
6	7	59
0	0	60
4	4	60
7	7	60
11	11	60
2	2	60
1	0	61
5	4	61
8	7	61
0	11	61
3	2	61
2	0	62
6	4	62
9	7	62
1	11	62
4	2	62
3	0	63
7	4	63
10	7	63
2	11	63
5	2	63
4	0	64
8	4	64
11	7	64
3	11	64
6	2	64
5	0	65
9	4	65
0	7	65
4	11	65
7	2	65
6	0	66
10	4	66
1	7	66
5	11	66
8	2	66
7	0	67
11	4	67
2	7	67
6	11	67
9	2	67
8	0	68
0	4	68
3	7	68
7	11	68
10	2	68
9	0	69
1	4	69
4	7	69
8	11	69
11	2	69
10	0	70
2	4	70
5	7	70
9	11	70
0	2	70
11	0	71
3	4	71
6	7	71
10	11	71
1	2	71
0	0	72
4	4	72
7	7	72
2	2	72
1	0	73
5	4	73
8	7	73
3	2	73
2	0	74
6	4	74
9	7	74
4	2	74
3	0	75
7	4	75
10	7	75
5	2	75
4	0	76
8	4	76
11	7	76
6	2	76
5	0	77
9	4	77
0	7	77
7	2	77
6	0	78
10	4	78
1	7	78
8	2	78
7	0	79
11	4	79
2	7	79
9	2	79
8	0	80
0	4	80
3	7	80
10	2	80
9	0	81
1	4	81
4	7	81
11	2	81
10	0	82
2	4	82
5	7	82
0	2	82
11	0	83
3	4	83
6	7	83
1	2	83
0	0	84
4	4	84
7	7	84
10	10	84
1	1	84
1	0	85
5	4	85
8	7	85
11	10	85
2	1	85
2	0	86
6	4	86
9	7	86
0	10	86
3	1	86
3	0	87
7	4	87
10	7	87
1	10	87
4	1	87
4	0	88
8	4	88
11	7	88
2	10	88
5	1	88
5	0	89
9	4	89
0	7	89
3	10	89
6	1	89
6	0	90
10	4	90
1	7	90
4	10	90
7	1	90
7	0	91
11	4	91
2	7	91
5	10	91
8	1	91
8	0	92
0	4	92
3	7	92
6	10	92
9	1	92
9	0	93
1	4	93
4	7	93
7	10	93
10	1	93
10	0	94
2	4	94
5	7	94
8	10	94
11	1	94
11	0	95
3	4	95
6	7	95
9	10	95
0	1	95
0	0	96
4	4	96
7	7	96
10	10	96
1	0	97
5	4	97
8	7	97
11	10	97
2	0	98
6	4	98
9	7	98
0	10	98
3	0	99
7	4	99
10	7	99
1	10	99
4	0	100
8	4	100
11	7	100
2	10	100
5	0	101
9	4	101
0	7	101
3	10	101
6	0	102
10	4	102
1	7	102
4	10	102
7	0	103
11	4	103
2	7	103
5	10	103
8	0	104
0	4	104
3	7	104
6	10	104
9	0	105
1	4	105
4	7	105
7	10	105
10	0	106
2	4	106
5	7	106
8	10	106
11	0	107
3	4	107
6	7	107
9	10	107
0	0	108
4	4	108
8	8	108
10	10	108
1	0	109
5	4	109
9	8	109
11	10	109
2	0	110
6	4	110
10	8	110
0	10	110
3	0	111
7	4	111
11	8	111
1	10	111
4	0	112
8	4	112
0	8	112
2	10	112
5	0	113
9	4	113
1	8	113
3	10	113
6	0	114
10	4	114
2	8	114
4	10	114
7	0	115
11	4	115
3	8	115
5	10	115
8	0	116
0	4	116
4	8	116
6	10	116
9	0	117
1	4	117
5	8	117
7	10	117
10	0	118
2	4	118
6	8	118
8	10	118
11	0	119
3	4	119
7	8	119
9	10	119
0	0	120
3	3	120
6	6	120
9	9	120
1	0	121
4	3	121
7	6	121
10	9	121
2	0	122
5	3	122
8	6	122
11	9	122
3	0	123
6	3	123
9	6	123
0	9	123
4	0	124
7	3	124
10	6	124
1	9	124
5	0	125
8	3	125
11	6	125
2	9	125
6	0	126
9	3	126
0	6	126
3	9	126
7	0	127
10	3	127
1	6	127
4	9	127
8	0	128
11	3	128
2	6	128
5	9	128
9	0	129
0	3	129
3	6	129
6	9	129
10	0	130
1	3	130
4	6	130
7	9	130
11	0	131
2	3	131
5	6	131
8	9	131
0	0	132
4	4	132
7	7	132
1	0	133
5	4	133
8	7	133
2	0	134
6	4	134
9	7	134
3	0	135
7	4	135
10	7	135
4	0	136
8	4	136
11	7	136
5	0	137
9	4	137
0	7	137
6	0	138
10	4	138
1	7	138
7	0	139
11	4	139
2	7	139
8	0	140
0	4	140
3	7	140
9	0	141
1	4	141
4	7	141
10	0	142
2	4	142
5	7	142
11	0	143
3	4	143
6	7	143
0	0	144
4	4	144
6	6	144
10	10	144
1	0	145
5	4	145
7	6	145
11	10	145
2	0	146
6	4	146
8	6	146
0	10	146
3	0	147
7	4	147
9	6	147
1	10	147
4	0	148
8	4	148
10	6	148
2	10	148
5	0	149
9	4	149
11	6	149
3	10	149
6	0	150
10	4	150
0	6	150
4	10	150
7	0	151
11	4	151
1	6	151
5	10	151
8	0	152
0	4	152
2	6	152
6	10	152
9	0	153
1	4	153
3	6	153
7	10	153
10	0	154
2	4	154
4	6	154
8	10	154
11	0	155
3	4	155
5	6	155
9	10	155
0	0	156
4	4	156
7	7	156
9	9	156
1	0	157
5	4	157
8	7	157
10	9	157
2	0	158
6	4	158
9	7	158
11	9	158
3	0	159
7	4	159
10	7	159
0	9	159
4	0	160
8	4	160
11	7	160
1	9	160
5	0	161
9	4	161
0	7	161
2	9	161
6	0	162
10	4	162
1	7	162
3	9	162
7	0	163
11	4	163
2	7	163
4	9	163
8	0	164
0	4	164
3	7	164
5	9	164
9	0	165
1	4	165
4	7	165
6	9	165
10	0	166
2	4	166
5	7	166
7	9	166
11	0	167
3	4	167
6	7	167
8	9	167
0	0	168
3	3	168
7	7	168
10	10	168
1	1	168
1	0	169
4	3	169
8	7	169
11	10	169
2	1	169
2	0	170
5	3	170
9	7	170
0	10	170
3	1	170
3	0	171
6	3	171
10	7	171
1	10	171
4	1	171
4	0	172
7	3	172
11	7	172
2	10	172
5	1	172
5	0	173
8	3	173
0	7	173
3	10	173
6	1	173
6	0	174
9	3	174
1	7	174
4	10	174
7	1	174
7	0	175
10	3	175
2	7	175
5	10	175
8	1	175
8	0	176
11	3	176
3	7	176
6	10	176
9	1	176
9	0	177
0	3	177
4	7	177
7	10	177
10	1	177
10	0	178
1	3	178
5	7	178
8	10	178
11	1	178
11	0	179
2	3	179
6	7	179
9	10	179
0	1	179
0	0	180
4	4	180
8	8	180
1	0	181
5	4	181
9	8	181
2	0	182
6	4	182
10	8	182
3	0	183
7	4	183
11	8	183
4	0	184
8	4	184
0	8	184
5	0	185
9	4	185
1	8	185
6	0	186
10	4	186
2	8	186
7	0	187
11	4	187
3	8	187
8	0	188
0	4	188
4	8	188
9	0	189
1	4	189
5	8	189
10	0	190
2	4	190
6	8	190
11	0	191
3	4	191
7	8	191
0	0	192
3	3	192
7	7	192
2	2	192
1	0	193
4	3	193
8	7	193
3	2	193
2	0	194
5	3	194
9	7	194
4	2	194
3	0	195
6	3	195
10	7	195
5	2	195
4	0	196
7	3	196
11	7	196
6	2	196
5	0	197
8	3	197
0	7	197
7	2	197
6	0	198
9	3	198
1	7	198
8	2	198
7	0	199
10	3	199
2	7	199
9	2	199
8	0	200
11	3	200
3	7	200
10	2	200
9	0	201
0	3	201
4	7	201
11	2	201
10	0	202
1	3	202
5	7	202
0	2	202
11	0	203
2	3	203
6	7	203
1	2	203
0	0	204
4	4	204
7	7	204
10	10	204
2	2	204
1	0	205
5	4	205
8	7	205
11	10	205
3	2	205
2	0	206
6	4	206
9	7	206
0	10	206
4	2	206
3	0	207
7	4	207
10	7	207
1	10	207
5	2	207
4	0	208
8	4	208
11	7	208
2	10	208
6	2	208
5	0	209
9	4	209
0	7	209
3	10	209
7	2	209
6	0	210
10	4	210
1	7	210
4	10	210
8	2	210
7	0	211
11	4	211
2	7	211
5	10	211
9	2	211
8	0	212
0	4	212
3	7	212
6	10	212
10	2	212
9	0	213
1	4	213
4	7	213
7	10	213
11	2	213
10	0	214
2	4	214
5	7	214
8	10	214
0	2	214
11	0	215
3	4	215
6	7	215
9	10	215
1	2	215
0	0	216
3	3	216
8	8	216
10	10	216
1	0	217
4	3	217
9	8	217
11	10	217
2	0	218
5	3	218
10	8	218
0	10	218
3	0	219
6	3	219
11	8	219
1	10	219
4	0	220
7	3	220
0	8	220
2	10	220
5	0	221
8	3	221
1	8	221
3	10	221
6	0	222
9	3	222
2	8	222
4	10	222
7	0	223
10	3	223
3	8	223
5	10	223
8	0	224
11	3	224
4	8	224
6	10	224
9	0	225
0	3	225
5	8	225
7	10	225
10	0	226
1	3	226
6	8	226
8	10	226
11	0	227
2	3	227
7	8	227
9	10	227
0	0	228
3	3	228
7	7	228
10	10	228
1	0	229
4	3	229
8	7	229
11	10	229
2	0	230
5	3	230
9	7	230
0	10	230
3	0	231
6	3	231
10	7	231
1	10	231
4	0	232
7	3	232
11	7	232
2	10	232
5	0	233
8	3	233
0	7	233
3	10	233
6	0	234
9	3	234
1	7	234
4	10	234
7	0	235
10	3	235
2	7	235
5	10	235
8	0	236
11	3	236
3	7	236
6	10	236
9	0	237
0	3	237
4	7	237
7	10	237
10	0	238
1	3	238
5	7	238
8	10	238
11	0	239
2	3	239
6	7	239
9	10	239
0	0	240
5	5	240
7	7	240
1	0	241
6	5	241
8	7	241
2	0	242
7	5	242
9	7	242
3	0	243
8	5	243
10	7	243
4	0	244
9	5	244
11	7	244
5	0	245
10	5	245
0	7	245
6	0	246
11	5	246
1	7	246
7	0	247
0	5	247
2	7	247
8	0	248
1	5	248
3	7	248
9	0	249
2	5	249
4	7	249
10	0	250
3	5	250
5	7	250
11	0	251
4	5	251
6	7	251
0	0	252
3	3	252
7	7	252
9	9	252
1	0	253
4	3	253
8	7	253
10	9	253
2	0	254
5	3	254
9	7	254
11	9	254
3	0	255
6	3	255
10	7	255
0	9	255
4	0	256
7	3	256
11	7	256
1	9	256
5	0	257
8	3	257
0	7	257
2	9	257
6	0	258
9	3	258
1	7	258
3	9	258
7	0	259
10	3	259
2	7	259
4	9	259
8	0	260
11	3	260
3	7	260
5	9	260
9	0	261
0	3	261
4	7	261
6	9	261
10	0	262
1	3	262
5	7	262
7	9	262
11	0	263
2	3	263
6	7	263
8	9	263
0	0	264
7	7	264
1	0	265
8	7	265
2	0	266
9	7	266
3	0	267
10	7	267
4	0	268
11	7	268
5	0	269
0	7	269
6	0	270
1	7	270
7	0	271
2	7	271
8	0	272
3	7	272
9	0	273
4	7	273
10	0	274
5	7	274
11	0	275
6	7	275
0	0	276
4	4	276
6	6	276
11	11	276
1	0	277
5	4	277
7	6	277
0	11	277
2	0	278
6	4	278
8	6	278
1	11	278
3	0	279
7	4	279
9	6	279
2	11	279
4	0	280
8	4	280
10	6	280
3	11	280
5	0	281
9	4	281
11	6	281
4	11	281
6	0	282
10	4	282
0	6	282
5	11	282
7	0	283
11	4	283
1	6	283
6	11	283
8	0	284
0	4	284
2	6	284
7	11	284
9	0	285
1	4	285
3	6	285
8	11	285
10	0	286
2	4	286
4	6	286
9	11	286
11	0	287
3	4	287
5	6	287
10	11	287
0	0	288
3	3	288
6	6	288
10	10	288
1	0	289
4	3	289
7	6	289
11	10	289
2	0	290
5	3	290
8	6	290
0	10	290
3	0	291
6	3	291
9	6	291
1	10	291
4	0	292
7	3	292
10	6	292
2	10	292
5	0	293
8	3	293
11	6	293
3	10	293
6	0	294
9	3	294
0	6	294
4	10	294
7	0	295
10	3	295
1	6	295
5	10	295
8	0	296
11	3	296
2	6	296
6	10	296
9	0	297
0	3	297
3	6	297
7	10	297
10	0	298
1	3	298
4	6	298
8	10	298
11	0	299
2	3	299
5	6	299
9	10	299
0	0	300
4	4	300
8	8	300
10	10	300
1	0	301
5	4	301
9	8	301
11	10	301
2	0	302
6	4	302
10	8	302
0	10	302
3	0	303
7	4	303
11	8	303
1	10	303
4	0	304
8	4	304
0	8	304
2	10	304
5	0	305
9	4	305
1	8	305
3	10	305
6	0	306
10	4	306
2	8	306
4	10	306
7	0	307
11	4	307
3	8	307
5	10	307
8	0	308
0	4	308
4	8	308
6	10	308
9	0	309
1	4	309
5	8	309
7	10	309
10	0	310
2	4	310
6	8	310
8	10	310
11	0	311
3	4	311
7	8	311
9	10	311
\.


--
-- Data for Name: chordpattern; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chordpattern (id, name) FROM stdin;
0	maj7
1	maj7#5
2	minor
3	m9
4	madd9
5	9
6	sus2
7	major
8	maj9
9	add9
10	m6
11	m7#5
12	7b5
13	5
14	6
15	m7
16	m7b9
17	7b9
18	maj7b5
19	m7b5
20	7
21	7#5
22	7+
23	sus4
24	dim
25	aug
\.


--
-- Data for Name: chordpatternnote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY chordpatternnote (cp_id, rn_id) FROM stdin;
0	0
0	4
0	7
0	11
1	0
1	4
1	8
1	11
2	0
2	3
2	7
3	0
3	3
3	7
3	10
3	2
4	0
4	3
4	7
4	2
5	0
5	4
5	7
5	10
5	2
6	0
6	2
6	7
7	0
7	4
7	7
8	0
8	4
8	7
8	11
8	2
9	0
9	4
9	7
9	2
10	0
10	3
10	7
10	9
11	0
11	3
11	8
11	10
12	0
12	4
12	6
12	10
13	0
13	7
14	0
14	4
14	7
14	9
15	0
15	3
15	7
15	10
16	0
16	3
16	7
16	10
16	1
17	0
17	4
17	7
17	10
17	1
18	0
18	4
18	6
18	11
19	0
19	3
19	6
19	10
20	0
20	4
20	7
20	10
21	0
21	4
21	8
21	10
22	0
22	4
22	8
22	10
23	0
23	5
23	7
24	0
24	3
24	6
24	9
25	0
25	4
25	8
\.


--
-- Data for Name: relnote; Type: TABLE DATA; Schema: public; Owner: -
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
-- Data for Name: scale; Type: TABLE DATA; Schema: public; Owner: -
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
\.


--
-- Data for Name: scalenote; Type: TABLE DATA; Schema: public; Owner: -
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
0	0	24
2	2	24
4	4	24
7	7	24
9	9	24
1	0	25
3	2	25
5	4	25
8	7	25
10	9	25
2	0	26
4	2	26
6	4	26
9	7	26
11	9	26
3	0	27
5	2	27
7	4	27
10	7	27
0	9	27
4	0	28
6	2	28
8	4	28
11	7	28
1	9	28
5	0	29
7	2	29
9	4	29
0	7	29
2	9	29
6	0	30
8	2	30
10	4	30
1	7	30
3	9	30
7	0	31
9	2	31
11	4	31
2	7	31
4	9	31
8	0	32
10	2	32
0	4	32
3	7	32
5	9	32
9	0	33
11	2	33
1	4	33
4	7	33
6	9	33
10	0	34
0	2	34
2	4	34
5	7	34
7	9	34
11	0	35
1	2	35
3	4	35
6	7	35
8	9	35
0	0	36
3	3	36
5	5	36
7	7	36
10	10	36
1	0	37
4	3	37
6	5	37
8	7	37
11	10	37
2	0	38
5	3	38
7	5	38
9	7	38
0	10	38
3	0	39
6	3	39
8	5	39
10	7	39
1	10	39
4	0	40
7	3	40
9	5	40
11	7	40
2	10	40
5	0	41
8	3	41
10	5	41
0	7	41
3	10	41
6	0	42
9	3	42
11	5	42
1	7	42
4	10	42
7	0	43
10	3	43
0	5	43
2	7	43
5	10	43
8	0	44
11	3	44
1	5	44
3	7	44
6	10	44
9	0	45
0	3	45
2	5	45
4	7	45
7	10	45
10	0	46
1	3	46
3	5	46
5	7	46
8	10	46
11	0	47
2	3	47
4	5	47
6	7	47
9	10	47
\.


--
-- Data for Name: scalepattern; Type: TABLE DATA; Schema: public; Owner: -
--

COPY scalepattern (id, name) FROM stdin;
0	major
1	minor
2	major_pentatonic
3	minor_pentatonic
\.


--
-- Data for Name: scalepatternnote; Type: TABLE DATA; Schema: public; Owner: -
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
2	0
2	2
2	4
2	7
2	9
3	0
3	3
3	5
3	7
3	10
\.


--
-- Name: absnote_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY absnote
    ADD CONSTRAINT absnote_pkey PRIMARY KEY (id);


--
-- Name: chord_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chord
    ADD CONSTRAINT chord_pkey PRIMARY KEY (id);


--
-- Name: chordpattern_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY chordpattern
    ADD CONSTRAINT chordpattern_pkey PRIMARY KEY (id);


--
-- Name: relnote_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY relnote
    ADD CONSTRAINT relnote_pkey PRIMARY KEY (id);


--
-- Name: scale_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY scale
    ADD CONSTRAINT scale_pkey PRIMARY KEY (id);


--
-- Name: scalepattern_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY scalepattern
    ADD CONSTRAINT scalepattern_pkey PRIMARY KEY (id);


--
-- Name: chord_cp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chord
    ADD CONSTRAINT chord_cp_id_fkey FOREIGN KEY (cp_id) REFERENCES chordpattern(id);


--
-- Name: chord_root_an_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chord
    ADD CONSTRAINT chord_root_an_id_fkey FOREIGN KEY (root_an_id) REFERENCES absnote(id);


--
-- Name: chordnote_an_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chordnote
    ADD CONSTRAINT chordnote_an_id_fkey FOREIGN KEY (an_id) REFERENCES absnote(id);


--
-- Name: chordnote_c_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chordnote
    ADD CONSTRAINT chordnote_c_id_fkey FOREIGN KEY (c_id) REFERENCES chord(id);


--
-- Name: chordnote_rn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chordnote
    ADD CONSTRAINT chordnote_rn_id_fkey FOREIGN KEY (rn_id) REFERENCES relnote(id);


--
-- Name: chordpatternnote_cp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chordpatternnote
    ADD CONSTRAINT chordpatternnote_cp_id_fkey FOREIGN KEY (cp_id) REFERENCES chordpattern(id);


--
-- Name: chordpatternnote_rn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY chordpatternnote
    ADD CONSTRAINT chordpatternnote_rn_id_fkey FOREIGN KEY (rn_id) REFERENCES relnote(id);


--
-- Name: scale_root_an_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY scale
    ADD CONSTRAINT scale_root_an_id_fkey FOREIGN KEY (root_an_id) REFERENCES absnote(id);


--
-- Name: scale_sp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY scale
    ADD CONSTRAINT scale_sp_id_fkey FOREIGN KEY (sp_id) REFERENCES scalepattern(id);


--
-- Name: scalenote_an_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY scalenote
    ADD CONSTRAINT scalenote_an_id_fkey FOREIGN KEY (an_id) REFERENCES absnote(id);


--
-- Name: scalenote_rn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY scalenote
    ADD CONSTRAINT scalenote_rn_id_fkey FOREIGN KEY (rn_id) REFERENCES relnote(id);


--
-- Name: scalenote_s_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY scalenote
    ADD CONSTRAINT scalenote_s_id_fkey FOREIGN KEY (s_id) REFERENCES scale(id);


--
-- Name: scalepatternnote_rn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY scalepatternnote
    ADD CONSTRAINT scalepatternnote_rn_id_fkey FOREIGN KEY (rn_id) REFERENCES relnote(id);


--
-- Name: scalepatternnote_sp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY scalepatternnote
    ADD CONSTRAINT scalepatternnote_sp_id_fkey FOREIGN KEY (sp_id) REFERENCES scalepattern(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM simon;
GRANT ALL ON SCHEMA public TO simon;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

