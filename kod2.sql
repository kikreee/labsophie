-- Создание таблицы хабов (Hub)
CREATE TABLE hub_customer (
    hub_customer_id SERIAL PRIMARY KEY,
    customer_key VARCHAR(100) NOT NULL,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE hub_product (
    hub_product_id SERIAL PRIMARY KEY,
    product_key VARCHAR(100) NOT NULL,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Создание таблицы линков (Link)
CREATE TABLE link_order (
    link_order_id SERIAL PRIMARY KEY,
    order_key VARCHAR(100) NOT NULL,
    hub_customer_id INT REFERENCES hub_customer(hub_customer_id),
    hub_product_id INT REFERENCES hub_product(hub_product_id),
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Создание таблицы (Satellite)
CREATE TABLE satellite_customer (
    satellite_customer_id SERIAL PRIMARY KEY,
    hub_customer_id INT REFERENCES hub_customer(hub_customer_id),
    customer_name VARCHAR(255),
    customer_address VARCHAR(255),
    valid_from TIMESTAMP,
    valid_to TIMESTAMP,
    is_current BOOLEAN DEFAULT true,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE satellite_product (
    satellite_product_id SERIAL PRIMARY KEY,
    hub_product_id INT REFERENCES hub_product(hub_product_id),
    product_name VARCHAR(255),
    product_description TEXT,
    valid_from TIMESTAMP,
    valid_to TIMESTAMP,
    is_current BOOLEAN DEFAULT true,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE satellite_order (
    satellite_order_id SERIAL PRIMARY KEY,
    link_order_id INT REFERENCES link_order(link_order_id),
    order_date TIMESTAMP,
    order_status VARCHAR(50),
    valid_from TIMESTAMP,
    valid_to TIMESTAMP,
    is_current BOOLEAN DEFAULT true,
    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
