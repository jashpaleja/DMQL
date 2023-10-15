CREATE TABLE IF NOT EXISTS public.aisles
(
    aisle_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    aisle text COLLATE pg_catalog."default",
    CONSTRAINT aisles_pkey PRIMARY KEY (aisle_id)
)

CREATE TABLE IF NOT EXISTS public.departments
(
    department_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    department text COLLATE pg_catalog."default",
    CONSTRAINT departments_pkey PRIMARY KEY (department_id)
)

CREATE TABLE IF NOT EXISTS public.stores
(
    store_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    store_zone integer,
    CONSTRAINT stores_pkey PRIMARY KEY (store_id)
)

CREATE TABLE IF NOT EXISTS public.users
(
    user_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_zone integer NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (user_id)
)

CREATE TABLE IF NOT EXISTS public.products
(
    product_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    product_name text COLLATE pg_catalog."default",
    aisle_id integer,
    department_id integer,
    CONSTRAINT products_pkey PRIMARY KEY (product_id),
    CONSTRAINT products_aisle_id_fkey FOREIGN KEY (aisle_id)
        REFERENCES public.aisles (aisle_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT products_department_id_fkey FOREIGN KEY (department_id)
        REFERENCES public.departments (department_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

CREATE TABLE IF NOT EXISTS public.orders
(
    order_id integer NOT NULL,
    user_id integer,
    order_number integer,
    order_dow integer,
    order_hour_of_day integer,
    days_since_prior_order integer,
    store_id integer,
    CONSTRAINT orders_pkey PRIMARY KEY (order_id),
    CONSTRAINT orders_store_id_fkey FOREIGN KEY (store_id)
        REFERENCES public.stores (store_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

CREATE TABLE IF NOT EXISTS public.order_products
(
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    add_to_cart_order integer,
    reordered integer,
    CONSTRAINT order_products_pkey PRIMARY KEY (order_id, product_id),
    CONSTRAINT order_products_order_id_fkey FOREIGN KEY (order_id)
        REFERENCES public.orders (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT order_products_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)