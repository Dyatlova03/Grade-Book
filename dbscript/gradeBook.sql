--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11
-- Dumped by pg_dump version 10.11

-- Started on 2020-05-21 10:05:37

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
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 24605)
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."group" (
    id integer NOT NULL
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);
);


ALTER TABLE public."group" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 24618)
-- Name: record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.record (
    id integer NOT NULL,
    grade integer,
    student_id integer,
    teacher_id integer
    ADD CONSTRAINT record_pkey PRIMARY KEY (id);
    ADD CONSTRAINT record_student_fkey FOREIGN KEY (student_id) REFERENCES public.student(id) NOT VALID;
    ADD CONSTRAINT record_teacher_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id) NOT VALID;
);


ALTER TABLE public.record OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 24586)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    name character varying NOT NULL,
    group_id integer NOT NULL,
    record_id integer NOT NULL
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);
    ADD CONSTRAINT student_group_fkey FOREIGN KEY (group_id) REFERENCES public."group"(id) NOT VALID;
    ADD CONSTRAINT student_record_fkey FOREIGN KEY (record_id) REFERENCES public.record(id) NOT VALID;
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 24610)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    id integer NOT NULL,
    subject_name character varying NOT NULL
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24679)
-- Name: subject_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject_record (
    id integer NOT NULL,
    subject_id integer,
    record_id integer
    ADD CONSTRAINT subject_record_pkey PRIMARY KEY (id);
    ADD CONSTRAINT subject_record_record_id_fkey FOREIGN KEY (record_id) REFERENCES public.record(id) NOT VALID;
    ADD CONSTRAINT subject_record_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id) NOT VALID;
);


ALTER TABLE public.subject_record OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 24597)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    name character varying NOT NULL,
    subject_id integer NOT NULL
    ADD CONSTRAINT " teachers_pkey" PRIMARY KEY (id);
    ADD CONSTRAINT " teachers_subject_fkey" FOREIGN KEY (subject_id) REFERENCES public.subject(id) NOT VALID;
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 2842 (class 0 OID 24605)
-- Dependencies: 198
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--


--
-- TOC entry 2691 (class 1259 OID 24628)
-- Name: fki_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_group_id ON public.student USING btree (group_id);


--
-- TOC entry 2692 (class 1259 OID 24639)
-- Name: r.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "r.id" ON public.student USING btree (record_id);


--
-- TOC entry 2706 (class 1259 OID 24695)
-- Name: rec.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "rec.id" ON public.subject_record USING btree (record_id);


--
-- TOC entry 2697 (class 1259 OID 24650)
-- Name: s.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "s.id" ON public.teachers USING btree (subject_id);


--
-- TOC entry 2704 (class 1259 OID 24667)
-- Name: st.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "st.id" ON public.record USING btree (student_id);


--
-- TOC entry 2707 (class 1259 OID 24689)
-- Name: subj.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "subj.id" ON public.subject_record USING btree (subject_id);


--
-- TOC entry 2705 (class 1259 OID 24678)
-- Name: te.id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "te.id" ON public.record USING btree (teacher_id);


-- Completed on 2020-05-21 10:05:38

--
-- PostgreSQL database dump complete
--

