PGDMP         -                z            users    14.2    14.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16558    users    DATABASE     b   CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE users;
                postgres    false            �            1259    16577    comments    TABLE     �   CREATE TABLE public.comments (
    id integer NOT NULL,
    text text NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL
);
    DROP TABLE public.comments;
       public         heap    postgres    false            �            1259    16584    likes    TABLE     s   CREATE TABLE public.likes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL
);
    DROP TABLE public.likes;
       public         heap    postgres    false            �            1259    16570    posts    TABLE     �   CREATE TABLE public.posts (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16563    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    age integer NOT NULL,
    gender text NOT NULL,
    nationality text NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false                      0    16577    comments 
   TABLE DATA           >   COPY public.comments (id, text, user_id, post_id) FROM stdin;
    public          postgres    false    211   �       	          0    16584    likes 
   TABLE DATA           5   COPY public.likes (id, user_id, post_id) FROM stdin;
    public          postgres    false    212   �                 0    16570    posts 
   TABLE DATA           @   COPY public.posts (id, title, description, user_id) FROM stdin;
    public          postgres    false    210   �                 0    16563    users 
   TABLE DATA           C   COPY public.users (id, name, age, gender, nationality) FROM stdin;
    public          postgres    false    209   �#       m           2606    16583    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    211            t           2606    16588    likes likes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_pkey;
       public            postgres    false    212            k           2606    16576    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    210            h           2606    16567    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    209            n           1259    16624    fk_comments    INDEX     C   CREATE INDEX fk_comments ON public.comments USING btree (user_id);
    DROP INDEX public.fk_comments;
       public            postgres    false    211            q           1259    16630    fk_like    INDEX     <   CREATE INDEX fk_like ON public.likes USING btree (user_id);
    DROP INDEX public.fk_like;
       public            postgres    false    212            o           1259    16612    fki_users - comments    INDEX     N   CREATE INDEX "fki_users - comments" ON public.comments USING btree (user_id);
 *   DROP INDEX public."fki_users - comments";
       public            postgres    false    211            i           1259    16594    fki_users - posts    INDEX     H   CREATE INDEX "fki_users - posts" ON public.posts USING btree (user_id);
 '   DROP INDEX public."fki_users - posts";
       public            postgres    false    210            r           1259    16618    likes f    INDEX     9   CREATE INDEX "likes f" ON public.likes USING btree (id);
    DROP INDEX public."likes f";
       public            postgres    false    212            p           1259    16642    posts - comments    INDEX     J   CREATE INDEX "posts - comments" ON public.comments USING btree (post_id);
 &   DROP INDEX public."posts - comments";
       public            postgres    false    211            u           1259    16636    posts - likes    INDEX     D   CREATE INDEX "posts - likes" ON public.likes USING btree (post_id);
 #   DROP INDEX public."posts - likes";
       public            postgres    false    212            x           2606    16637    comments comments_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) NOT VALID;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_post_id_fkey;
       public          postgres    false    3179    210    211            w           2606    16619    comments comments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public          postgres    false    211    3176    209            z           2606    16631    likes likes_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) NOT VALID;
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_post_id_fkey;
       public          postgres    false    3179    210    212            y           2606    16625    likes likes_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_user_id_fkey;
       public          postgres    false    209    212    3176            v           2606    16600    posts users - posts    FK CONSTRAINT     �   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "users - posts" FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.posts DROP CONSTRAINT "users - posts";
       public          postgres    false    210    209    3176                  x������ � �      	      x������ � �         �  x�}V�nSW}>�����5����C/T����ċEe�D�2��7�bB�@Hi��J��T�N��_��/��	]k�q���
���{f��Z�fg��S7�e��˞yn���L`:b�L`�M��Md��p˼.`�okv�D�þ��%߄b6`�k/6�yϴ�=����W�J�M�Χ
�B�4ॏ˻�Q�6|7�vή��ofoOL��^�ه�W< 9zk�Q���K&'�90=��+����	Կ]r[��4�>`F��Y
n�5؅v&s8�r��xp5n�Ϟ�et��������]�	���
�4���~��}�y�%C�{�t�4�������������@��E@��`h��o�)�L5X��
|���L��*��.8;�~'�eY���8U��51Y.M]+UD����|�Ň�������2^�+Ū�d���9��&������i�x���xi�x�ρHM+���R�f�\�F��i �%iW��5����xc�4�Q.�\(g��@-p��Jĥ"�u��9�����}�E$c�}[�k�c�5�X����	yMF�RlPS�/`j�I��B9�P"��h1�d�0Ne&� �C���FZ��	�7wB�:�L�DJ�>;�'I��K�u�4`ˆ�!�o�e/���O��V�+Y���P�NoJ:ו,`R�Ɏ73���V��ھ����]����q����{���O�^�,��S��r��^����k����a dl�� �w�l8����*��uϐϡ��Jb��%���S�+�
���4q��r��QQ�d�#ɜ}�!�E`��8U�(���E�¸��l�r2V�w����q�1�ƻ�a�`B��E��71�MR:��ю���i��u�F\�$鼥`bkW带̤Ն�yT����A�P�F�:V^Ep5/�w]gя/h����VT�>4��̠x.#����s���&���ϾR�1��t�ǭ��a?�\�IǪ�����si>�Y^�yc���z�]���B%���/�	>	i��;�{�u%{!��/��c_۲�ؖvU�\_�TI�DXk��)�*�{�\l���,�#��.`�i���.Ш�}G׬�(�������ѭ�58B��E�%O�B5jxa<��x�9��`�:`֜��ն��TW��e��A� 0��
��j��k*)�w��P3��@�娱����B��gd|8�6��x����t��Rn�E��Sה&��ࢽ����`_�|�^p{�SH:;���іS���C�D�%ԑ���>oJ�@����d�,�)�56-��@�Ӣnĵ��y�n>9j��.~>ĠK���"Hq�(�d��9t��zs�2�zg:51s�|��]�R-����9����Q��GxH]:6�,M�-ݥ����G�z,�����*�(���x `���4Q)�^�]�50w6O�Cǭ����u�=̎�9yw)J�ζh���[��&7D2i[�(�B9p-�1İ��K�?��p��sL���SG���^6QH%� Gٖ         n   x�5��
�@�#qUb���`k�������c�T3���;�	8�{�V'��d%F��f�J�5�t��L�y�V��1����`�ř
4r�����S"���"�     