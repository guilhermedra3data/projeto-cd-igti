--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5

-- Started on 2022-09-24 01:34:39 UTC

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

DROP DATABASE IF EXISTS "prestomo-db";
--
-- TOC entry 3376 (class 1262 OID 16384)
-- Name: prestomo-db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "prestomo-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE "prestomo-db" OWNER TO postgres;

\connect -reuse-previous=on "dbname='prestomo-db'"

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
-- TOC entry 2 (class 3079 OID 16476)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 16533)
-- Name: acoes_b3; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acoes_b3 (
    nome character varying NOT NULL,
    sigla character varying NOT NULL
);


ALTER TABLE public.acoes_b3 OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16551)
-- Name: alertas_configurados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alertas_configurados (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    acao_sigla character varying NOT NULL,
    valor_minimo numeric(20,2),
    valor_maximo numeric(20,2),
    disparo character varying NOT NULL
);


ALTER TABLE public.alertas_configurados OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16550)
-- Name: alertas_configurados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alertas_configurados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alertas_configurados_id_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 213
-- Name: alertas_configurados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alertas_configurados_id_seq OWNED BY public.alertas_configurados.id;


--
-- TOC entry 211 (class 1259 OID 16514)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nome character varying NOT NULL,
    cpf character varying NOT NULL,
    email character varying NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16513)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 210
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 3214 (class 2604 OID 16554)
-- Name: alertas_configurados id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas_configurados ALTER COLUMN id SET DEFAULT nextval('public.alertas_configurados_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 16517)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 16533)
-- Dependencies: 212
-- Data for Name: acoes_b3; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('3 R Petroleum', 'RRRP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('3tentos', 'TTEN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Aco Altona', 'EALT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Aco Altona', 'EALT4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Advanced Dh', 'ADHM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Aeris', 'AERI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Aes Brasil', 'AESB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Aes Tiete E', 'TIET11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Aes Tiete E', 'TIET3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Aes Tiete E', 'TIET4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Afluente T', 'AFLT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Agribrasil', 'GRAO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Agrogalaxy', 'AGXY3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Consorc', 'BRGE11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Consorc', 'BRGE12');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Consorc', 'BRGE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Consorc', 'BRGE5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Consorc', 'BRGE6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Consorc', 'BRGE8');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Financ', 'CRIV3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Financ', 'CRIV4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Holding', 'RPAD3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Holding', 'RPAD5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Holding', 'RPAD6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Invest', 'BRIV3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alfa Invest', 'BRIV4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alianscsonae', 'ALSO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alianza Trust Renda Imobiliaria Fundo Investimento Imobiliario', 'ALZR11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alliar', 'AALR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Allied', 'ALLD3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alpargatas', 'ALPA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alpargatas', 'ALPA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alper S.A.', 'APER3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alphabet DRN A', 'GOGL34');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alphaville', 'AVLL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alupar', 'ALUP11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alupar', 'ALUP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Alupar', 'ALUP4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Amazonia', 'BAZA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ambev S.A.', 'ABEV3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ambipar', 'AMBP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Americanas', 'AMER3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ampla Energ', 'CBEE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Anima', 'ANIM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Arezzo Indústria e Comércio S.A.', 'ARZZ3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Armac', 'ARML3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Assai', 'ASAI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('AtmaSA', 'ATMP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Atompar', 'ATOM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Aura 360', 'AURA33');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Auren', 'AURE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Azevedo', 'AZEV3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Azevedo', 'AZEV4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Azul S.A.', 'AZUL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('B3 S.A. - Brasil, Bolsa, Balcão', 'B3SA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Bahema', 'BAHI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco Bmg', 'BMGB4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco Bradesco S.A.', 'BBDC3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco Bradesco S.A.', 'BBDC4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco do Brasil S.A.', 'BBAS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco do Estado do Rio Grande do Sul S.A.', 'BRSR6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco Modal', 'MODL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco Modal', 'MODL11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco Modal', 'MODL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco Pan', 'BPAN4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco Santander (Brasil) S.A.', 'SANB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banco Santander (Brasil) S.A.', 'SANB11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banese', 'BGIP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banese', 'BGIP4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banestes', 'BEES3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banestes', 'BEES4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banrisul', 'BRSR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Banrisul', 'BRSR5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Bardella', 'BDLL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Bardella', 'BDLL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Baumer', 'BALM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Baumer', 'BALM4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('BB Progressivo II Fundo de Investimento Imobiliario - FII', 'BBPO11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('BB Seguridade Participações S.A.', 'BBSE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Bemobi Tech', 'BMOB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Bic Monark', 'BMKS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Biomm', 'BIOM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Bk Brasil', 'BKBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Blau', 'BLAU3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Boa Safra', 'SOJA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Boa Vista', 'BOAS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Bombril', 'BOBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Bombril', 'BOBR4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('BR Malls Participações S.A.', 'BRML3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('BR Partners', 'BRBI11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Br Propert', 'BRPR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Bradespar S.A.', 'BRAP4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Bradespar S.A.', 'BRAP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Brasilagro', 'AGRO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Braskem', 'BRKM6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Braskem S.A.', 'BRKM5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Braskem S.A.', 'BRKM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Brb Banco', 'BSLI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Brb Banco', 'BSLI4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('BRF S.A.', 'BRFS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('BriSAnet', 'BRIT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('BTG Pactual Logística', 'BTLG11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Btgp Banco', 'BPAC11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Btgp Banco', 'BPAC3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Btgp Banco', 'BPAC5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Caixa Seguri', 'CXSE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cambuci', 'CAMB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Camil Alimentos S.A.', 'CAML3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Carrefour Br', 'CRFB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('CaSAn', 'CASN');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('CaSAn', 'CASN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('CBA', 'CBAV3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('CCR S.A.', 'CCRO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cea Modas', 'CEAB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ceb', 'CEBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ceb', 'CEBR5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ceb', 'CEBR6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cedro', 'CEDO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cedro', 'CEDO4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ceee D', 'CEED3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ceee D', 'CEED4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ceee Gt', 'EEEL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ceee Gt', 'EEEL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ceg', 'CEGR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Celesc', 'CLSC3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Celesc', 'CLSC4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Celgpar', 'GPAR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Celpe', 'CEPE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Celpe', 'CEPE5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Celpe', 'CEPE6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cemepe', 'MAPT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cemepe', 'MAPT4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Centrais Elétricas Brasileiras S.A. - Eletrobras', 'ELET3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Centrais Elétricas Brasileiras S.A. - Eletrobras', 'ELET6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cesp', 'CESP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cesp', 'CESP5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cesp', 'CESP6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cia. Hering', 'HGTX3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cielo S.A.', 'CIEL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('ClearSAle', 'CLSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Coelba', 'CEEB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Coelba', 'CEEB5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Coelce', 'COCE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Coelce', 'COCE5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cogna Educação S.A.', 'COGN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Comgas', 'CGAS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Comgas', 'CGAS5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Companhia de Locação das Américas', 'LCAM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Companhia de Saneamento Básico do Estado de São Paulo - SABESP', 'SBSP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Companhia Energética de Minas Gerais', 'CMIG3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Companhia Energética de Minas Gerais', 'CMIG4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Companhia Paranaense de Energia - COPEL', 'CPLE6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Companhia Paranaense de Energia - COPEL', 'CPLE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Companhia Siderúrgica Nacional', 'CSNA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Const A Lind', 'CALI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('CopaSA', 'CSMG3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Copel', 'CPLE5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cor Ribeiro', 'CORR4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('CoSAn Log', 'RLOG3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cosan S.A.', 'CSAN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cosern', 'CSRN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cosern', 'CSRN5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cosern', 'CSRN6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Coteminas', 'CTNM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Coteminas', 'CTNM4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('CPFL Energia S.A.', 'CPFE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cr2', 'CRDE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cristal', 'CRPG3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cristal', 'CRPG5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cristal', 'CRPG6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cruzeiro Edu', 'CSED3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('CSHG Logistica - Fundo De Investimento Imobiliario', 'HGLG11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Csnmineracao', 'CMIN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Csu Cardsyst', 'CARD3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cury S/A', 'CURY3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('CVC Brasil Operadora e Agência de Viagens S.A.', 'CVCB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Cyrela Brazil Realty S.A. Empreendimentos e Participações', 'CYRE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('D1000 Vfarma', 'DMVF3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('DaSA', 'DASA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Desktop', 'DESK3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Dimed', 'PNVL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Dimed', 'PNVL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Direcional', 'DIRR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Dohler', 'DOHL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Dohler', 'DOHL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Dommo', 'DMMO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Dotz S.A.', 'DOTZ3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Dtcom Direct', 'DTCY3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Duratex', 'DTEX3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('EcoRodovias Infraestrutura e Logística S.A.', 'ECOR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('EDP - Energias do Brasil S.A.', 'ENBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Elektro', 'EKTR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Elektro', 'EKTR4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eletrobras', 'ELET5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eletromidia', 'ELMD3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eletropar', 'LIPR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Emae', 'EMAE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Emae', 'EMAE4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Embpar', 'EPAR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Embraer S.A.', 'EMBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Enauta Part', 'ENAT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Encorpar', 'ECPR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Encorpar', 'ECPR4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('EnergiSA', 'ENGI');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('EnergiSA', 'ENGI11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('EnergiSA', 'ENGI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('EnergiSA', 'ENGI4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('EnergiSA Mt', 'ENMT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('EnergiSA Mt', 'ENMT4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eneva', 'ENEV3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Engie Brasil Energia S.A.', 'EGIE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Enjoei', 'ENJU3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eqtl Para', 'EQPA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eqtl Para', 'EQPA5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eqtl Para', 'EQPA6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eqtl Para', 'EQPA7');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Equatorial Energia S.A.', 'EQTL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Espacolaser', 'ESPA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Estácio Participações S.A.', 'YDUQ3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Estapar', 'ALPK3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Estrela', 'ESTR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Estrela', 'ESTR4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eternit', 'ETER3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eucatex', 'EUCA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eucatex', 'EUCA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Even', 'EVEN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Excelsior', 'BAUH4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Eztec', 'EZTC3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Fator Verita', 'VRTA11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('FD Invest Imob Hotel Maxinvest', 'HTMX11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Fer Heringer', 'FHER3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('FerbaSA', 'FESA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('FerbaSA', 'FESA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Fleury S.A.', 'FLRY3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Focus On', 'POWE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Fras Le', 'FRAS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Fundo de Investimento Imobiliario - FII Brasil Plural Absoluto Fundo de Fundos', 'BPFF11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Fundo Investimento Imobiliario BTG Pactual', 'BCFF11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Fundo Investimento Imobiliario Rbr Properties Fii', 'RBRP11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('GafiSA', 'GFSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Generalshopp', 'GSHP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ger Paranap', 'GEPA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ger Paranap', 'GEPA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Gerdau Met', 'GOAU3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Gerdau S.A.', 'GGBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Gerdau S.A.', 'GGBR4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Getnet Br', 'GETT11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Getnet Br', 'GETT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Getnet Br', 'GETT4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Getninjas', 'NINJ3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Gol Linhas Aéreas Inteligentes S.A.', 'GOLL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Gp Invest', 'GPIV33');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('GPA Companhia Brasileira de Distribuição', 'PCAR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Gpc Part', 'GPCP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('GPS', 'GGPS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Grazziotin', 'CGRA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Grazziotin', 'CGRA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Grendene S.A.', 'GRND3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Grupo Mateus S.A.', 'GMAT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Grupo Sbf', 'SBFG3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Grupo Soma', 'SOMA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Guararapes', 'GUAR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Habitasul', 'HBTS5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Haga S/A', 'HAGA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Haga S/A', 'HAGA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Hapvida', 'HAPV3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Hbr Realty', 'HBRE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Hectare CE Fundo de Investimento Imobiliário', 'HCTR11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('HEDGE Brasil Shopping Fundo de Investimento Imobiliario', 'HGBS11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Hedge Top FOFII 3', 'HFOF11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Helbor Empreendimentos S.A.', 'HBOR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Hercules', 'HETA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Hercules', 'HETA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Hidrovias', 'HBSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Hoteis Othon', 'HOOT4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Hypera S.A.', 'HYPE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Igb S/A', 'IGBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Iguatemi Empresa de Shopping Centers S.A.', 'IGTA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ihpardini', 'PARD3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Inds Romi', 'ROMI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Indusval', 'IDVL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Indusval', 'IDVL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Inepar', 'INEP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Inepar', 'INEP4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Infracomm', 'IFCM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Intelbras', 'INTB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Inter & Co Inc', 'INBR31');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Intermedica', 'GNDI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('International Meal Company Alimentacao S.A.', 'MEAL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Iochpe-Maxion S.A.', 'MYPK3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Irani', 'RANI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Irani', 'RANI4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('IRB-Brasil Resseguros S.A.', 'IRBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('iShares Ibovespa Fundo de Índice ETF', 'BOVA11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('iShares S&P 500 Fundo de Investimento - Investimento No Exterior', 'IVVB11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Itaú Unibanco Holding S.A.', 'ITUB4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Itaú Unibanco Holding S.A.', 'ITUB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Itaúsa - Investimentos Itaú S.A.', 'ITSA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Itausa - Investimentos Itau S.A.', 'ITSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('J B Duarte', 'JBDU3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('J B Duarte', 'JBDU4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Jallesmachad', 'JALL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('JBS S.A.', 'JBSS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('JD COM DRN', 'JDCO34');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('JereisSAti', 'JPSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('JHSF Participacoes S.A.', 'JHSF3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Joao Fortes', 'JFEN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('JoSApar', 'JOPA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('JoSApar', 'JOPA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Kallas', 'KLAS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Karsten', 'CTKA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Karsten', 'CTKA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Kepler Weber', 'KEPL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Spturis', 'AHEB5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('KINEA Renda Imobiliária - Fundo de Investimento Imobiliário', 'KNRI11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Klabin S/A', 'KLBN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Klabin S/A', 'KLBN4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('KLABIN S/A UNT N2', 'KLBN11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Kora Saude', 'KRSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Lavvi', 'LAVV3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Le Biscuit', 'LLBI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Le Biscuit', 'LLBI4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Le Lis Blanc', 'LLIS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Light S/A', 'LIGT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Linx', 'LINX3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Localiza Rent a Car S.A.', 'RENT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Locaweb', 'LWSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Log Com Prop', 'LOGG3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Log In', 'LOGN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Lojas Americ', 'LAME3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Lojas Americanas S.A.', 'LAME4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Lojas MariSA', 'AMAR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Lojas Renner S.A.', 'LREN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Lopes Brasil', 'LPSB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Lupatech', 'LUPA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('M. Dias Branco S.A. Indústria e Comércio de Alimentos', 'MDIA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Magazine Luiza S.A.', 'MGLU3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Mangels Indl', 'MGEL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Marcopolo', 'POMO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Marcopolo', 'POMO4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Marfrig Global Foods S.A.', 'MRFG3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Mater Dei', 'MATD3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Maxi Renda Fundo De Investimento Imobiliaro - FII', 'MXRF11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Melhor Sp', 'MSPA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Melhor Sp', 'MSPA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Meliuz', 'CASH3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Melnick', 'MELK3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Merc Brasil', 'BMEB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Merc Brasil', 'BMEB4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Merc Financ', 'MERC3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Merc Financ', 'MERC4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Merc Invest', 'BMIN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Merc Invest', 'BMIN4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Merito Desenvolvimento Imobiliario I FII - Fundo de Investimento Imobiliario', 'MFII11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Metal Iguacu', 'MTIG4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Metal Leve', 'LEVE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Metalfrio', 'FRIO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Metalurgica Gerdau S.A.', 'GOAU4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('MetiSA', 'MTSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('MetiSA', 'MTSA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Mills Estruturas e Servicos de Engenharia S.A.', 'MILS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Minerva', 'BEEF');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Minerva', 'BEEF3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Minupar', 'MNPR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Mitre Realty', 'MTRE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Mmx Miner', 'MMXM11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Mmx Miner', 'MMXM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Mobly', 'MBLY3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Mont Aranha', 'MOAR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Mosaico', 'MOSI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Moura Dubeux', 'MDNE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Movida Participacoes S.A.', 'MOVI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('MRV Engenharia e Participações S.A.', 'MRVE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Multilaser', 'MLAS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Multiplan Empreendimentos Imobiliários S.A.', 'MULT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Mundial', 'MNDL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Natura &Co Holding S.A.', 'NTCO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Natura Cosméticos S.A.', 'NATU3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Neoenergia', 'NEOE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Neogrid', 'NGRD3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Nexpe Participações', 'NEXP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Nord Brasil', 'BNBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Nordon Met', 'NORD3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Nubank', 'NUBR33');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Nutriplant', 'NUTR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Oceanpact', 'OPCT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Odontoprev', 'ODPV3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Oi', 'OIBR4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Oi S.A.', 'OIBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Omega Ger', 'OMGE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Omegaenergia', 'MEGA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Oncoclinicas', 'ONCO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Orizon', 'ORVR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Osx Brasil', 'OSXB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ourofino S/A', 'OFSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Padtec', 'PDTC3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Pague Menos', 'PGMN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Panatlantica', 'PATI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Panatlantica', 'PATI4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Par Al Bahia', 'PEAB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Par Al Bahia', 'PEAB4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Paranapanema', 'PMAM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Pdg Realt', 'PDGR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Pet Center Comércio e Participações S.A.', 'PETZ3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Pet Manguinh', 'RPMG3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Petróleo Brasileiro S.A. - Petrobras', 'PETR4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Petróleo Brasileiro S.A. - Petrobras', 'PETR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Petrorecôncavo S.A.', 'RECV3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Petrorio', 'PRIO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Pettenati', 'PTNT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Pettenati', 'PTNT4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Pine', 'PINE4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Planoeplano', 'PLPL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Plascar Part', 'PLAS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Pomifrutas', 'FRTA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Porto Seguro S.A.', 'PSSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Porto Vm', 'PSVM11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Portobello', 'PTBL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Positivo Tec', 'POSI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ppla', 'PPLA11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Priner', 'PRNR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Profarma', 'PFRM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Qualicorp Consultoria e Corretora de Seguros S.A.', 'QUAL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Quero Quero', 'LJQQ3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Raia Drogasil S.A.', 'RADL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Raizen', 'RAIZ4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Randon Part', 'RAPT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Randon Part', 'RAPT4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('RBR Rendimento High Grade', 'RBRR11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Recrusul', 'RCSL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Recrusul', 'RCSL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Rede D Or', 'RDOR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Rede Energia', 'REDE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Renova', 'RNEW11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Renova', 'RNEW3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Renova', 'RNEW4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Riosulense', 'RSUL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Rni', 'RDNI3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Rodobens', 'RBNS11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Rossi Resid', 'RSID3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Rumo S.A.', 'RAIL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sanepar', 'SAPR11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sanepar', 'SAPR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sanepar', 'SAPR4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sansuy', 'SNSY3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sansuy', 'SNSY5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sansuy', 'SNSY6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Santander Br', 'SANB4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Santanense', 'CTSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Santanense', 'CTSA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Santos Brp', 'STBP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sao Carlos', 'SCAR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sao Martinho', 'SMTO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Saraiva Livr', 'SLED3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Saraiva Livr', 'SLED4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Schulz', 'SHUL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Seg Al Bahia', 'CSAB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Seg Al Bahia', 'CSAB4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sequoia Log', 'SEQL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ser Educa', 'SEER3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Simpar', 'SIMH3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sinqia S.A.', 'SQIA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Slc Agricola', 'SLCE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Smart Fit', 'SMFT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Smiles Fidelidade S.A.', 'SMLS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sondotecnica', 'SOND3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sondotecnica', 'SOND5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sondotecnica', 'SOND6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Springs', 'SGPS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Spturis', 'AHEB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Spturis', 'AHEB6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sul America', 'SULA11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sul America', 'SULA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Sul America', 'SULA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Suzano S.A.', 'SUZB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('SYN Prop e Tech', 'SYNE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('TaeSA', 'TAEE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('TaeSA', 'TAEE4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Taurus Armas', 'TASA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Taurus Armas S.A.', 'TASA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tc', 'TRAD3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Technos', 'TECN3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tecnisa S.A.', 'TCSA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tecnosolo', 'TCNO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tecnosolo', 'TCNO4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tegma', 'TGMA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tegra Incorporadora', 'TEGA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Teka', 'TEKA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Teka', 'TEKA4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tekno', 'TKNO4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Telebras', 'TELB3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Telebras', 'TELB4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Telef Brasil', 'VIVT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Telefônica Brasil S.A.', 'VIVT4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tenda', 'TEND3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Terniumsa DRN', 'TXSA34');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Terra Santa', 'TESA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('TerraSAntapa', 'LAND3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tex Renaux', 'TXRX3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('TIM S.A.', 'TIMS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Time For Fun', 'SHOW3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('TOTVS S.A.', 'TOTS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Track Field', 'TFCO4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tran Paulist', 'TRPL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tran Paulist', 'TRPL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Transmissora Aliança de Energia Elétrica S.A.', 'TAEE11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('TreviSA', 'LUXM4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Trisul', 'TRIS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Triunfo Part', 'TPIS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('TRX Real State', 'TRXF11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Tupy', 'TUPY3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('UBS BR Office', 'RECT11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Ultrapar Participações S.A.', 'UGPA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('UnicaSA', 'UCAS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Unipar', 'UNIP3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Unipar', 'UNIP5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Unipar', 'UNIP6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Usiminas', 'USIM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Usiminas', 'USIM6');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Usinas Siderúrgicas de Minas Gerais S.A.', 'USIM5');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Vale S.A.', 'VALE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Valid Solucoes S.A.', 'VLID3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Vamos', 'VAMO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('VBI Losístico', 'LVBI11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('VBI Prime Properties', 'PVBI11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Via Varejo S.A.', 'VIIA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Vibra Energia S.A.', 'VBBR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Vinci Logistica Fundo Investimento Imobiliario FII', 'VILG11');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Vittia Fertilizantes S.A.', 'VITT3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Vivara Participacoes S.A.', 'VIVA3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Viveo', 'VVEO3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Viver', 'VIVR3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Vulcabras', 'VULC3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Wdc Networks', 'LVTC3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('WEG S.A.', 'WEGE3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Westwing', 'WEST3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Wetzel S/A', 'MWET3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Wetzel S/A', 'MWET4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Whirlpool', 'WHRL3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Whirlpool', 'WHRL4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Wilson Sons', 'WSON33');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Wiz Solucoes e Corretagem de Seguros S.A.', 'WIZS3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Wlm Ind Com', 'WLMM3');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('Wlm Ind Com', 'WLMM4');
INSERT INTO public.acoes_b3 (nome, sigla) VALUES ('XP Inc', 'XPBR31');


--
-- TOC entry 3370 (class 0 OID 16551)
-- Dependencies: 214
-- Data for Name: alertas_configurados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alertas_configurados (id, usuario_id, acao_sigla, valor_minimo, valor_maximo, disparo) VALUES (1, 2, 'ITSA4', NULL, 8.67, 'DIARIO');
INSERT INTO public.alertas_configurados (id, usuario_id, acao_sigla, valor_minimo, valor_maximo, disparo) VALUES (2, 2, 'ENG11', 46.10, NULL, 'DIARIO');


--
-- TOC entry 3367 (class 0 OID 16514)
-- Dependencies: 211
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuarios (id, nome, cpf, email, login, password) VALUES (1, 'Marcos da Silva', '07758425699', 'marcos@marcos.com', 'marcos.silva123', '$2a$06$pC3gTS6czoIV32JxPaF1o.zFF/gMBwaEJeSQ/APxfB19YYet8vlt2');
INSERT INTO public.usuarios (id, nome, cpf, email, login, password) VALUES (2, 'Guilherme da Rosa', '32145674522', 'guid.rosa@gmail.com', 'guid.rosa', '$2a$06$QubMH8lSt14zCTsx7PO8deChKQV44ZoBmJ9UtV8avnutLaXGwK0XO');
INSERT INTO public.usuarios (id, nome, cpf, email, login, password) VALUES (3, 'Livia Figueredo', '33467893411', 'livia.o2@meudia.com', 'liviameudia22', '$2a$06$IN0dqdsDFY5F3/TNrMrOo./Es8uh0siwr5KLcPiIKzkIZldeTh1Cq');


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 213
-- Name: alertas_configurados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alertas_configurados_id_seq', 2, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 210
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 3, true);


--
-- TOC entry 3222 (class 2606 OID 16539)
-- Name: acoes_b3 acoes_b3_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acoes_b3
    ADD CONSTRAINT acoes_b3_pkey PRIMARY KEY (sigla);


--
-- TOC entry 3224 (class 2606 OID 16558)
-- Name: alertas_configurados alertas_configurados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas_configurados
    ADD CONSTRAINT alertas_configurados_pkey PRIMARY KEY (id);


--
-- TOC entry 3216 (class 2606 OID 16523)
-- Name: usuarios usuarios_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_cpf_key UNIQUE (cpf);


--
-- TOC entry 3218 (class 2606 OID 16525)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 3220 (class 2606 OID 16521)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 16559)
-- Name: alertas_configurados alertas_configurados_acao_sigla_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas_configurados
    ADD CONSTRAINT alertas_configurados_acao_sigla_fkey FOREIGN KEY (acao_sigla) REFERENCES public.acoes_b3(sigla) NOT VALID;


--
-- TOC entry 3226 (class 2606 OID 16564)
-- Name: alertas_configurados alertas_configurados_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alertas_configurados
    ADD CONSTRAINT alertas_configurados_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) NOT VALID;

COMMIT;
-- Completed on 2022-09-24 01:34:40 UTC

--
-- PostgreSQL database dump complete
--

