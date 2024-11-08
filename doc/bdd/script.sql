create table users(
    user_UUID UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    user_pseudo varchar(50) NOT NULL,
    username VARCHAR(100) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


create table product(
    product_UUID UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    product_name varchar(100) NOT NULL,
    product_description TEXT,
    product_price	DECIMAL(10, 2)	NOT NULL CHECK (product_price >= 0),
    product_quantity	INTEGER	NOT NULL, CHECK (product_quantity >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP
);

create table orders(
    order_number	SERIAL	PRIMARY KEY,
    order_total_cost_ht	DECIMAL(10, 2)	CHECK (order_total_cost_ht >= 0),
    order_total_quantity	INTEGER	NOT NULL, CHECK (order_total_quantity >= 0),
    created_at	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP,
    deliver_at	TIMESTAMP
);

INSERT INTO users (user_pseudo, username, user_password)
VALUES
    ('SuperCoder', 'coder_supreme@example.com', 'password1234'),
    ('CaptainBugFix', 'fixer_of_bugs@example.com', 'buglife!'),
    ('Error404', 'notfound@example.com', 'pageNotFound!'),
    ('MrNullPointer', 'npe_master@example.com', 'segfaultking'),
    ('SQL_Inject0r', 'h4x0r@example.com', 'DROPitLikeItsHot');
-- Ajout des donnée dans la table product
INSERT INTO product (product_name, product_description, product_price, product_quantity)
VALUES
    ('Keyboard Cleaner', 'Cleans all the crumbs of your coding snacks.', 19.99, 50),
    ('Debugging Mug', 'A mug with "It works on my machine" written on it.', 12.99, 100),
    ('Rubber Duck', 'The best debugging companion.', 5.49, 200),
    ('Hoodie "Code Life"', 'Stay warm while coding late at night.', 39.99, 25),
    ('Infinite Coffee Subscription', 'For those all-nighters. Monthly supply of coffee beans.', 59.99, 10);
-- Ajout des données dans la table orders
INSERT INTO orders (order_total_cost_ht, order_total_quantity, deliver_at)
VALUES
    (39.98, 2, '2024-11-15 10:00:00'),
    (12.99, 1, '2024-11-16 14:30:00'),
    (59.99, 1, '2024-11-17 09:00:00'),
    (19.99, 1, '2024-11-18 12:00:00'),
    (104.95, 5, '2024-11-19 18:45:00');
