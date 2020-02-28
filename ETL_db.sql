--distributor Table
CREATE TABLE distributor (
   distributor_id VARCHAR NOT NULL,
   distributor_name VARCHAR,
   CONSTRAINT pk_distributor PRIMARY KEY (
       distributor_id
    )
);

--Dealer Table
CREATE TABLE dealer (
   dealer_id VARCHAR  NOT NULL,
   dealer_name VARCHAR,
   CONSTRAINT pk_dealer PRIMARY KEY (
       dealer_id
    )
);

-- Create Orders Table
CREATE TABLE orders (
    id VARCHAR NOT NULL,
	marketplace VARCHAR,
	order_id VARCHAR NOT NULL,
	sku VARCHAR UNIQUE,
    title VARCHAR,
    order_date DATE,
    payment_type VARCHAR,
    quantity INTEGER,
    order_amount INTEGER,
    item_cost INTEGER,
    shipping_amount INTEGER,
    shipping_tax INTEGER,
    total_order_tax INTEGER,
    order_tax INTEGER,
    distributor_id VARCHAR UNIQUE,
    dealer_id VARCHAR UNIQUE,
    CONSTRAINT pk_orders PRIMARY KEY (
        id
     )
);


-- Create products Table
CREATE TABLE products (
   sku VARCHAR  NOT NULL,
   name VARCHAR,
   selling_price INTEGER,
   item_cost INTEGER,
   brand VARCHAR,
   vendor_number VARCHAR,
   status VARCHAR,
   upc VARCHAR,
   product_name VARCHAR,
   product_description VARCHAR,
   product_features VARCHAR,
   primary_item_image VARCHAR,
   CONSTRAINT pk_products PRIMARY KEY (
       sku
    )
);


ALTER TABLE products ADD CONSTRAINT fk_products_sku FOREIGN KEY(sku)
REFERENCES orders (sku);
ALTER TABLE distributor ADD CONSTRAINT fk_distributor_distributor_id FOREIGN KEY(distributor_id)
REFERENCES orders (distributor_id);
ALTER TABLE dealer ADD CONSTRAINT fk_dealer_dealer_id FOREIGN KEY(dealer_id)
REFERENCES orders (dealer_id);

