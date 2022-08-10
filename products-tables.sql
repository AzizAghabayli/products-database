DROP TABLE IF EXISTS brand;
CREATE TABLE brand (
  brand_id INT PRIMARY KEY,
  brand_name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS product;
CREATE TABLE product (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  product_description TEXT,
  rating INT,
  note TEXT,
  brand_id INT,
  picture_id INT,
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  FOREIGN KEY (picture_id) REFERENCES picture(picture_id)
  );

DROP TABLE IF EXISTS options;
CREATE TABLE options (
  options_id INT PRIMARY KEY,
  options_description VARCHAR(255)
  );

DROP TABLE IF EXISTS product_options;
CREATE TABLE product_options (
  product_options_id INT PRIMARY KEY,
  product_id INT,
  options_id INT,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (options_id) REFERENCES options(options_id)
  );

DROP TABLE IF EXISTS picture;
CREATE TABLE picture (
  picture_id INT PRIMARY KEY,
  picture VARCHAR(1024),
  variant_id INT,
  product_id INT,
  FOREIGN KEY (variant_id) REFERENCES variant(variant_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
  );

DROP TABLE IF EXISTS variant;
CREATE TABLE variant (
  variant_id INT PRIMARY KEY,
  variant_description TEXT,
  sku INT NOT NULL,
  weight DECIMAL(5,2),
  weight_units VARCHAR(20),
  unit_price DECIMAL(10,2) NOT NULL,
  taxable BIT,
  dimensions_length DECIMAL(6,3),
  dimensions_length_units VARCHAR(20),
  dimensions_width DECIMAL(6,3),
  dimensions_width_units VARCHAR(20),
  dimensions_height DECIMAL(6,3),
  dimensions_height_units VARCHAR(20),
  units_in_stock INT,
  picture_id INT,
  product_id INT,
  FOREIGN KEY (picture_id) REFERENCES picture(picture_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

DROP TABLE IF EXISTS variant_attribute;
CREATE TABLE variant_attribute (
  variant_attribute_id INT PRIMARY KEY,
  name VARCHAR(25)
);

DROP TABLE IF EXISTS vartiant_attribute_value;
CREATE TABLE variant_attribute_value (
  variant_attribute_value_id INT PRIMARY KEY,
  variant_attribute_value VARCHAR(100),
  variant_id INT,
  variant_attribute_id INT,
  FOREIGN KEY (variant_id) REFERENCES variant(variant_id),
  FOREIGN KEY (variant_attribute_id) REFERENCES variant_attribute(variant_attribute_id)
);

DROP TABLE IF EXISTS discount;
CREATE TABLE discount (
discount_id INT PRIMARY KEY,
discount_description VARCHAR(255),
discount_type VARCHAR(100),
discount_amount INT,
coupon_code VARCHAR(100),
variant_id INT,
events_id INT,
FOREIGN KEY (variant_id) REFERENCES variant(variant_id)
);

DROP TABLE IF EXISTS category;
CREATE TABLE category (
category_id INT PRIMARY KEY,
category_name VARCHAR(255) NOT NULL,
picture_id INT,
FOREIGN KEY (picture_id) REFERENCES picture(picture_id)
);

DROP TABLE IF EXISTS sub_category;
CREATE TABLE sub_category (
sub_category_id INT PRIMARY KEY,
sub_category_name VARCHAR(255) NOT NULL,
category_id INT,
picture_id INT,
FOREIGN KEY (category_id) REFERENCES category(category_id),
FOREIGN KEY (picture_id) REFERENCES picture(picture_id)
);

DROP TABLE IF EXISTS product_category;
CREATE TABLE product_category (
  product_category_id INT PRIMARY KEY,
  product_id INT,
  category_id INT,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (category_id) REFERENCES category(category_id)
  );

DROP TABLE IF EXISTS review;
CREATE TABLE review (
    review_id INT PRIMARY KEY,
    review_text TEXT,
    review_date_time DATETIME,
    customer_ratings INT,
    customer_id INT,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

DROP TABLE IF EXISTS event_product;
CREATE TABLE event_product (
    event_product_id INT PRIMARY KEY,
    break_out_quantity VARCHAR(100),
    events_id INT NOT NULL,
    variant_id INT,
    FOREIGN KEY (variant_id) REFERENCES variant(variant_id)
);