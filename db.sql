CREATE DATABASE mobile_selling_website;

USE mobile_selling_website;

DROP TABLE IF EXISTS phone_brands;

CREATE TABLE phone_brands (
    brand_id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(50) NOT NULL UNIQUE
);

/* Data insertion for `phone_brands` */
INSERT INTO phone_brands
(brand_id, brand_name) VALUES
    (NULL, 'Apple'),
    (NULL, 'Google'),
    (NULL, 'Huawei'),
    (NULL, 'OnePlus'),
    (NULL, 'Oppo'),
    (NULL, 'Samsung'),
    (NULL, 'Sony'),
    (NULL, 'Xiaomi');

DROP TABLE IF EXISTS processor_brands;

CREATE TABLE processor_brands (
    brand_id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    brand_name VARCHAR(50) NOT NULL UNIQUE
);

/* Data insertion for `processor_brands` */
INSERT INTO processor_brands
(brand_id, brand_name) VALUES
    (NULL, 'Apple'),
    (NULL, 'Google'),
    (NULL, 'Mediatek'),
    (NULL, 'Qualcomm'),
    (NULL, 'Samsung');


DROP TABLE IF EXISTS processors;

CREATE TABLE processors (
    brand_id INT(4) NOT NULL,
    processor_id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    processor_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(300) NOT NULL,
    CONSTRAINT fk_processors_processorbrands FOREIGN KEY (brand_id) REFERENCES processor_brands(brand_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

/* Data insertion for `processors` */
INSERT INTO processors
(brand_id, processor_id, processor_name, description) VALUES
    (1, NULL, 'A10 Fusion', '16nm, Quad-core 2.34 GHz (2x Hurricane + 2x Zephyr)'),
    (1, NULL, 'A11 Bionic', '10nm, Hexa-core (2x Monsoon + 4x Mistral)'),
    (1, NULL, 'A12 Bionic', '7nm Hexa-core (2x2.5 GHz Vortex + 4x1.6 GHz Tempest)'),
    (1, NULL, 'A13 Bionic', '7nm+, Hexa-core (2x2.65 GHz Lightning + 4x1.8 GHz Thunder)'),
    (4, NULL, 'SM8250 Snapdragon 865 5G+', '7nm+ Octa-core (1x3.09 GHz Kryo 585 & 3x2.42 GHz Kryo 585 & 4x1.8 GHz Kryo 585)'),
    (5, NULL, 'Exynos 850', '8nm Octa-core (4x2.0 GHz Cortex-A55 & 4x2.0 GHz Cortex-A55)'),
    (5, NULL, 'Exynos 9825', '7nm Octa-core (2x2.73 GHz Mongoose M4 & 2x2.4 GHz Cortex-A75 & 4x1.9 GHz Cortex-A55)'),
    (5, NULL, 'Exynos 990', '7nm+ Octa-core (2x2.73 GHz Mongoose M5 & 2x2.50 GHz Cortex-A76 & 4x2.0 GHz Cortex-A55)');



DROP TABLE IF EXISTS products;

CREATE TABLE products (
    phone_brand_id INT(4) NOT NULL ,
    product_id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL ,
    price INT(4) NOT NULL ,
    processor_id INT(4) NOT NULL ,
    gpu VARCHAR(30) NOT NULL,
    ram VARCHAR(15) NOT NULL,
    storage VARCHAR(15) NOT NULL ,
    camera VARCHAR(500) NOT NULL ,
    display VARCHAR(100) NOT NULL ,
    battery VARCHAR(50) NOT NULL,
    os VARCHAR(50) NOT NULL ,
    description VARCHAR(2000) ,
    in_stock INT(4) NOT NULL ,
    image_dest VARCHAR(200),
    CONSTRAINT fk_products_processorid FOREIGN KEY (processor_id) REFERENCES processors(processor_id) ON DELETE RESTRICT ON UPDATE CASCADE ,
    CONSTRAINT fk_products_phonebrands FOREIGN KEY (phone_brand_id) REFERENCES phone_brands(brand_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

/* Data insertion for `products` */
INSERT INTO products
(phone_brand_id, product_id, product_name, price, processor_id, gpu, ram, storage, camera, display, battery, os, description, in_stock, image_dest) VALUES
    (1, NULL, 'iPhone 7 Plus', 4790000, 1, 'PowerVR Series7XT Plus', '3GB RAM', '128GB', 'Main: 12 MP, f/1.8, 28mm (wide), 1/3", PDAF, OIS; 12 MP, f/2.8, 56mm (telephoto), 1/3.6", AF, 2x optical zoom.\nSelfie: 7 MP, f/2.2, 32mm', '5.5 inches, Retina IPS LCD, 1080x1920 pixels', 'Li-Ion 2900mAh', 'iOS', NULL, 100, 'ip7p.png'),
    (1, NULL, 'iPhone 8 Plus', 6490000, 2, 'Apple GPU (3-core graphics)', '3GB RAM', '64GB', 'Main: 12 MP, f/1.8, 28mm (wide), PDAF, OIS; 12 MP, f/2.8, 57mm (telephoto), PDAF, 2x optical zoom.\nSelfie: 7 MP, f/2.2, 32mm', '5.5 inches, Retina IPS LCD, 1080x1920 pixels', 'Li-Ion 2691mAh', 'iOS', NULL, 100, 'ip8p.png'),
    (1, NULL, 'iPhone 11 Pro', 12990000, 4, 'Apple GPU (4-core graphics)', '4GB RAM', '256GB', 'Main: 12 MP, f/1.8, 26mm (wide), 1/2.55", 1.4µm, dual pixel PDAF, OIS; 12 MP, f/2.0, 52mm (telephoto), 1/3.4", 1.0µm, PDAF, OIS, 2x optical zoom; 12 MP, f/2.4, 120˚, 13mm (ultrawide), 1/3.6"\nSelfie: 12 MP, f/2.2, 23mm (wide), 1/3.6"; SL 3D', '5.8 inches, Super Retina XDR OLED, HDR10, Dolby Vision, 1125x2436 pixels', 'Li-Ion 3046mAh', 'iOS', NULL, 100, 'ip11pro.png'),
    (1, NULL, 'iPhone SE (2020)', 9490000, 4, 'Apple GPU (4-core graphics)', '3GB RAM', '64GB', 'Main: 12 MP, f/1.8 (wide), PDAF, OIS\nSelfie: 7 MP, f/2.2', '4.7 inches, Retina IPS LCD, 750x1334 pixels', 'Li-Ion 1821mAh', 'iOS', NULL, 100, 'ipse2020.png'),
    (1, NULL, 'iPhone XS', 7790000, 3, 'Apple GPU (4-core graphics)', '4GB RAM', '64GB', 'Main: 12 MP, f/1.8, 26mm (wide), 1/2.55", 1.4µm, dual pixel PDAF, OIS; 12 MP, f/2.4, 52mm (telephoto), 1/3.4", 1.0µm, PDAF, OIS, 2x optical zoom\nSelfie: 7 MP, f/2.2, 32mm; SL 3D', '5.8 inches, Super Retina OLED, HDR10, Dolby Vision, 1125x2436 pixels', 'Li-Ion 2658mAh', 'iOS', NULL, 100, 'ipxs.png'),
    (6, NULL, 'Galaxy A21s', 4390000, 6, 'Mali-G52', '3GB RAM', '32GB', 'Main: 48 MP, f/2.0, 26mm (wide), 1/2.0", 0.8µm, PDAF; 8 MP, f/2.2, 123˚ (ultrawide), 1/4.0", 1.12µm; 2 MP, f/2.4, (macro); 2 MP, f/2.4, (depth)\nSelfie: 13 MP, f/2.2', '6.5 inches, PLS LCD, 720x1600 pixels', 'Li-Ion 5000mAh', 'Android', NULL, 100, 'ssa21s.png'),
    (6, NULL, 'Galaxy Note 10 Plus 5G', 9990000, 7, 'Mali-G76 MP12', '12GB RAM', '256GB', 'Main: 12 MP, f/1.5-2.4, 27mm (wide), 1/2.55", 1.4µm, Dual Pixel PDAF, OIS; 12 MP, f/2.1, 52mm (telephoto), 1/3.6", 1.0µm, PDAF, OIS, 2x optical zoom; 16 MP, f/2.2, 12mm (ultrawide), 1/3.1", 1.0µm, Super Steady video; 0.3 MP, TOF 3D, (depth)\nSelfie: 10 MP, f/2.2', '6.8 inches, Dynamic AMOLED, HDR10+, 1440x3040 pixels', 'Li-Ion 4300mAh', 'Android', NULL, 100, 'ssnote10p.png'),
    (6, NULL, 'Galaxy Note 20 Ultra', 13890000, 8, 'Mali-G77 MP11', '8GB RAM', '256GB', 'Main: 108 MP, f/1.8, 26mm (wide), 1/1.33", 0.8µm, PDAF, Laser AF, OIS; 12 MP, f/3.0, 120mm (periscope telephoto), 1.0µm, PDAF, OIS, 5x optical zoom, 50x hybrid zoom; 12 MP, f/2.2, 120˚, 13mm (ultrawide)\nSelfie: 10 MP, f/2.2, 26mm (wide), 1/3.2", 1.22µm, Dual Pixel PDAF', '6.9 inches, Dynamic AMOLED 2X, 120Hz, HDR10+, 1440x3088 pixels', 'Li-Ion 4500mAh', 'Android', NULL, 100, 'ssnote20ultra.png'),
    (6, NULL, 'Galaxy Z Fold 2 5G', 23000000, 5, 'Adreno 650', '12GB RAM', '256GB', 'Main: 12 MP, f/1.8, 26mm (wide), 1/1.76", 1.8µm, Dual Pixel PDAF, OIS; 12 MP, f/2.4, 52mm (telephoto), 1/3.6", 1.0µm, PDAF, OIS, 2x optical zoom; 12 MP, f/2.2, 123˚, 12mm (ultrawide), 1.12µm\nSelfie: 10 MP, f/2.2, 26mm (wide), 1/3", 1.22µm; 10 MP, f/2.2, 26mm (wide), 1/3", 1.22µm', '7.6 inches, Foldable Dynamic AMOLED 2X, 120Hz, HDR10+, 1768 x 2208 pixels', 'Li-Ion 4500mAh', 'Android', NULL, 100, 'sszfold2.png');

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    order_id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    orderDate DATE NOT NULL,
    status VARCHAR(15) NOT NULL ,
    user_id INT(4)  NOT NULL ,
    notes VARCHAR(4000),
    CONSTRAINT fk_orders_users FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS order_products;

CREATE TABLE order_products (
    order_id INT(4) NOT NULL,
    product_id INT(4) NOT NULL,
    quantity INT(4) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order_products_orders FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_order_products_products FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `admin`;


CREATE TABLE `admin` (
    admin_id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    admin_name VARCHAR(255) NOT NULL,
    admin_password VARCHAR(255) NOT NULL
);

INSERT INTO `admin` (admin_id, admin_name, admin_password) VALUES 
    (NULL, 'admin', 'f925916e2754e5e03f75dd58a5733251');
    
DROP TABLE IF EXISTS users;


CREATE TABLE users (
    user_id INT(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    `address` VARCHAR(1000) NOT NULL,
    city VARCHAR(255) NOT NULL
);
