--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 17.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO admin_elros;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: api_car; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.api_car (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    start_production date NOT NULL,
    end_production date,
    manufacturer_id bigint NOT NULL
);


ALTER TABLE public.api_car OWNER TO admin_elros;

--
-- Name: api_car_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.api_car ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.api_car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: api_comment; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.api_comment (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    created timestamp with time zone NOT NULL,
    text character varying(4096) NOT NULL,
    car_id bigint NOT NULL
);


ALTER TABLE public.api_comment OWNER TO admin_elros;

--
-- Name: api_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.api_comment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.api_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: api_country; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.api_country (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.api_country OWNER TO admin_elros;

--
-- Name: api_country_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.api_country ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.api_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: api_manufacturer; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.api_manufacturer (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    country_id bigint NOT NULL
);


ALTER TABLE public.api_manufacturer OWNER TO admin_elros;

--
-- Name: api_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.api_manufacturer ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.api_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin_elros;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin_elros;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin_elros;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin_elros;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin_elros;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin_elros;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO admin_elros;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin_elros;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin_elros;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin_elros;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin_elros
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin_elros
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin_elros;

--
-- Data for Name: api_car; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.api_car (id, name, start_production, end_production, manufacturer_id) FROM stdin;
1	Лада Калина	2025-01-29	\N	1
2	Камаз 1	2025-01-29	\N	2
3	Лада Гранта	2025-01-29	\N	1
\.


--
-- Data for Name: api_comment; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.api_comment (id, email, created, text, car_id) FROM stdin;
2	test@test.test	2025-01-29 01:17:21.990905+03	Классная машина	1
3	test@test.test	2025-01-29 01:17:36.591898+03	Классная машина 1	1
1	adm@adm.adm	2025-01-29 00:03:51.351744+03	Классная машина 1 test 4	1
\.


--
-- Data for Name: api_country; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.api_country (id, name) FROM stdin;
1	Российская Федерация
2	Республика Беларусь
\.


--
-- Data for Name: api_manufacturer; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.api_manufacturer (id, name, country_id) FROM stdin;
1	АвтоВаз	1
2	КАМАЗ	1
3	БелАЗ	2
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add Token	8	add_tokenproxy
30	Can change Token	8	change_tokenproxy
31	Can delete Token	8	delete_tokenproxy
32	Can view Token	8	view_tokenproxy
33	Can add car	9	add_car
34	Can change car	9	change_car
35	Can delete car	9	delete_car
36	Can view car	9	view_car
37	Can add country	10	add_country
38	Can change country	10	change_country
39	Can delete country	10	delete_country
40	Can view country	10	view_country
41	Can add comment	11	add_comment
42	Can change comment	11	change_comment
43	Can delete comment	11	delete_comment
44	Can view comment	11	view_comment
45	Can add manufacturer	12	add_manufacturer
46	Can change manufacturer	12	change_manufacturer
47	Can delete manufacturer	12	delete_manufacturer
48	Can view manufacturer	12	view_manufacturer
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$870000$syzOYUgqDHVRv1QP7gD2Yi$jORPy5k5fphuv7uOz6FeDpWaT0aW67LOWbYsWpKkirg=	2025-01-29 03:27:23.342188+03	t	admin			adm@adm.adm	t	t	2025-01-28 23:49:40.971703+03
2	pbkdf2_sha256$870000$J5fXmlKQlgOWhEUenLnGCb$sB695lyaJE8oboh/ig8pRvq3PP1Jbt6vfCCJjJgluqQ=	2025-01-29 03:35:07.654078+03	f	test			test@test.test	f	t	2025-01-29 03:33:18+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
7ec50bd622617b86e031ec680a285732ff9f1c67	2025-01-29 03:27:23.339755+03	1
778013a146ea06d477ab7b774dd3d174948174dd	2025-01-29 03:35:07.652574+03	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2025-01-28 23:59:12.925815+03	1	Российская Федерация	1	[{"added": {}}]	10	1
2	2025-01-28 23:59:29.294186+03	1	АвтоВаз	1	[{"added": {}}]	12	1
3	2025-01-29 00:03:00.018135+03	1	Лада Калина	1	[{"added": {}}]	9	1
4	2025-01-29 00:03:51.354399+03	1	Классная машина	1	[{"added": {}}]	11	1
5	2025-01-29 02:32:12.362436+03	2	Республика Беларусь	1	[{"added": {}}]	10	1
6	2025-01-29 02:32:25.959585+03	2	КАМАЗ	1	[{"added": {}}]	12	1
7	2025-01-29 02:32:38.675549+03	3	БелАЗ	1	[{"added": {}}]	12	1
8	2025-01-29 02:32:59.68334+03	2	Камаз 1	1	[{"added": {}}]	9	1
9	2025-01-29 02:33:34.848024+03	3	Лада Гранта	1	[{"added": {}}]	9	1
10	2025-01-29 03:33:18.528249+03	2	test	1	[{"added": {}}]	4	1
11	2025-01-29 03:33:32.080281+03	2	test	2	[{"changed": {"fields": ["Email address"]}}]	4	1
12	2025-01-29 03:36:21.226044+03	1	Классная машина 1 test 4	2	[{"changed": {"fields": ["Email"]}}]	11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	authtoken	tokenproxy
9	api	car
10	api	country
11	api	comment
12	api	manufacturer
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-01-28 23:49:04.713872+03
2	auth	0001_initial	2025-01-28 23:49:04.763096+03
3	admin	0001_initial	2025-01-28 23:49:04.776869+03
4	admin	0002_logentry_remove_auto_add	2025-01-28 23:49:04.78284+03
5	admin	0003_logentry_add_action_flag_choices	2025-01-28 23:49:04.78691+03
6	api	0001_initial	2025-01-28 23:49:04.811357+03
7	contenttypes	0002_remove_content_type_name	2025-01-28 23:49:04.823774+03
8	auth	0002_alter_permission_name_max_length	2025-01-28 23:49:04.828578+03
9	auth	0003_alter_user_email_max_length	2025-01-28 23:49:04.832164+03
10	auth	0004_alter_user_username_opts	2025-01-28 23:49:04.836759+03
11	auth	0005_alter_user_last_login_null	2025-01-28 23:49:04.841666+03
12	auth	0006_require_contenttypes_0002	2025-01-28 23:49:04.841666+03
13	auth	0007_alter_validators_add_error_messages	2025-01-28 23:49:04.845676+03
14	auth	0008_alter_user_username_max_length	2025-01-28 23:49:04.852809+03
15	auth	0009_alter_user_last_name_max_length	2025-01-28 23:49:04.858095+03
16	auth	0010_alter_group_name_max_length	2025-01-28 23:49:04.862732+03
17	auth	0011_update_proxy_permissions	2025-01-28 23:49:04.866779+03
18	auth	0012_alter_user_first_name_max_length	2025-01-28 23:49:04.871503+03
19	authtoken	0001_initial	2025-01-28 23:49:04.881658+03
20	authtoken	0002_auto_20160226_1747	2025-01-28 23:49:04.89674+03
21	authtoken	0003_tokenproxy	2025-01-28 23:49:04.898962+03
22	authtoken	0004_alter_tokenproxy_options	2025-01-28 23:49:04.901163+03
23	sessions	0001_initial	2025-01-28 23:49:04.908458+03
24	api	0002_alter_car_end_production	2025-01-29 00:02:46.019114+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin_elros
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
8v9m674sx6k2605qbk4epui3valv6nc3	.eJxVjDsOwjAQBe_iGlleb_xZSnrOYK3tNQmgRMqnQtwdIqWA9s3Me6nE29qnbZE5DVWdFajT75a5PGTcQb3zeJt0mcZ1HrLeFX3QRV-nKs_L4f4d9Lz03xozWSvWt2BC5mZKdkQeY-sIuEARjKEjLtVahBAErfOOnABGgwBNvT_ShTbo:1tcsXM:SgTjTotetptF9fP-TRoJgX_Lvly12kHnq17EhSzz7BQ	2025-02-11 23:50:20.480205+03
hp6a99a3lehjev89qyxeo7bf65msctay	.eJxVjDsOwjAQBe_iGlleb_xZSnrOYK3tNQmgRMqnQtwdIqWA9s3Me6nE29qnbZE5DVWdFajT75a5PGTcQb3zeJt0mcZ1HrLeFX3QRV-nKs_L4f4d9Lz03xozWSvWt2BC5mZKdkQeY-sIuEARjKEjLtVahBAErfOOnABGgwBNvT_ShTbo:1tcvY0:fazSFFVl8edJiqIO9fiOSItLSZs71pr1c6SLeaKq6uE	2025-02-12 03:03:12.512612+03
\.


--
-- Name: api_car_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.api_car_id_seq', 4, true);


--
-- Name: api_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.api_comment_id_seq', 3, true);


--
-- Name: api_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.api_country_id_seq', 2, true);


--
-- Name: api_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.api_manufacturer_id_seq', 3, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 12, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin_elros
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Name: api_car api_car_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.api_car
    ADD CONSTRAINT api_car_pkey PRIMARY KEY (id);


--
-- Name: api_comment api_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_pkey PRIMARY KEY (id);


--
-- Name: api_country api_country_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.api_country
    ADD CONSTRAINT api_country_pkey PRIMARY KEY (id);


--
-- Name: api_manufacturer api_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.api_manufacturer
    ADD CONSTRAINT api_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_car_manufacturer_id_acfc22a8; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX api_car_manufacturer_id_acfc22a8 ON public.api_car USING btree (manufacturer_id);


--
-- Name: api_comment_car_id_a0a1bcf7; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX api_comment_car_id_a0a1bcf7 ON public.api_comment USING btree (car_id);


--
-- Name: api_manufacturer_country_id_b4ed5ea2; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX api_manufacturer_country_id_b4ed5ea2 ON public.api_manufacturer USING btree (country_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin_elros
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: api_car api_car_manufacturer_id_acfc22a8_fk_api_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.api_car
    ADD CONSTRAINT api_car_manufacturer_id_acfc22a8_fk_api_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.api_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_comment api_comment_car_id_a0a1bcf7_fk_api_car_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.api_comment
    ADD CONSTRAINT api_comment_car_id_a0a1bcf7_fk_api_car_id FOREIGN KEY (car_id) REFERENCES public.api_car(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_manufacturer api_manufacturer_country_id_b4ed5ea2_fk_api_country_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.api_manufacturer
    ADD CONSTRAINT api_manufacturer_country_id_b4ed5ea2_fk_api_country_id FOREIGN KEY (country_id) REFERENCES public.api_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin_elros
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLES TO admin_elros;


--
-- PostgreSQL database dump complete
--

