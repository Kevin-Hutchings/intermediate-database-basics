CREATE TABLE users(
   users_id SERIAL PRIMARY KEY,
   users_name VARCHAR(100),
   email VARCHAR(100)
);

CREATE TABLE products(
   products_id SERIAL PRIMARY KEY,
   products_name VARCHAR(50),
   price DECIMAL
);

CREATE TABLE orders(
   orders_id SERIAL PRIMARY KEY,
   products_id INT REFERENCES products(product_id),
   user_id INT REFERENCES users(user_id)
);

INSERT INTO users
(users_name, email)
VALUES
('Jimmy', 'snowman@helthwyzer.com'),
('Glenn', 'crake@paradice.com'),
('Oryx', 'oryx@paradice.com')

INSERT INTO products
(products_name, price)
VALUES
('Beer', '5.50'),
('ChickieNobs', '12.50'),
('Pizza', '9.00')

INSERT INTO orders
(products_id, user_id)
VALUES
(1, 1), (2, 2), (3, 3)

INSERT INTO orders 
(products_id, user_id)
VALUES
(1, 1), (2, 1), (3, 1)

SELECT * FROM orders o
JOIN products p 
ON o.product_id = p.product_id
WHERE o.order_id = 1;

SELECT * FROM orders;

SELECT SUM(p.price) FROM producs.p 
JOIN orders o ON p.product_id = o.product_id
WHERE o.user_id = 1;

SELECT u.name, COUNT(DISTINCT o.order_id) FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY u.name;