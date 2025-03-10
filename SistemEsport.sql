PGDMP      #                |            SistemEsporte    10.23    16.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    32782    SistemEsporte    DATABASE     �   CREATE DATABASE "SistemEsporte" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE "SistemEsporte";
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            	           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    6            �            1259    40992 	   jogadores    TABLE       CREATE TABLE public.jogadores (
    id integer NOT NULL,
    nome character varying(40),
    "time" character varying(50),
    numero_camisa integer,
    senha character varying(40),
    funcao character varying(40),
    nacionalidade character varying(40)
);
    DROP TABLE public.jogadores;
       public            postgres    false    6            �            1259    40990    jogadores_id_seq    SEQUENCE     �   CREATE SEQUENCE public.jogadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.jogadores_id_seq;
       public          postgres    false    197    6            
           0    0    jogadores_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.jogadores_id_seq OWNED BY public.jogadores.id;
          public          postgres    false    196            �            1259    41013    tecnico_admin    TABLE     -  CREATE TABLE public.tecnico_admin (
    id integer NOT NULL,
    nome character varying(30),
    pais character varying(100) NOT NULL,
    email character varying(30),
    senha character varying(50),
    funcoo character varying(10),
    "Time" character varying,
    "time" character varying(40)
);
 !   DROP TABLE public.tecnico_admin;
       public            postgres    false    6            �            1259    41011    tecnico_admin_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tecnico_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tecnico_admin_id_seq;
       public          postgres    false    199    6                       0    0    tecnico_admin_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tecnico_admin_id_seq OWNED BY public.tecnico_admin.id;
          public          postgres    false    198            �            1259    49171    time    TABLE     B  CREATE TABLE public."time" (
    id_time integer NOT NULL,
    nome_instituicao character varying(40),
    cidade_estado character varying(40),
    pais character varying(40),
    liga character varying(29),
    competicoees character varying(60),
    estadio character varying(20),
    categoria character varying(20)
);
    DROP TABLE public."time";
       public            postgres    false    6            �            1259    49169    time_id_time_seq    SEQUENCE     �   CREATE SEQUENCE public.time_id_time_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.time_id_time_seq;
       public          postgres    false    201    6                       0    0    time_id_time_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.time_id_time_seq OWNED BY public."time".id_time;
          public          postgres    false    200            {
           2604    40995    jogadores id    DEFAULT     l   ALTER TABLE ONLY public.jogadores ALTER COLUMN id SET DEFAULT nextval('public.jogadores_id_seq'::regclass);
 ;   ALTER TABLE public.jogadores ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    196    197    197            |
           2604    41016    tecnico_admin id    DEFAULT     t   ALTER TABLE ONLY public.tecnico_admin ALTER COLUMN id SET DEFAULT nextval('public.tecnico_admin_id_seq'::regclass);
 ?   ALTER TABLE public.tecnico_admin ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    198    199    199            }
           2604    49174    time id_time    DEFAULT     n   ALTER TABLE ONLY public."time" ALTER COLUMN id_time SET DEFAULT nextval('public.time_id_time_seq'::regclass);
 =   ALTER TABLE public."time" ALTER COLUMN id_time DROP DEFAULT;
       public          postgres    false    201    200    201            �
          0    40992 	   jogadores 
   TABLE DATA           b   COPY public.jogadores (id, nome, "time", numero_camisa, senha, funcao, nacionalidade) FROM stdin;
    public          postgres    false    197   �                  0    41013    tecnico_admin 
   TABLE DATA           ]   COPY public.tecnico_admin (id, nome, pais, email, senha, funcoo, "Time", "time") FROM stdin;
    public          postgres    false    199                    0    49171    time 
   TABLE DATA           x   COPY public."time" (id_time, nome_instituicao, cidade_estado, pais, liga, competicoees, estadio, categoria) FROM stdin;
    public          postgres    false    201   �                  0    0    jogadores_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.jogadores_id_seq', 12, true);
          public          postgres    false    196                       0    0    tecnico_admin_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tecnico_admin_id_seq', 4, true);
          public          postgres    false    198                       0    0    time_id_time_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.time_id_time_seq', 2, true);
          public          postgres    false    200            
           2606    40997    jogadores jogadores_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.jogadores
    ADD CONSTRAINT jogadores_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.jogadores DROP CONSTRAINT jogadores_pkey;
       public            postgres    false    197            �
           2606    41018     tecnico_admin tecnico_admin_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tecnico_admin
    ADD CONSTRAINT tecnico_admin_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.tecnico_admin DROP CONSTRAINT tecnico_admin_pkey;
       public            postgres    false    199            �
           2606    49176    time time_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."time"
    ADD CONSTRAINT time_pkey PRIMARY KEY (id_time);
 :   ALTER TABLE ONLY public."time" DROP CONSTRAINT time_pkey;
       public            postgres    false    201            �
     x�e��N!��O�w�Y��W0�f�%aaw �����6��p2�����ؗ����A�.vK���NxM��u�B�bq�ǌ��
��!��#�W��R�eg�,⭲נBsuxb�����o�-�4���08.	}�X�֛m�e����1tg�e�685��1�|���Im�.R���H�<��2�jw׫�0Ёݕ�ʢ��s�F6f��?N��J�g���:�.g&6.�H����1��I�5�$�'mh��|Z���?�K`)�l+����/㔸�C���?(��n��          y   x�-�K
�@D�Շ�\@EPO�M1cä2� ��6ȫ���G7p�55�W~`�D%ZN���=b���R.�2��%�5{�I�KiU���Zq��_ك�z��?��1��r�e֨��J��/��,�         �   x�m�1
�@E��S�	z�,im�dāa'�l��Q��	D�����>oO�\�]P����r�Y���݂�Bì�V,����G�۳���,4��$BUӁN��O���\y�9Dc]��k��t٥�>��@�     