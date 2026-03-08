-- ═════════════════════════════════════════════════════════════
-- 💙 SQL Database in LUO OMNI
-- Full SQLite support in browser
-- ═════════════════════════════════════════════════════════════

-- ─── Create Tables ───
PRINT "Creating tables..."

-- Users table
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    age INTEGER,
    is_active INTEGER DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Posts table
CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    title TEXT NOT NULL,
    content TEXT,
    likes INTEGER DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Comments table
CREATE TABLE comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER,
    user_id INTEGER,
    comment TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Products table (for e-commerce)
CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    price REAL NOT NULL,
    stock INTEGER DEFAULT 0,
    category TEXT
);

-- Orders table
CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    product_id INTEGER,
    quantity INTEGER DEFAULT 1,
    total_price REAL,
    status TEXT DEFAULT 'pending',
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

PRINT "✓ All tables created"

-- ─── Insert Sample Data ───
PRINT "Inserting sample data..."

-- Users
INSERT INTO users (username, email, password, age) VALUES 
    ('johndoe', 'john@example.com', 'hashed_pass_1', 30),
    ('janesmith', 'jane@example.com', 'hashed_pass_2', 25),
    ('bobwilson', 'bob@example.com', 'hashed_pass_3', 35),
    ('alicejones', 'alice@example.com', 'hashed_pass_4', 28),
    ('charlieb', 'charlie@example.com', 'hashed_pass_5', 42);

-- Posts
INSERT INTO posts (user_id, title, content, likes) VALUES 
    (1, 'Hello World', 'My first post!', 10),
    (1, 'LUO is Amazing', 'Check out this awesome language', 25),
    (2, 'JavaScript Tips', 'Here are some cool JS tricks', 15),
    (3, 'Python vs JavaScript', 'Which is better?', 30),
    (4, 'SQL Fundamentals', 'Learn the basics of databases', 20);

-- Comments
INSERT INTO comments (post_id, user_id, comment) VALUES 
    (1, 2, 'Welcome!'),
    (1, 3, 'Great first post!'),
    (2, 3, 'LUO is indeed awesome!'),
    (2, 4, 'I agree completely'),
    (3, 1, 'Very helpful, thanks!'),
    (5, 2, 'Great tutorial');

-- Products
INSERT INTO products (name, description, price, stock, category) VALUES 
    ('Laptop', 'High-performance laptop', 999.99, 50, 'Electronics'),
    ('Mouse', 'Wireless mouse', 29.99, 200, 'Electronics'),
    ('Keyboard', 'Mechanical keyboard', 89.99, 100, 'Electronics'),
    ('Monitor', '27-inch 4K display', 399.99, 30, 'Electronics'),
    ('Desk Chair', 'Ergonomic office chair', 249.99, 25, 'Furniture'),
    ('Desk', 'Standing desk', 449.99, 15, 'Furniture'),
    ('Headphones', 'Noise-canceling', 199.99, 75, 'Audio'),
    ('Webcam', 'HD webcam', 79.99, 120, 'Electronics');

-- Orders
INSERT INTO orders (user_id, product_id, quantity, total_price, status) VALUES 
    (1, 1, 1, 999.99, 'delivered'),
    (1, 2, 2, 59.98, 'shipped'),
    (2, 3, 1, 89.99, 'delivered'),
    (3, 5, 1, 249.99, 'processing'),
    (4, 7, 1, 199.99, 'shipped'),
    (5, 4, 2, 799.98, 'pending');

PRINT "✓ Sample data inserted"

-- ─── Queries ───

-- All users
SELECT * FROM users;

-- Users with ages
SELECT username, email, age FROM users;

-- Posts with user info
SELECT 
    u.username,
    p.title,
    p.likes 
FROM posts p
JOIN users u ON p.user_id = u.id;

-- Products in Electronics category
SELECT name, price, stock FROM products WHERE category = 'Electronics';

-- Orders with details
SELECT 
    u.username,
    p.name as product,
    o.quantity,
    o.total_price,
    o.status
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN products p ON o.product_id = p.id;

-- Aggregation: Total sales by product
SELECT 
    p.name,
    SUM(o.quantity) as total_sold,
    SUM(o.total_price) as revenue
FROM orders o
JOIN products p ON o.product_id = p.id
GROUP BY p.name
ORDER BY revenue DESC;

-- Aggregation: Average order value
SELECT 
    AVG(total_price) as avg_order_value,
    SUM(total_price) as total_revenue,
    COUNT(*) as total_orders
FROM orders;

-- User order summary
SELECT 
    u.username,
    COUNT(o.id) as total_orders,
    SUM(o.total_price) as total_spent
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
GROUP BY u.username;

-- Top liked posts
SELECT 
    title,
    likes 
FROM posts 
ORDER BY likes DESC 
LIMIT 3;

-- Low stock products
SELECT 
    name,
    stock 
FROM products 
WHERE stock < 30
ORDER BY stock ASC;

-- Complex: Users who ordered electronics
SELECT DISTINCT
    u.username,
    u.email
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN products p ON o.product_id = p.id
WHERE p.category = 'Electronics';

PRINT "✓ All queries executed"
