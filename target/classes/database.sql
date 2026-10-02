CREATE DATABASE IF NOT EXISTS littlestardb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE littlestardb;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(500) NOT NULL,
    password_salt VARCHAR(200) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS admins (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(80) NOT NULL UNIQUE,
    password_hash VARCHAR(500) NOT NULL,
    password_salt VARCHAR(200) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS foods (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    description VARCHAR(500),
    price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(1000),
    category VARCHAR(100),
    available BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NULL,
    customer_name VARCHAR(150) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address VARCHAR(500) NOT NULL,
    note VARCHAR(500),
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_orders_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    food_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_items_order FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

INSERT INTO admins(username,password_hash,password_salt)
SELECT 'admin','klnBJgVezD8KRcae4O4CdqQe9n1qdUdWOlIEK0L0pOE=','K99L8TPlZzxMdN63tBh9dw=='
WHERE NOT EXISTS (SELECT 1 FROM admins WHERE username='admin');

INSERT INTO categories(name) SELECT 'Main Course' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Main Course');
INSERT INTO categories(name) SELECT 'Drinks' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Drinks');
INSERT INTO categories(name) SELECT 'Dessert' WHERE NOT EXISTS (SELECT 1 FROM categories WHERE name='Dessert');

INSERT INTO foods(name,description,price,image_url,category,available)
SELECT 'Spicy Chicken Sandwich','Crispy fillet, spicy mayo and crunchy slaw.',8.99,
'https://images.unsplash.com/photo-1606755962773-d324e0a13086?auto=format&fit=crop&w=800&q=80','Main Course',1
WHERE NOT EXISTS (SELECT 1 FROM foods WHERE name='Spicy Chicken Sandwich');

INSERT INTO foods(name,description,price,image_url,category,available)
SELECT 'Crispy Fried Chicken','Golden fried chicken served with sauce.',9.50,
'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=800&q=80','Main Course',1
WHERE NOT EXISTS (SELECT 1 FROM foods WHERE name='Crispy Fried Chicken');

INSERT INTO foods(name,description,price,image_url,category,available)
SELECT 'Fresh Mango Lassi','Sweet mango blended with fresh yogurt.',4.50,
'https://images.unsplash.com/photo-1546173159-315724a31696?auto=format&fit=crop&w=800&q=80','Drinks',1
WHERE NOT EXISTS (SELECT 1 FROM foods WHERE name='Fresh Mango Lassi');

INSERT INTO foods(name,description,price,image_url,category,available)
SELECT 'Chocolate Cake','Soft chocolate cake with creamy frosting.',6.50,
'https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=800&q=80','Dessert',1
WHERE NOT EXISTS (SELECT 1 FROM foods WHERE name='Chocolate Cake');
