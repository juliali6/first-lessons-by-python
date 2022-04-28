--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-28 12:14:45

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
-- TOC entry 211 (class 1259 OID 16577)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    text text NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16584)
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16570)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16563)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    age integer NOT NULL,
    gender text NOT NULL,
    nationality text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3336 (class 0 OID 16577)
-- Dependencies: 211
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3337 (class 0 OID 16584)
-- Dependencies: 212
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3335 (class 0 OID 16570)
-- Dependencies: 210
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.posts VALUES (1, 'Dilan Moran', 'Сценарий ситкома, над которым работал Дилан, наконец увидит свет.

Проект называется "Stuck" и там будет 5 серий по 15 минут. Съемки начнутся в этом месяце в Белфасте.

Дилан исполнит главную роль вместе с Морганой Робинсон. Это будет темный и немного сюрреалистичный ситком об отношениях их персонажей.', 1);
INSERT INTO public.posts VALUES (2, 'Udo Dirkschneider  NEW ALBUM!', 'Udo Dirkschneider - My Way (2022)

Жанр: #Heavy_Metal
Страна: Germany', 3);
INSERT INTO public.posts VALUES (3, 'Печенье с вареньем!', '400 г муки
200 г сливочного масла
2 яйца
4 ст. л. сахара
щепотка соли
1 ч. л. разрыхлителя
500 мл густого варенья (джема, повидла, желе) из смородины, брусники или клюквы', 5);
INSERT INTO public.posts VALUES (4, 'Звонок 2', 'Жанр: ужасы, детектив, триллер
Страна: США
Название: Звонок 2
Оригинальное название: The Ring Two
Слоган: «Страх замыкает свой круг»
Режиссер: Хидэо Наката
Актеры: Наоми Уоттс, Саймон Бейкер, Дэвид Дорфман, Элизабет Перкинс, Гэри Коул, Сисси Спейсек, Райан Мерриман, Эмили ВанКэмп, Келли Овертон, Джеймс Лежер
Премьера в мире: 17 марта 2005
Дата выхода в России: 7 апреля 2005, «UIP»
Продолжительность: 110 мин. / 01:50
Год: 2005', 4);
INSERT INTO public.posts VALUES (5, 'ЭМО - ДИСКОТЕКА х КОММУНА х 29.04', '🪒 Запоздалая, но обновлённая ЭМО - ДИСКОТЕКА снова в строю узико - выпрямленных эмобоев и эмогёрлоффф, в этот раз в стенах Соушл Клаб и Бара «Коммуна» ( Октябрьская ул., 16, корп. 22) 🔪^^
☠ Плакать и танцевать, пока девочки режут руки, начнём 29го апреля в 23.35, не забываем, наличие атрибутики приветствуется<3🖤
🩸Эпоху вернёт:
🖕🏽DJ стекло души aka мой милый оxymoron
vk.com/yaperya
💔DJ арафатка в тоналке
vk.com/hehxex
😭MC Сохранил (в себе лезвия)
@secretguest
✖✖✖✖✖
Взрыв эмоций начнётся в 23.35
☠Без лишних слов 10р (с репостом закрепыча), 15р без репоста.🧷', 2);


--
-- TOC entry 3334 (class 0 OID 16563)
-- Dependencies: 209
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'Julia', 24, 'woman', 'Belarussian');
INSERT INTO public.users VALUES (2, 'Alex', 22, 'man', 'American');
INSERT INTO public.users VALUES (3, 'Jack', 27, 'man', 'German');
INSERT INTO public.users VALUES (4, 'Sam', 28, 'woman', 'British');
INSERT INTO public.users VALUES (5, 'David', 30, 'man', 'Pole');


--
-- TOC entry 3181 (class 2606 OID 16583)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 16588)
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- TOC entry 3179 (class 2606 OID 16576)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 3176 (class 2606 OID 16567)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3182 (class 1259 OID 16624)
-- Name: fk_comments; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_comments ON public.comments USING btree (user_id);


--
-- TOC entry 3185 (class 1259 OID 16630)
-- Name: fk_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_like ON public.likes USING btree (user_id);


--
-- TOC entry 3183 (class 1259 OID 16612)
-- Name: fki_users - comments; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_users - comments" ON public.comments USING btree (user_id);


--
-- TOC entry 3177 (class 1259 OID 16594)
-- Name: fki_users - posts; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_users - posts" ON public.posts USING btree (user_id);


--
-- TOC entry 3186 (class 1259 OID 16618)
-- Name: likes f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "likes f" ON public.likes USING btree (id);


--
-- TOC entry 3184 (class 1259 OID 16642)
-- Name: posts - comments; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "posts - comments" ON public.comments USING btree (post_id);


--
-- TOC entry 3189 (class 1259 OID 16636)
-- Name: posts - likes; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "posts - likes" ON public.likes USING btree (post_id);


--
-- TOC entry 3192 (class 2606 OID 16637)
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) NOT VALID;


--
-- TOC entry 3191 (class 2606 OID 16619)
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3194 (class 2606 OID 16631)
-- Name: likes likes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) NOT VALID;


--
-- TOC entry 3193 (class 2606 OID 16625)
-- Name: likes likes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 3190 (class 2606 OID 16600)
-- Name: posts users - posts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "users - posts" FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2022-04-28 12:14:46

--
-- PostgreSQL database dump complete
--

