--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: jobeet_affiliate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jobeet_affiliate (
    id bigint NOT NULL,
    url character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.jobeet_affiliate OWNER TO postgres;

--
-- Name: jobeet_affiliate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jobeet_affiliate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobeet_affiliate_id_seq OWNER TO postgres;

--
-- Name: jobeet_affiliate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jobeet_affiliate_id_seq OWNED BY jobeet_affiliate.id;


--
-- Name: jobeet_category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jobeet_category (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.jobeet_category OWNER TO postgres;

--
-- Name: jobeet_category_affiliate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jobeet_category_affiliate (
    category_id bigint NOT NULL,
    affiliate_id bigint NOT NULL
);


ALTER TABLE public.jobeet_category_affiliate OWNER TO postgres;

--
-- Name: jobeet_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jobeet_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobeet_category_id_seq OWNER TO postgres;

--
-- Name: jobeet_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jobeet_category_id_seq OWNED BY jobeet_category.id;


--
-- Name: jobeet_job; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jobeet_job (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    type character varying(255),
    company character varying(255) NOT NULL,
    logo character varying(255),
    url character varying(255),
    "position" character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    description character varying(4000) NOT NULL,
    how_to_apply character varying(4000) NOT NULL,
    token character varying(255) NOT NULL,
    is_public boolean DEFAULT true NOT NULL,
    is_activated boolean DEFAULT false NOT NULL,
    email character varying(255) NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.jobeet_job OWNER TO postgres;

--
-- Name: jobeet_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jobeet_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobeet_job_id_seq OWNER TO postgres;

--
-- Name: jobeet_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jobeet_job_id_seq OWNED BY jobeet_job.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobeet_affiliate ALTER COLUMN id SET DEFAULT nextval('jobeet_affiliate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobeet_category ALTER COLUMN id SET DEFAULT nextval('jobeet_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobeet_job ALTER COLUMN id SET DEFAULT nextval('jobeet_job_id_seq'::regclass);


--
-- Data for Name: jobeet_affiliate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jobeet_affiliate (id, url, email, token, is_active, created_at, updated_at) FROM stdin;
\.


--
-- Name: jobeet_affiliate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jobeet_affiliate_id_seq', 1, false);


--
-- Data for Name: jobeet_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jobeet_category (id, name, created_at, updated_at) FROM stdin;
9	Design	2015-10-01 14:35:21	2015-10-01 14:35:21
10	Programming	2015-10-01 14:35:21	2015-10-01 14:35:21
11	Manager	2015-10-01 14:35:21	2015-10-01 14:35:21
12	Administrator	2015-10-01 14:35:21	2015-10-01 14:35:21
\.


--
-- Data for Name: jobeet_category_affiliate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jobeet_category_affiliate (category_id, affiliate_id) FROM stdin;
\.


--
-- Name: jobeet_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jobeet_category_id_seq', 12, true);


--
-- Data for Name: jobeet_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jobeet_job (id, category_id, type, company, logo, url, "position", location, description, how_to_apply, token, is_public, is_activated, email, expires_at, created_at, updated_at) FROM stdin;
7	10	full-time	Sensio Labs	sensio-labs.gif	http://www.sensiolabs.com/	Web Developer	Paris, France	You've already developed websites with symfony and you want to work\nwith Open-Source technologies. You have a minimum of 3 years\nexperience in web development with PHP or Java and you wish to\nparticipate to development of Web 2.0 sites using the best\nframeworks available.\n	Send your resume to fabien.potencier [at] sensio.com\n	job_sensio_labs	t	t	job@example.com	2010-10-10 00:00:00	2015-10-01 14:35:21	2015-10-01 14:35:21
8	9	part-time	Extreme Sensio	extreme-sensio.gif	http://www.extreme-sensio.com/	Web Designer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\neiusmod tempor incididunt ut labore et dolore magna aliqua. Ut\nenim ad minim veniam, quis nostrud exercitation ullamco laboris\nnisi ut aliquip ex ea commodo consequat. Duis aute irure dolor\nin reprehenderit in.\n\nVoluptate velit esse cillum dolore eu fugiat nulla pariatur.\nExcepteur sint occaecat cupidatat non proident, sunt in culpa\nqui officia deserunt mollit anim id est laborum.\n	Send your resume to fabien.potencier [at] sensio.com\n	job_extreme_sensio	t	t	job@example.com	2010-10-10 00:00:00	2015-10-01 14:35:21	2015-10-01 14:35:21
9	10	\N	Sensio Labs	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] dolor.sit	job_expired	t	t	job@example.com	2005-12-31 00:00:00	2005-12-01 00:00:00	2015-10-01 14:35:21
10	10	\N	Company 100	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_100.sit\n	job_100	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
11	10	\N	Company 101	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_101.sit\n	job_101	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
12	10	\N	Company 102	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_102.sit\n	job_102	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
13	10	\N	Company 103	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_103.sit\n	job_103	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
14	10	\N	Company 104	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_104.sit\n	job_104	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
15	10	\N	Company 105	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_105.sit\n	job_105	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
16	10	\N	Company 106	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_106.sit\n	job_106	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
17	10	\N	Company 107	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_107.sit\n	job_107	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
18	10	\N	Company 108	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_108.sit\n	job_108	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
19	10	\N	Company 109	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_109.sit\n	job_109	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
20	10	\N	Company 110	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_110.sit\n	job_110	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
21	10	\N	Company 111	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_111.sit\n	job_111	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
22	10	\N	Company 112	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_112.sit\n	job_112	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
23	10	\N	Company 113	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_113.sit\n	job_113	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
24	10	\N	Company 114	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_114.sit\n	job_114	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
25	10	\N	Company 115	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_115.sit\n	job_115	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
26	10	\N	Company 116	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_116.sit\n	job_116	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
27	10	\N	Company 117	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_117.sit\n	job_117	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
28	10	\N	Company 118	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_118.sit\n	job_118	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
29	10	\N	Company 119	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_119.sit\n	job_119	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
30	10	\N	Company 120	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_120.sit\n	job_120	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
31	10	\N	Company 121	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_121.sit\n	job_121	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
32	10	\N	Company 122	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_122.sit\n	job_122	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
33	10	\N	Company 123	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_123.sit\n	job_123	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
34	10	\N	Company 124	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_124.sit\n	job_124	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
35	10	\N	Company 125	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_125.sit\n	job_125	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
36	10	\N	Company 126	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_126.sit\n	job_126	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
37	10	\N	Company 127	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_127.sit\n	job_127	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
38	10	\N	Company 128	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_128.sit\n	job_128	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
39	10	\N	Company 129	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_129.sit\n	job_129	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
40	10	\N	Company 130	\N	\N	Web Developer	Paris, France	Lorem ipsum dolor sit amet, consectetur adipisicing elit.	Send your resume to lorem.ipsum [at] company_130.sit\n	job_130	t	t	job@example.com	2015-10-31 13:35:21	2015-10-01 14:35:21	2015-10-01 14:35:21
\.


--
-- Name: jobeet_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jobeet_job_id_seq', 40, true);


--
-- Name: jobeet_affiliate_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jobeet_affiliate
    ADD CONSTRAINT jobeet_affiliate_email_key UNIQUE (email);


--
-- Name: jobeet_affiliate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jobeet_affiliate
    ADD CONSTRAINT jobeet_affiliate_pkey PRIMARY KEY (id);


--
-- Name: jobeet_category_affiliate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jobeet_category_affiliate
    ADD CONSTRAINT jobeet_category_affiliate_pkey PRIMARY KEY (category_id, affiliate_id);


--
-- Name: jobeet_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jobeet_category
    ADD CONSTRAINT jobeet_category_name_key UNIQUE (name);


--
-- Name: jobeet_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jobeet_category
    ADD CONSTRAINT jobeet_category_pkey PRIMARY KEY (id);


--
-- Name: jobeet_job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jobeet_job
    ADD CONSTRAINT jobeet_job_pkey PRIMARY KEY (id);


--
-- Name: jobeet_job_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jobeet_job
    ADD CONSTRAINT jobeet_job_token_key UNIQUE (token);


--
-- Name: jobeet_category_affiliate_affiliate_id_jobeet_affiliate_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobeet_category_affiliate
    ADD CONSTRAINT jobeet_category_affiliate_affiliate_id_jobeet_affiliate_id FOREIGN KEY (affiliate_id) REFERENCES jobeet_affiliate(id) ON DELETE CASCADE;


--
-- Name: jobeet_category_affiliate_category_id_jobeet_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobeet_category_affiliate
    ADD CONSTRAINT jobeet_category_affiliate_category_id_jobeet_category_id FOREIGN KEY (category_id) REFERENCES jobeet_category(id) ON DELETE CASCADE;


--
-- Name: jobeet_job_category_id_jobeet_category_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobeet_job
    ADD CONSTRAINT jobeet_job_category_id_jobeet_category_id FOREIGN KEY (category_id) REFERENCES jobeet_category(id) ON DELETE CASCADE;


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

