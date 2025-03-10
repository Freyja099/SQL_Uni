PGDMP                      |           Gestion_Clients    17.2    17.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            	           1262    16394    Gestion_Clients    DATABASE     �   CREATE DATABASE "Gestion_Clients" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Canada.1256';
 !   DROP DATABASE "Gestion_Clients";
                     postgres    false            �            1259    16410    article    TABLE     �   CREATE TABLE public.article (
    idarticle integer NOT NULL,
    designation character varying(60),
    prix_unit numeric(7,2) NOT NULL,
    qtestock integer
);
    DROP TABLE public.article;
       public         heap r       postgres    false            �            1259    16395    client    TABLE     �   CREATE TABLE public.client (
    idclient integer NOT NULL,
    nom character varying(30),
    adresse character varying(120),
    ville character varying(30),
    telephone character varying(20)
);
    DROP TABLE public.client;
       public         heap r       postgres    false            �            1259    16400    commande    TABLE     f   CREATE TABLE public.commande (
    numcom integer NOT NULL,
    idclient integer,
    datecom date
);
    DROP TABLE public.commande;
       public         heap r       postgres    false            �            1259    16415    lignecommande    TABLE     �   CREATE TABLE public.lignecommande (
    nuligne integer NOT NULL,
    numcom integer,
    idarticle integer,
    qtecom integer NOT NULL
);
 !   DROP TABLE public.lignecommande;
       public         heap r       postgres    false                      0    16410    article 
   TABLE DATA           N   COPY public.article (idarticle, designation, prix_unit, qtestock) FROM stdin;
    public               postgres    false    219   �                  0    16395    client 
   TABLE DATA           J   COPY public.client (idclient, nom, adresse, ville, telephone) FROM stdin;
    public               postgres    false    217   -                 0    16400    commande 
   TABLE DATA           =   COPY public.commande (numcom, idclient, datecom) FROM stdin;
    public               postgres    false    218   +                 0    16415    lignecommande 
   TABLE DATA           K   COPY public.lignecommande (nuligne, numcom, idarticle, qtecom) FROM stdin;
    public               postgres    false    220   �       h           2606    16414    article article_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (idarticle);
 >   ALTER TABLE ONLY public.article DROP CONSTRAINT article_pkey;
       public                 postgres    false    219            d           2606    16399    client client_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (idclient);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public                 postgres    false    217            f           2606    16404    commande commande_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_pkey PRIMARY KEY (numcom);
 @   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_pkey;
       public                 postgres    false    218            k           2606    16419     lignecommande lignecommande_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.lignecommande
    ADD CONSTRAINT lignecommande_pkey PRIMARY KEY (nuligne);
 J   ALTER TABLE ONLY public.lignecommande DROP CONSTRAINT lignecommande_pkey;
       public                 postgres    false    220            i           1259    16430    idx_lignecommande_composite    INDEX     `   CREATE INDEX idx_lignecommande_composite ON public.lignecommande USING btree (nuligne, numcom);
 /   DROP INDEX public.idx_lignecommande_composite;
       public                 postgres    false    220    220            l           2606    16405    commande commande_idclient_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.commande
    ADD CONSTRAINT commande_idclient_fkey FOREIGN KEY (idclient) REFERENCES public.client(idclient);
 I   ALTER TABLE ONLY public.commande DROP CONSTRAINT commande_idclient_fkey;
       public               postgres    false    217    218    4708            m           2606    16425 *   lignecommande lignecommande_idarticle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lignecommande
    ADD CONSTRAINT lignecommande_idarticle_fkey FOREIGN KEY (idarticle) REFERENCES public.article(idarticle);
 T   ALTER TABLE ONLY public.lignecommande DROP CONSTRAINT lignecommande_idarticle_fkey;
       public               postgres    false    220    4712    219            n           2606    16420 '   lignecommande lignecommande_numcom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lignecommande
    ADD CONSTRAINT lignecommande_numcom_fkey FOREIGN KEY (numcom) REFERENCES public.commande(numcom);
 Q   ALTER TABLE ONLY public.lignecommande DROP CONSTRAINT lignecommande_numcom_fkey;
       public               postgres    false    4710    218    220               5  x�MQ�r�0��_�.�G:I(Ԧ���I�Fc3"�!B��פ����R�w��=���>@I��C���%U��(�����I@��}���ҧ�@MC�Q�-(�S�vj�)����(b`��#��	S��6��I,�
'f΄�{�$�;�H`-��J���=�?6�#��
y�=��i�r\���rWS�L��`
�X䯫��S�_�~��q3	,����:����Ceߤ��:x�ƞոD(Á��#�܁Xm6�"���89�El��k���/���0�X�:t>]H{m�#ϲ�&u�          �  x�m�K��0�ןN�];0�--�q�`�BB7J�0����@nԞc.Vف���������B��5�W<9��:�� �{���Hr���$L*�T*H�UZ �#�p�������7?@�H�WHj�8��Kb`z�ve{�/צz��pA�D&2Z�t9߸����>�'#R#I���i���G�\K����[�\�'<�D�)���0�o�n�u��وㅿ�}_>���11m�i��3�R��g�\s��:
Y)�4�LIk�$-�����7w�}U?e���(Εt��.-v���˵����&p�p����1H��e1Hy��ձ«7_W�sן���mT�(A('6B,)d��������*�G�aR38U����"ʾ�9�^����AJe��h���x��y��w��K�/����ql�����VC� I�`�f?����7<�����id$�`�MB�����:���oS����f��"��T�?         j   x�M���@���.T6v��s�"�R~�l��\U��Jc�Ybv�[/�L��_Z'htĞ���<P=+⚭[ON�B�i�^�h����lS`J�_sx���N         B   x�ʱ�0���?L�����%��w<��{�*FA�C������p��s��f��eZ/ӾS���H����     