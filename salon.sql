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

DROP DATABASE salon;
--
-- Name: salon; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE salon WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE salon OWNER TO freecodecamp;

\connect salon

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    customer_id integer,
    service_id integer,
    "time" character varying(20)
);


ALTER TABLE public.appointments OWNER TO freecodecamp;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_appointment_id_seq OWNER TO freecodecamp;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    phone character varying(30),
    name character varying(50)
);


ALTER TABLE public.customers OWNER TO freecodecamp;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO freecodecamp;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.services OWNER TO freecodecamp;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_service_id_seq OWNER TO freecodecamp;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.appointments VALUES (1, 2, 3, '0815');
INSERT INTO public.appointments VALUES (2, 11, 5, 'sdfsdf');
INSERT INTO public.appointments VALUES (3, 29, 2, '1500');
INSERT INTO public.appointments VALUES (4, 30, 1, '10:30');
INSERT INTO public.appointments VALUES (5, 31, 1, '15:00');
INSERT INTO public.appointments VALUES (8, 34, 1, '');
INSERT INTO public.appointments VALUES (13, 38, 1, '15:00');
INSERT INTO public.appointments VALUES (16, 34, 1, '');
INSERT INTO public.appointments VALUES (23, 34, 1, '');
INSERT INTO public.appointments VALUES (30, 34, 1, '');
INSERT INTO public.appointments VALUES (35, 54, 1, 'fake time');
INSERT INTO public.appointments VALUES (36, 55, 1, '1500');


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.customers VALUES (1, 'tel1', 'name1');
INSERT INTO public.customers VALUES (2, '000-0000', 'Nuller');
INSERT INTO public.customers VALUES (3, '111-000', 'einser');
INSERT INTO public.customers VALUES (4, '222-222', 'zwei');
INSERT INTO public.customers VALUES (5, '3', 'drei');
INSERT INTO public.customers VALUES (6, '4', 'vier');
INSERT INTO public.customers VALUES (7, '5', '5');
INSERT INTO public.customers VALUES (9, '74', 'NAME');
INSERT INTO public.customers VALUES (10, '81', '81');
INSERT INTO public.customers VALUES (11, '83', '83');
INSERT INTO public.customers VALUES (12, '85', '85');
INSERT INTO public.customers VALUES (13, '86', '86');
INSERT INTO public.customers VALUES (14, '87', '87');
INSERT INTO public.customers VALUES (15, '89', '89');
INSERT INTO public.customers VALUES (16, '21', '21');
INSERT INTO public.customers VALUES (17, '22', '22');
INSERT INTO public.customers VALUES (18, '23', '23');
INSERT INTO public.customers VALUES (19, '24', '24');
INSERT INTO public.customers VALUES (20, '25', '25');
INSERT INTO public.customers VALUES (21, '26', '26');
INSERT INTO public.customers VALUES (22, '27', '27');
INSERT INTO public.customers VALUES (23, '28', '28');
INSERT INTO public.customers VALUES (24, '29', '29');
INSERT INTO public.customers VALUES (25, '30', '30');
INSERT INTO public.customers VALUES (26, '32', '32');
INSERT INTO public.customers VALUES (27, '33', '33');
INSERT INTO public.customers VALUES (28, '34', '34');
INSERT INTO public.customers VALUES (29, '36', '36');
INSERT INTO public.customers VALUES (30, '555-555-5555', 'Fabio');
INSERT INTO public.customers VALUES (31, '555', 'sdf');
INSERT INTO public.customers VALUES (34, '', '');
INSERT INTO public.customers VALUES (38, '896', '896');
INSERT INTO public.customers VALUES (54, '555-555', 'test');
INSERT INTO public.customers VALUES (55, '556489', 'sdf');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.services VALUES (1, 'schneiden');
INSERT INTO public.services VALUES (2, 'waschen');
INSERT INTO public.services VALUES (3, 'geelen');
INSERT INTO public.services VALUES (4, 'schneiden2');
INSERT INTO public.services VALUES (5, 'waschen2');
INSERT INTO public.services VALUES (6, 'geelen2');


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 42, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 60, true);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.services_service_id_seq', 6, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: appointments appointments_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: appointments appointments_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- PostgreSQL database dump complete
--

