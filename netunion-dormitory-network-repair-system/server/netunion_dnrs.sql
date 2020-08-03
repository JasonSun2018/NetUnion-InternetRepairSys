toc.dat                                                                                             0000600 0004000 0002000 00000031211 13711716213 0014437 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       '                    x            netunion_dnrs    11.8    11.8 +    ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         >           1262    16393    netunion_dnrs    DATABASE     k   CREATE DATABASE netunion_dnrs WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE netunion_dnrs;
             postgres    false         �            1259    16535    account_basic    TABLE     �   CREATE TABLE public.account_basic (
    id integer NOT NULL,
    std_id text NOT NULL,
    name text,
    telephone character(11),
    gender text,
    campus text
);
 !   DROP TABLE public.account_basic;
       public         postgres    false         �            1259    16533    account_basic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_basic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_basic_id_seq;
       public       postgres    false    199         ?           0    0    account_basic_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.account_basic_id_seq OWNED BY public.account_basic.id;
            public       postgres    false    198         �            1259    16555    account_login_details    TABLE     �   CREATE TABLE public.account_login_details (
    std_id text NOT NULL,
    id integer NOT NULL,
    password character(32) NOT NULL,
    user_group text DEFAULT 'user'::text NOT NULL
);
 )   DROP TABLE public.account_login_details;
       public         postgres    false         �            1259    16584    account_solver    TABLE     j   CREATE TABLE public.account_solver (
    nickname text,
    intro text
)
INHERITS (public.account_basic);
 "   DROP TABLE public.account_solver;
       public         postgres    false    199         �            1259    16575    account_user    TABLE     Y   CREATE TABLE public.account_user (
    dormitory text
)
INHERITS (public.account_basic);
     DROP TABLE public.account_user;
       public         postgres    false    199         �            1259    16394    order    TABLE     �  CREATE TABLE public."order" (
    order_user_name text NOT NULL,
    order_user_gender text NOT NULL,
    order_user_telephone text NOT NULL,
    order_user_campus text NOT NULL,
    order_user_dormitory text NOT NULL,
    order_user_description text,
    order_status text NOT NULL,
    order_solver_id integer,
    order_user_id integer NOT NULL,
    order_date text NOT NULL,
    order_id text NOT NULL
);
    DROP TABLE public."order";
       public         postgres    false         @           0    0    TABLE "order"    COMMENT     6   COMMENT ON TABLE public."order" IS '订单信息表';
            public       postgres    false    196         A           0    0    COLUMN "order".order_date    COMMENT     E   COMMENT ON COLUMN public."order".order_date IS '订单创建日期';
            public       postgres    false    196         �            1259    16400    token    TABLE     |   CREATE TABLE public.token (
    token character(32) NOT NULL,
    expiration_date text NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.token;
       public         postgres    false         B           0    0    TABLE token    COMMENT     �   COMMENT ON TABLE public.token IS '存放用户的登陆令牌，
当调用后端时首先访问此处验证用户的登陆状况。
令牌的有效期为 1 天。';
            public       postgres    false    197         C           0    0    COLUMN token.token    COMMENT     8   COMMENT ON COLUMN public.token.token IS '用户令牌';
            public       postgres    false    197         D           0    0    COLUMN token.expiration_date    COMMENT     Q   COMMENT ON COLUMN public.token.expiration_date IS '用户令牌的过期时间';
            public       postgres    false    197         E           0    0    COLUMN token.id    COMMENT     G   COMMENT ON COLUMN public.token.id IS '用户令牌对应的用户 id';
            public       postgres    false    197         �
           2604    16538    account_basic id    DEFAULT     t   ALTER TABLE ONLY public.account_basic ALTER COLUMN id SET DEFAULT nextval('public.account_basic_id_seq'::regclass);
 ?   ALTER TABLE public.account_basic ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199         �
           2604    16587    account_solver id    DEFAULT     u   ALTER TABLE ONLY public.account_solver ALTER COLUMN id SET DEFAULT nextval('public.account_basic_id_seq'::regclass);
 @   ALTER TABLE public.account_solver ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    202         �
           2604    16578    account_user id    DEFAULT     s   ALTER TABLE ONLY public.account_user ALTER COLUMN id SET DEFAULT nextval('public.account_basic_id_seq'::regclass);
 >   ALTER TABLE public.account_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    201         5          0    16535    account_basic 
   TABLE DATA               T   COPY public.account_basic (id, std_id, name, telephone, gender, campus) FROM stdin;
    public       postgres    false    199       2869.dat 6          0    16555    account_login_details 
   TABLE DATA               Q   COPY public.account_login_details (std_id, id, password, user_group) FROM stdin;
    public       postgres    false    200       2870.dat 8          0    16584    account_solver 
   TABLE DATA               f   COPY public.account_solver (id, std_id, name, telephone, gender, campus, nickname, intro) FROM stdin;
    public       postgres    false    202       2872.dat 7          0    16575    account_user 
   TABLE DATA               ^   COPY public.account_user (id, std_id, name, telephone, gender, campus, dormitory) FROM stdin;
    public       postgres    false    201       2871.dat 2          0    16394    order 
   TABLE DATA               �   COPY public."order" (order_user_name, order_user_gender, order_user_telephone, order_user_campus, order_user_dormitory, order_user_description, order_status, order_solver_id, order_user_id, order_date, order_id) FROM stdin;
    public       postgres    false    196       2866.dat 3          0    16400    token 
   TABLE DATA               ;   COPY public.token (token, expiration_date, id) FROM stdin;
    public       postgres    false    197       2867.dat F           0    0    account_basic_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.account_basic_id_seq', 1, false);
            public       postgres    false    198         �
           2606    16554 (   account_basic account_basic_campus_check    CHECK CONSTRAINT     �   ALTER TABLE public.account_basic
    ADD CONSTRAINT account_basic_campus_check CHECK (((campus = '清水河校区(Qingshuihe Campus)'::text) OR (campus = '沙河校区(Shahe Campus)'::text))) NOT VALID;
 M   ALTER TABLE public.account_basic DROP CONSTRAINT account_basic_campus_check;
       public       postgres    false    199    199         �
           2606    16549 (   account_basic account_basic_gender_check    CHECK CONSTRAINT     �   ALTER TABLE public.account_basic
    ADD CONSTRAINT account_basic_gender_check CHECK (((gender = '男(Male)'::text) OR (gender = '女(Female)'::text))) NOT VALID;
 M   ALTER TABLE public.account_basic DROP CONSTRAINT account_basic_gender_check;
       public       postgres    false    199    199         �
           2606    16551 "   account_basic account_basic_id_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.account_basic
    ADD CONSTRAINT account_basic_id_key UNIQUE (id);
 L   ALTER TABLE ONLY public.account_basic DROP CONSTRAINT account_basic_id_key;
       public         postgres    false    199         �
           2606    16543     account_basic account_basic_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.account_basic
    ADD CONSTRAINT account_basic_pkey PRIMARY KEY (id, std_id);
 J   ALTER TABLE ONLY public.account_basic DROP CONSTRAINT account_basic_pkey;
       public         postgres    false    199    199         �
           2606    16553 &   account_basic account_basic_std_id_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.account_basic
    ADD CONSTRAINT account_basic_std_id_key UNIQUE (std_id);
 P   ALTER TABLE ONLY public.account_basic DROP CONSTRAINT account_basic_std_id_key;
       public         postgres    false    199         �
           2606    16624 0   account_login_details account_login_details_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.account_login_details
    ADD CONSTRAINT account_login_details_pkey PRIMARY KEY (std_id, id);
 Z   ALTER TABLE ONLY public.account_login_details DROP CONSTRAINT account_login_details_pkey;
       public         postgres    false    200    200         �
           2606    16617 9   account_login_details account_login_details_std_id_id_key 
   CONSTRAINT     z   ALTER TABLE ONLY public.account_login_details
    ADD CONSTRAINT account_login_details_std_id_id_key UNIQUE (std_id, id);
 c   ALTER TABLE ONLY public.account_login_details DROP CONSTRAINT account_login_details_std_id_id_key;
       public         postgres    false    200    200         �
           2606    16574 <   account_login_details account_login_details_user_group_check    CHECK CONSTRAINT     �   ALTER TABLE public.account_login_details
    ADD CONSTRAINT account_login_details_user_group_check CHECK (((user_group = 'user'::text) OR (user_group = 'solver'::text) OR (user_group = 'admin'::text))) NOT VALID;
 a   ALTER TABLE public.account_login_details DROP CONSTRAINT account_login_details_user_group_check;
       public       postgres    false    200    200         �
           2606    16596 +   account_solver account_solver_id_std_id_key 
   CONSTRAINT     l   ALTER TABLE ONLY public.account_solver
    ADD CONSTRAINT account_solver_id_std_id_key UNIQUE (id, std_id);
 U   ALTER TABLE ONLY public.account_solver DROP CONSTRAINT account_solver_id_std_id_key;
       public         postgres    false    202    202         �
           2606    16594 "   account_solver account_solver_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.account_solver
    ADD CONSTRAINT account_solver_pkey PRIMARY KEY (id, std_id);
 L   ALTER TABLE ONLY public.account_solver DROP CONSTRAINT account_solver_pkey;
       public         postgres    false    202    202         �
           2606    16605 '   account_user account_user_id_std_id_key 
   CONSTRAINT     h   ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_id_std_id_key UNIQUE (id, std_id);
 Q   ALTER TABLE ONLY public.account_user DROP CONSTRAINT account_user_id_std_id_key;
       public         postgres    false    201    201         �
           2606    16603    account_user account_user_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_pkey PRIMARY KEY (id, std_id);
 H   ALTER TABLE ONLY public.account_user DROP CONSTRAINT account_user_pkey;
       public         postgres    false    201    201         �
           2606    16530    order order_check    CHECK CONSTRAINT     p   ALTER TABLE public."order"
    ADD CONSTRAINT order_check CHECK ((order_user_id <> order_solver_id)) NOT VALID;
 8   ALTER TABLE public."order" DROP CONSTRAINT order_check;
       public       postgres    false    196    196    196    196         �
           2606    16532    order order_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_user_id, order_id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public         postgres    false    196    196         �
           2606    16422    token user_token_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.token
    ADD CONSTRAINT user_token_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY public.token DROP CONSTRAINT user_token_pkey;
       public         postgres    false    197                                                                                                                                                                                                                                                                                                                                                                                               2869.dat                                                                                            0000600 0004000 0002000 00000000005 13711716213 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2870.dat                                                                                            0000600 0004000 0002000 00000000163 13711716213 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2020091202000	1	42253fa978ca4bbf95668ec455e4844d	user
2018091202000	2	42253fa978ca4bbf95668ec455e4844d	solver
\.


                                                                                                                                                                                                                                                                                                                                                                                                             2872.dat                                                                                            0000600 0004000 0002000 00000000151 13711716213 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	2018091202000	solverAccount	18980350000	女(Female)	沙河校区(Shahe Campus)	Nick	Hello, world.
\.


                                                                                                                                                                                                                                                                                                                                                                                                                       2871.dat                                                                                            0000600 0004000 0002000 00000000133 13711716213 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2020091202000	user	18980340000	女(Female)	沙河校区(Shahe Campus)	某宿舍 123
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                     2866.dat                                                                                            0000600 0004000 0002000 00000002061 13711716213 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        Jason	男(Male)	18980340000	沙河校区(Shahe Campus)	欣2栋 233		canceled by user	\N	1	2020/3/26 下午6:32:04	00000103261832042020002
Jason	男(Male)	18980340000	沙河校区(Shahe Campus)	欣2栋 233		canceled by user	\N	1	2020/3/26 下午6:33:50	00000103261833502020043
Jason	男(Male)	18980340000	沙河校区(Shahe Campus)	欣2栋 233		canceled by user	\N	1	2020/3/31 上午11:34:50	00000103311134502020007
Jason	男(Male)	18980340000	沙河校区(Shahe Campus)	欣2栋 233	天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪天哪	canceled by user	\N	1	2020/3/31 上午11:54:35	00000103311154352020049
Jason	女(Female)	18980340000	沙河校区(Shahe Campus)	欣2栋 234	你好世界！	canceled by user	\N	1	2020/8/2 下午8:22:48	00000108022022482020088
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                               2867.dat                                                                                            0000600 0004000 0002000 00000000147 13711716213 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        c3c9c3ce62c4ec4a68cddbdf258e4a9d	1596517652989	2
ef546fb65bdf36b4fc5c31b2481e0bea	1596517677303	1
\.


                                                                                                                                                                                                                                                                                                                                                                                                                         restore.sql                                                                                         0000600 0004000 0002000 00000025042 13711716213 0015371 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8
-- Dumped by pg_dump version 11.8

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

DROP DATABASE netunion_dnrs;
--
-- Name: netunion_dnrs; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE netunion_dnrs WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE netunion_dnrs OWNER TO postgres;

\connect netunion_dnrs

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

SET default_with_oids = false;

--
-- Name: account_basic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_basic (
    id integer NOT NULL,
    std_id text NOT NULL,
    name text,
    telephone character(11),
    gender text,
    campus text
);


ALTER TABLE public.account_basic OWNER TO postgres;

--
-- Name: account_basic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_basic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_basic_id_seq OWNER TO postgres;

--
-- Name: account_basic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_basic_id_seq OWNED BY public.account_basic.id;


--
-- Name: account_login_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_login_details (
    std_id text NOT NULL,
    id integer NOT NULL,
    password character(32) NOT NULL,
    user_group text DEFAULT 'user'::text NOT NULL
);


ALTER TABLE public.account_login_details OWNER TO postgres;

--
-- Name: account_solver; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_solver (
    nickname text,
    intro text
)
INHERITS (public.account_basic);


ALTER TABLE public.account_solver OWNER TO postgres;

--
-- Name: account_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_user (
    dormitory text
)
INHERITS (public.account_basic);


ALTER TABLE public.account_user OWNER TO postgres;

--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    order_user_name text NOT NULL,
    order_user_gender text NOT NULL,
    order_user_telephone text NOT NULL,
    order_user_campus text NOT NULL,
    order_user_dormitory text NOT NULL,
    order_user_description text,
    order_status text NOT NULL,
    order_solver_id integer,
    order_user_id integer NOT NULL,
    order_date text NOT NULL,
    order_id text NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- Name: TABLE "order"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."order" IS '订单信息表';


--
-- Name: COLUMN "order".order_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."order".order_date IS '订单创建日期';


--
-- Name: token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token (
    token character(32) NOT NULL,
    expiration_date text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.token OWNER TO postgres;

--
-- Name: TABLE token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.token IS '存放用户的登陆令牌，
当调用后端时首先访问此处验证用户的登陆状况。
令牌的有效期为 1 天。';


--
-- Name: COLUMN token.token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.token.token IS '用户令牌';


--
-- Name: COLUMN token.expiration_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.token.expiration_date IS '用户令牌的过期时间';


--
-- Name: COLUMN token.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.token.id IS '用户令牌对应的用户 id';


--
-- Name: account_basic id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_basic ALTER COLUMN id SET DEFAULT nextval('public.account_basic_id_seq'::regclass);


--
-- Name: account_solver id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_solver ALTER COLUMN id SET DEFAULT nextval('public.account_basic_id_seq'::regclass);


--
-- Name: account_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user ALTER COLUMN id SET DEFAULT nextval('public.account_basic_id_seq'::regclass);


--
-- Data for Name: account_basic; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_basic (id, std_id, name, telephone, gender, campus) FROM stdin;
\.
COPY public.account_basic (id, std_id, name, telephone, gender, campus) FROM '$$PATH$$/2869.dat';

--
-- Data for Name: account_login_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_login_details (std_id, id, password, user_group) FROM stdin;
\.
COPY public.account_login_details (std_id, id, password, user_group) FROM '$$PATH$$/2870.dat';

--
-- Data for Name: account_solver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_solver (id, std_id, name, telephone, gender, campus, nickname, intro) FROM stdin;
\.
COPY public.account_solver (id, std_id, name, telephone, gender, campus, nickname, intro) FROM '$$PATH$$/2872.dat';

--
-- Data for Name: account_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_user (id, std_id, name, telephone, gender, campus, dormitory) FROM stdin;
\.
COPY public.account_user (id, std_id, name, telephone, gender, campus, dormitory) FROM '$$PATH$$/2871.dat';

--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (order_user_name, order_user_gender, order_user_telephone, order_user_campus, order_user_dormitory, order_user_description, order_status, order_solver_id, order_user_id, order_date, order_id) FROM stdin;
\.
COPY public."order" (order_user_name, order_user_gender, order_user_telephone, order_user_campus, order_user_dormitory, order_user_description, order_status, order_solver_id, order_user_id, order_date, order_id) FROM '$$PATH$$/2866.dat';

--
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token (token, expiration_date, id) FROM stdin;
\.
COPY public.token (token, expiration_date, id) FROM '$$PATH$$/2867.dat';

--
-- Name: account_basic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_basic_id_seq', 1, false);


--
-- Name: account_basic account_basic_campus_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.account_basic
    ADD CONSTRAINT account_basic_campus_check CHECK (((campus = '清水河校区(Qingshuihe Campus)'::text) OR (campus = '沙河校区(Shahe Campus)'::text))) NOT VALID;


--
-- Name: account_basic account_basic_gender_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.account_basic
    ADD CONSTRAINT account_basic_gender_check CHECK (((gender = '男(Male)'::text) OR (gender = '女(Female)'::text))) NOT VALID;


--
-- Name: account_basic account_basic_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_basic
    ADD CONSTRAINT account_basic_id_key UNIQUE (id);


--
-- Name: account_basic account_basic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_basic
    ADD CONSTRAINT account_basic_pkey PRIMARY KEY (id, std_id);


--
-- Name: account_basic account_basic_std_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_basic
    ADD CONSTRAINT account_basic_std_id_key UNIQUE (std_id);


--
-- Name: account_login_details account_login_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_login_details
    ADD CONSTRAINT account_login_details_pkey PRIMARY KEY (std_id, id);


--
-- Name: account_login_details account_login_details_std_id_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_login_details
    ADD CONSTRAINT account_login_details_std_id_id_key UNIQUE (std_id, id);


--
-- Name: account_login_details account_login_details_user_group_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.account_login_details
    ADD CONSTRAINT account_login_details_user_group_check CHECK (((user_group = 'user'::text) OR (user_group = 'solver'::text) OR (user_group = 'admin'::text))) NOT VALID;


--
-- Name: account_solver account_solver_id_std_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_solver
    ADD CONSTRAINT account_solver_id_std_id_key UNIQUE (id, std_id);


--
-- Name: account_solver account_solver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_solver
    ADD CONSTRAINT account_solver_pkey PRIMARY KEY (id, std_id);


--
-- Name: account_user account_user_id_std_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_id_std_id_key UNIQUE (id, std_id);


--
-- Name: account_user account_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_pkey PRIMARY KEY (id, std_id);


--
-- Name: order order_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public."order"
    ADD CONSTRAINT order_check CHECK ((order_user_id <> order_solver_id)) NOT VALID;


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_user_id, order_id);


--
-- Name: token user_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT user_token_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              