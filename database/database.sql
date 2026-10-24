--
-- PostgreSQL database dump
--

\restrict eLx0h4YdIN6kgIGx54eMoVuO4JblQ9PlNpz0L8LyTBYVM5RxANJnVFiZNNNoBLj

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

-- Started on 2026-10-23 14:02:48

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 872 (class 1247 OID 34363)
-- Name: rol_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.rol_enum AS ENUM (
    'admin',
    'customer',
    'driver'
);


ALTER TYPE public.rol_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 34390)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id_user bigint NOT NULL,
    cedula character varying(20) NOT NULL,
    phone character varying(30) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 34489)
-- Name: bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bank (
    id_bank bigint NOT NULL,
    bank_code character varying(5) NOT NULL,
    bank_name character varying(50) NOT NULL
);


ALTER TABLE public.bank OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 34488)
-- Name: bank_id_bank_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bank_id_bank_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bank_id_bank_seq OWNER TO postgres;

--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 230
-- Name: bank_id_bank_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bank_id_bank_seq OWNED BY public.bank.id_bank;


--
-- TOC entry 222 (class 1259 OID 34408)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id_user bigint NOT NULL,
    cedula character varying(20) NOT NULL,
    phone character varying(30) NOT NULL,
    current_balance numeric(12,2) DEFAULT 0.00
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 34421)
-- Name: driver; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver (
    id_user bigint NOT NULL,
    cedula character varying(20) NOT NULL,
    phone character varying(30) NOT NULL,
    current_balance numeric(12,2) DEFAULT 0.00,
    contact_1 character varying(30),
    contact_2 character varying(30)
);


ALTER TABLE public.driver OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 34533)
-- Name: driver_pay; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_pay (
    id_pay bigint NOT NULL,
    id_driver bigint NOT NULL,
    id_admin bigint NOT NULL,
    id_bank bigint NOT NULL,
    reference_number character varying(100),
    pay_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.driver_pay OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 34532)
-- Name: driver_pay_id_pay_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_pay_id_pay_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.driver_pay_id_pay_seq OWNER TO postgres;

--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 238
-- Name: driver_pay_id_pay_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_pay_id_pay_seq OWNED BY public.driver_pay.id_pay;


--
-- TOC entry 243 (class 1259 OID 34620)
-- Name: ledger; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ledger (
    id_ledger bigint NOT NULL,
    id_transfer bigint NOT NULL,
    id_customer bigint NOT NULL,
    operation_type character varying(20) NOT NULL,
    amount numeric(10,2) NOT NULL,
    nature character varying NOT NULL,
    id_bank bigint,
    ref_number character varying(100),
    movement_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.ledger OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 34619)
-- Name: ledger_id_ledger_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ledger_id_ledger_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ledger_id_ledger_seq OWNER TO postgres;

--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 242
-- Name: ledger_id_ledger_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ledger_id_ledger_seq OWNED BY public.ledger.id_ledger;


--
-- TOC entry 225 (class 1259 OID 34435)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id_marca bigint NOT NULL,
    marca character varying(50) NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 34434)
-- Name: marca_id_marca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marca_id_marca_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.marca_id_marca_seq OWNER TO postgres;

--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 224
-- Name: marca_id_marca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marca_id_marca_seq OWNED BY public.marca.id_marca;


--
-- TOC entry 227 (class 1259 OID 34451)
-- Name: modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modelo (
    id_modelo bigint NOT NULL,
    modelo character varying(50) NOT NULL
);


ALTER TABLE public.modelo OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 34450)
-- Name: modelo_id_modelo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modelo_id_modelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modelo_id_modelo_seq OWNER TO postgres;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 226
-- Name: modelo_id_modelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modelo_id_modelo_seq OWNED BY public.modelo.id_modelo;


--
-- TOC entry 237 (class 1259 OID 34521)
-- Name: psycho_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.psycho_test (
    id_test bigint NOT NULL,
    id_user bigint NOT NULL,
    score integer,
    test_date timestamp without time zone NOT NULL,
    expiration_date timestamp without time zone
);


ALTER TABLE public.psycho_test OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 34520)
-- Name: psycho_test_id_test_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.psycho_test_id_test_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.psycho_test_id_test_seq OWNER TO postgres;

--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 236
-- Name: psycho_test_id_test_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.psycho_test_id_test_seq OWNED BY public.psycho_test.id_test;


--
-- TOC entry 217 (class 1259 OID 34369)
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rol (
    id_rol bigint NOT NULL,
    nombre_rol public.rol_enum NOT NULL
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 34389)
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.rol ALTER COLUMN id_rol ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.rol_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 34500)
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    id_service bigint NOT NULL,
    name character varying(100) NOT NULL,
    base_amount numeric(10,2) NOT NULL,
    percentage numeric(5,2) NOT NULL,
    CONSTRAINT chk_valid_percentage CHECK (((percentage >= (0)::numeric) AND (percentage <= (100)::numeric)))
);


ALTER TABLE public.service OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 34499)
-- Name: service_id_service_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_id_service_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_id_service_seq OWNER TO postgres;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 232
-- Name: service_id_service_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_id_service_seq OWNED BY public.service.id_service;


--
-- TOC entry 241 (class 1259 OID 34558)
-- Name: transfer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transfer (
    id_transfer bigint NOT NULL,
    id_customer bigint NOT NULL,
    id_driver bigint NOT NULL,
    id_vehicle bigint NOT NULL,
    id_service bigint NOT NULL,
    id_pay bigint,
    calculated_amount numeric(10,2) NOT NULL,
    company_amount numeric(10,2) NOT NULL,
    driver_amount numeric(10,2) NOT NULL,
    distance numeric(10,2) NOT NULL,
    origin_point character varying(255) NOT NULL,
    end_point character varying(255) NOT NULL,
    reservation_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(55) NOT NULL,
    CONSTRAINT chk_status CHECK (((status)::text = ANY ((ARRAY['pendiente'::character varying, 'en_curso'::character varying, 'completado'::character varying, 'cancelado'::character varying])::text[])))
);


ALTER TABLE public.transfer OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 34557)
-- Name: transfer_id_transfer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transfer_id_transfer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transfer_id_transfer_seq OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 240
-- Name: transfer_id_transfer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transfer_id_transfer_seq OWNED BY public.transfer.id_transfer;


--
-- TOC entry 219 (class 1259 OID 34375)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id_user bigint NOT NULL,
    id_rol bigint NOT NULL,
    name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(200) NOT NULL,
    registration_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 34374)
-- Name: user_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_user_seq OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_user_seq OWNED BY public."user".id_user;


--
-- TOC entry 229 (class 1259 OID 34460)
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle (
    id_vehicle bigint NOT NULL,
    id_driver bigint NOT NULL,
    plate character varying(20) NOT NULL,
    id_marca bigint NOT NULL,
    id_modelo bigint NOT NULL,
    color character varying(30) NOT NULL
);


ALTER TABLE public.vehicle OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 34459)
-- Name: vehicle_id_vehicle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_id_vehicle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_id_vehicle_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 228
-- Name: vehicle_id_vehicle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_id_vehicle_seq OWNED BY public.vehicle.id_vehicle;


--
-- TOC entry 235 (class 1259 OID 34508)
-- Name: vehicle_test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_test (
    id_test bigint NOT NULL,
    id_vehicle bigint NOT NULL,
    score integer NOT NULL,
    CONSTRAINT chk_score CHECK (((score >= 0) AND (score <= 100)))
);


ALTER TABLE public.vehicle_test OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 34507)
-- Name: vehicle_test_id_test_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_test_id_test_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_test_id_test_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 234
-- Name: vehicle_test_id_test_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_test_id_test_seq OWNED BY public.vehicle_test.id_test;


--
-- TOC entry 4718 (class 2604 OID 34492)
-- Name: bank id_bank; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank ALTER COLUMN id_bank SET DEFAULT nextval('public.bank_id_bank_seq'::regclass);


--
-- TOC entry 4722 (class 2604 OID 34536)
-- Name: driver_pay id_pay; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_pay ALTER COLUMN id_pay SET DEFAULT nextval('public.driver_pay_id_pay_seq'::regclass);


--
-- TOC entry 4726 (class 2604 OID 34623)
-- Name: ledger id_ledger; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger ALTER COLUMN id_ledger SET DEFAULT nextval('public.ledger_id_ledger_seq'::regclass);


--
-- TOC entry 4715 (class 2604 OID 34438)
-- Name: marca id_marca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca ALTER COLUMN id_marca SET DEFAULT nextval('public.marca_id_marca_seq'::regclass);


--
-- TOC entry 4716 (class 2604 OID 34454)
-- Name: modelo id_modelo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo ALTER COLUMN id_modelo SET DEFAULT nextval('public.modelo_id_modelo_seq'::regclass);


--
-- TOC entry 4721 (class 2604 OID 34524)
-- Name: psycho_test id_test; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.psycho_test ALTER COLUMN id_test SET DEFAULT nextval('public.psycho_test_id_test_seq'::regclass);


--
-- TOC entry 4719 (class 2604 OID 34503)
-- Name: service id_service; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN id_service SET DEFAULT nextval('public.service_id_service_seq'::regclass);


--
-- TOC entry 4724 (class 2604 OID 34561)
-- Name: transfer id_transfer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer ALTER COLUMN id_transfer SET DEFAULT nextval('public.transfer_id_transfer_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 34378)
-- Name: user id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id_user SET DEFAULT nextval('public.user_id_user_seq'::regclass);


--
-- TOC entry 4717 (class 2604 OID 34463)
-- Name: vehicle id_vehicle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle ALTER COLUMN id_vehicle SET DEFAULT nextval('public.vehicle_id_vehicle_seq'::regclass);


--
-- TOC entry 4720 (class 2604 OID 34511)
-- Name: vehicle_test id_test; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_test ALTER COLUMN id_test SET DEFAULT nextval('public.vehicle_test_id_test_seq'::regclass);


--
-- TOC entry 4951 (class 0 OID 34390)
-- Dependencies: 221
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id_user, cedula, phone) FROM stdin;
\.


--
-- TOC entry 4961 (class 0 OID 34489)
-- Dependencies: 231
-- Data for Name: bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bank (id_bank, bank_code, bank_name) FROM stdin;
\.


--
-- TOC entry 4952 (class 0 OID 34408)
-- Dependencies: 222
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id_user, cedula, phone, current_balance) FROM stdin;
\.


--
-- TOC entry 4953 (class 0 OID 34421)
-- Dependencies: 223
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver (id_user, cedula, phone, current_balance, contact_1, contact_2) FROM stdin;
\.


--
-- TOC entry 4969 (class 0 OID 34533)
-- Dependencies: 239
-- Data for Name: driver_pay; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_pay (id_pay, id_driver, id_admin, id_bank, reference_number, pay_date) FROM stdin;
\.


--
-- TOC entry 4973 (class 0 OID 34620)
-- Dependencies: 243
-- Data for Name: ledger; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ledger (id_ledger, id_transfer, id_customer, operation_type, amount, nature, id_bank, ref_number, movement_date) FROM stdin;
\.


--
-- TOC entry 4955 (class 0 OID 34435)
-- Dependencies: 225
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marca (id_marca, marca) FROM stdin;
\.


--
-- TOC entry 4957 (class 0 OID 34451)
-- Dependencies: 227
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modelo (id_modelo, modelo) FROM stdin;
\.


--
-- TOC entry 4967 (class 0 OID 34521)
-- Dependencies: 237
-- Data for Name: psycho_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.psycho_test (id_test, id_user, score, test_date, expiration_date) FROM stdin;
\.


--
-- TOC entry 4947 (class 0 OID 34369)
-- Dependencies: 217
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rol (id_rol, nombre_rol) FROM stdin;
\.


--
-- TOC entry 4963 (class 0 OID 34500)
-- Dependencies: 233
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (id_service, name, base_amount, percentage) FROM stdin;
\.


--
-- TOC entry 4971 (class 0 OID 34558)
-- Dependencies: 241
-- Data for Name: transfer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transfer (id_transfer, id_customer, id_driver, id_vehicle, id_service, id_pay, calculated_amount, company_amount, driver_amount, distance, origin_point, end_point, reservation_date, status) FROM stdin;
\.


--
-- TOC entry 4949 (class 0 OID 34375)
-- Dependencies: 219
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id_user, id_rol, name, last_name, email, registration_date) FROM stdin;
\.


--
-- TOC entry 4959 (class 0 OID 34460)
-- Dependencies: 229
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle (id_vehicle, id_driver, plate, id_marca, id_modelo, color) FROM stdin;
\.


--
-- TOC entry 4965 (class 0 OID 34508)
-- Dependencies: 235
-- Data for Name: vehicle_test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_test (id_test, id_vehicle, score) FROM stdin;
\.


--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 230
-- Name: bank_id_bank_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bank_id_bank_seq', 1, false);


--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 238
-- Name: driver_pay_id_pay_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_pay_id_pay_seq', 1, false);


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 242
-- Name: ledger_id_ledger_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ledger_id_ledger_seq', 1, false);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 224
-- Name: marca_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marca_id_marca_seq', 1, false);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 226
-- Name: modelo_id_modelo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modelo_id_modelo_seq', 1, false);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 236
-- Name: psycho_test_id_test_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.psycho_test_id_test_seq', 1, false);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 220
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rol_id_rol_seq', 1, false);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 232
-- Name: service_id_service_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_id_service_seq', 1, false);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 240
-- Name: transfer_id_transfer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transfer_id_transfer_seq', 1, false);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 218
-- Name: user_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_user_seq', 1, false);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 228
-- Name: vehicle_id_vehicle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_id_vehicle_seq', 1, false);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 234
-- Name: vehicle_test_id_test_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_test_id_test_seq', 1, false);


--
-- TOC entry 4739 (class 2606 OID 34394)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4763 (class 2606 OID 34494)
-- Name: bank bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id_bank);


--
-- TOC entry 4730 (class 2606 OID 34568)
-- Name: psycho_test chk_score_c; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.psycho_test
    ADD CONSTRAINT chk_score_c CHECK (((score >= 0) AND (score <= 100))) NOT VALID;


--
-- TOC entry 4743 (class 2606 OID 34413)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4775 (class 2606 OID 34539)
-- Name: driver_pay driver_pay_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_pay
    ADD CONSTRAINT driver_pay_pkey PRIMARY KEY (id_pay);


--
-- TOC entry 4747 (class 2606 OID 34426)
-- Name: driver driver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4781 (class 2606 OID 34628)
-- Name: ledger ledger_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger
    ADD CONSTRAINT ledger_pkey PRIMARY KEY (id_ledger);


--
-- TOC entry 4751 (class 2606 OID 34440)
-- Name: marca marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id_marca);


--
-- TOC entry 4755 (class 2606 OID 34456)
-- Name: modelo modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id_modelo);


--
-- TOC entry 4773 (class 2606 OID 34526)
-- Name: psycho_test psycho_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.psycho_test
    ADD CONSTRAINT psycho_test_pkey PRIMARY KEY (id_test);


--
-- TOC entry 4733 (class 2606 OID 34373)
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 4769 (class 2606 OID 34506)
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id_service);


--
-- TOC entry 4779 (class 2606 OID 34567)
-- Name: transfer transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT transfer_pkey PRIMARY KEY (id_transfer);


--
-- TOC entry 4765 (class 2606 OID 34498)
-- Name: bank uq_bank_code; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT uq_bank_code UNIQUE (bank_code);


--
-- TOC entry 4767 (class 2606 OID 34496)
-- Name: bank uq_bank_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bank
    ADD CONSTRAINT uq_bank_name UNIQUE (bank_name);


--
-- TOC entry 4741 (class 2606 OID 34396)
-- Name: admin uq_cedula; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT uq_cedula UNIQUE (cedula);


--
-- TOC entry 4745 (class 2606 OID 34415)
-- Name: customer uq_customer_cedula; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT uq_customer_cedula UNIQUE (cedula);


--
-- TOC entry 4749 (class 2606 OID 34428)
-- Name: driver uq_driver_cedula; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT uq_driver_cedula UNIQUE (cedula);


--
-- TOC entry 4735 (class 2606 OID 34383)
-- Name: user uq_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT uq_email UNIQUE (email);


--
-- TOC entry 4753 (class 2606 OID 34442)
-- Name: marca uq_marca; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT uq_marca UNIQUE (marca);


--
-- TOC entry 4757 (class 2606 OID 34458)
-- Name: modelo uq_modelo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modelo
    ADD CONSTRAINT uq_modelo UNIQUE (modelo);


--
-- TOC entry 4759 (class 2606 OID 34467)
-- Name: vehicle uq_plate; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT uq_plate UNIQUE (plate);


--
-- TOC entry 4777 (class 2606 OID 34541)
-- Name: driver_pay uq_reference_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_pay
    ADD CONSTRAINT uq_reference_number UNIQUE (reference_number);


--
-- TOC entry 4737 (class 2606 OID 34381)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4761 (class 2606 OID 34465)
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (id_vehicle);


--
-- TOC entry 4771 (class 2606 OID 34514)
-- Name: vehicle_test vehicle_test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_test
    ADD CONSTRAINT vehicle_test_pkey PRIMARY KEY (id_test);


--
-- TOC entry 4791 (class 2606 OID 34547)
-- Name: driver_pay fk_admin; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_pay
    ADD CONSTRAINT fk_admin FOREIGN KEY (id_admin) REFERENCES public.admin(id_user) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4783 (class 2606 OID 34397)
-- Name: admin fk_admin_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT fk_admin_user FOREIGN KEY (id_user) REFERENCES public."user"(id_user) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4792 (class 2606 OID 34552)
-- Name: driver_pay fk_bank; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_pay
    ADD CONSTRAINT fk_bank FOREIGN KEY (id_bank) REFERENCES public.bank(id_bank) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4784 (class 2606 OID 34416)
-- Name: customer fk_customer_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fk_customer_user FOREIGN KEY (id_user) REFERENCES public."user"(id_user) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4793 (class 2606 OID 34542)
-- Name: driver_pay fk_driver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_pay
    ADD CONSTRAINT fk_driver FOREIGN KEY (id_driver) REFERENCES public.driver(id_user) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4785 (class 2606 OID 34429)
-- Name: driver fk_driver_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT fk_driver_user FOREIGN KEY (id_user) REFERENCES public."user"(id_user) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4799 (class 2606 OID 34634)
-- Name: ledger fk_ledger_bank; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger
    ADD CONSTRAINT fk_ledger_bank FOREIGN KEY (id_bank) REFERENCES public.bank(id_bank) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4800 (class 2606 OID 34629)
-- Name: ledger fk_ledger_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger
    ADD CONSTRAINT fk_ledger_customer FOREIGN KEY (id_customer) REFERENCES public.customer(id_user) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4801 (class 2606 OID 34639)
-- Name: ledger fk_ledger_transfer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ledger
    ADD CONSTRAINT fk_ledger_transfer FOREIGN KEY (id_transfer) REFERENCES public.transfer(id_transfer) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 4790 (class 2606 OID 34527)
-- Name: psycho_test fk_test_u_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.psycho_test
    ADD CONSTRAINT fk_test_u_user FOREIGN KEY (id_user) REFERENCES public.customer(id_user) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4789 (class 2606 OID 34515)
-- Name: vehicle_test fk_test_vehicle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_test
    ADD CONSTRAINT fk_test_vehicle FOREIGN KEY (id_vehicle) REFERENCES public.vehicle(id_vehicle) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4794 (class 2606 OID 34594)
-- Name: transfer fk_transfer_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT fk_transfer_customer FOREIGN KEY (id_customer) REFERENCES public.customer(id_user) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4795 (class 2606 OID 34599)
-- Name: transfer fk_transfer_driver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT fk_transfer_driver FOREIGN KEY (id_driver) REFERENCES public.driver(id_user) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4796 (class 2606 OID 34614)
-- Name: transfer fk_transfer_pay; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT fk_transfer_pay FOREIGN KEY (id_pay) REFERENCES public.driver_pay(id_pay) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;


--
-- TOC entry 4797 (class 2606 OID 34609)
-- Name: transfer fk_transfer_service; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT fk_transfer_service FOREIGN KEY (id_service) REFERENCES public.service(id_service) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4798 (class 2606 OID 34604)
-- Name: transfer fk_transfer_vehicle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfer
    ADD CONSTRAINT fk_transfer_vehicle FOREIGN KEY (id_vehicle) REFERENCES public.vehicle(id_vehicle) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 4782 (class 2606 OID 34384)
-- Name: user fk_usuario_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol) REFERENCES public.rol(id_rol);


--
-- TOC entry 4786 (class 2606 OID 34468)
-- Name: vehicle fk_vehicle_driver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fk_vehicle_driver FOREIGN KEY (id_driver) REFERENCES public.driver(id_user) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4787 (class 2606 OID 34478)
-- Name: vehicle fk_vehicle_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fk_vehicle_marca FOREIGN KEY (id_marca) REFERENCES public.marca(id_marca) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4788 (class 2606 OID 34483)
-- Name: vehicle fk_vehicle_modelo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fk_vehicle_modelo FOREIGN KEY (id_modelo) REFERENCES public.modelo(id_modelo) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2026-10-23 14:02:48

--
-- PostgreSQL database dump complete
--

\unrestrict eLx0h4YdIN6kgIGx54eMoVuO4JblQ9PlNpz0L8LyTBYVM5RxANJnVFiZNNNoBLj

