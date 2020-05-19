--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11
-- Dumped by pg_dump version 10.11

-- Started on 2020-05-18 15:00:44

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

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 24597)
-- Name:  teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."teachers" (
    id integer NOT NULL,
    name character varying NOT NULL,
    subject integer NOT NULL
);


ALTER TABLE public."teachers" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 24605)
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."group" (
    id integer NOT NULL,
    student integer NOT NULL
);


ALTER TABLE public."group" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24618)
-- Name: record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.record (
    id integer NOT NULL,
    subject integer NOT NULL,
    grade integer,
    student integer,
    teacher integer
);


ALTER TABLE public.record OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24586)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    "Name" character varying NOT NULL,
    "group" integer NOT NULL,
    record integer NOT NULL
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24610)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    id integer NOT NULL,
    subject_name character varying NOT NULL,
    teacher integer
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 2833 (class 0 OID 24597)
-- Dependencies: 197
-- Data for Name:  teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public." teachers" (id, name, subject) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 24605)
-- Dependencies: 198
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."group" (id, student) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 24618)
-- Dependencies: 200
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.record (id, subject, grade, student, teacher) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 24586)
-- Dependencies: 196
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, "Name", "group", record) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 24610)
-- Dependencies: 199
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subject (id, subject_name, teacher) FROM stdin;
\.


--
-- TOC entry 2692 (class 2606 OID 24604)
-- Name:  teachers  teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." teachers"
    ADD CONSTRAINT " teachers_pkey" PRIMARY KEY (id);


--
-- TOC entry 2695 (class 2606 OID 24609)
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 24622)
-- Name: record record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 24593)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 24617)
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 1259 OID 24628)
-- Name: fki_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_group_id ON public.student USING btree ("group");


--
-- TOC entry 2688 (class 1259 OID 24639)
-- Name: r.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "r.id" ON public.student USING btree (record);


--
-- TOC entry 2693 (class 1259 OID 24650)
-- Name: s.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "s.id" ON public." teachers" USING btree (subject);


--
-- TOC entry 2701 (class 1259 OID 24667)
-- Name: st.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "st.id" ON public.record USING btree (student);


--
-- TOC entry 2698 (class 1259 OID 24656)
-- Name: t.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "t.id" ON public.subject USING btree (teacher);


--
-- TOC entry 2702 (class 1259 OID 24678)
-- Name: te.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "te.id" ON public.record USING btree (teacher);


--
-- TOC entry 2705 (class 2606 OID 24645)
-- Name:  teachers  teachers_subject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public." teachers"
    ADD CONSTRAINT " teachers_subject_fkey" FOREIGN KEY (subject) REFERENCES public.subject(id) NOT VALID;


--
-- TOC entry 2707 (class 2606 OID 24657)
-- Name: record record_student_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_student_fkey FOREIGN KEY (student) REFERENCES public.student(id) NOT VALID;


--
-- TOC entry 2708 (class 2606 OID 24662)
-- Name: record record_student_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_student_fkey1 FOREIGN KEY (student) REFERENCES public.student(id) NOT VALID;


--
-- TOC entry 2709 (class 2606 OID 24668)
-- Name: record record_teacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_teacher_fkey FOREIGN KEY (teacher) REFERENCES public." teachers"(id) NOT VALID;


--
-- TOC entry 2710 (class 2606 OID 24673)
-- Name: record record_teacher_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_teacher_fkey1 FOREIGN KEY (teacher) REFERENCES public." teachers"(id) NOT VALID;


--
-- TOC entry 2703 (class 2606 OID 24629)
-- Name: student student_group_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_group_fkey FOREIGN KEY ("group") REFERENCES public."group"(id) NOT VALID;


--
-- TOC entry 2704 (class 2606 OID 24634)
-- Name: student student_record_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_record_fkey FOREIGN KEY (record) REFERENCES public.record(id) NOT VALID;


--
-- TOC entry 2706 (class 2606 OID 24651)
-- Name: subject subject_teacher_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_teacher_fkey FOREIGN KEY (teacher) REFERENCES public." teachers"(id) NOT VALID;


-- Completed on 2020-05-18 15:00:46

--
-- PostgreSQL database dump complete
--

