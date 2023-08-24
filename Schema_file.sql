CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  email VARCHAR(100),
  location VARCHAR(100)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  category VARCHAR(50),
  price DECIMAL(10, 2)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  quantity INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_id, customer_name, email, location)
VALUES
  (1, 'John Doe', 'johndoe@example.com', 'New York'),
  (2, 'Jane Smith', 'janesmith@example.com', 'Los Angeles'),
  (3, 'Mike Johnson', 'mikejohnson@example.com', 'Chicago'),
  (4, 'Emily Brown', 'emilybrown@example.com', 'Houston'),
  (5, 'David Wilson', 'davidwilson@example.com', 'Miami');

INSERT INTO products (product_id, product_name, category, price)
VALUES
  (1, 'iPhone 12', 'Electronics', 999.99),
  (2, 'Samsung Galaxy S21', 'Electronics', 899.99),
  (3, 'Nike Air Max', 'Fashion', 129.99),
  (4, 'Sony PlayStation 5', 'Gaming', 499.99),
  (5, 'MacBook Pro', 'Electronics', 1499.99);

INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date)
VALUES
  (1, 1, 1, 2, '2023-01-01'),
  (2, 2, 3, 1, '2023-01-02'),
  (3, 3, 2, 3, '2023-01-03'),
  (4, 4, 4, 1, '2023-01-04'),
  (5, 5, 1, 1, '2023-01-05'),
  (6, 1, 3, 2, '2023-01-06'),
  (7, 2, 2, 1, '2023-01-07'),
  (8, 3, 5, 1, '2023-01-08'),
  (9, 4, 4, 2, '2023-01-09'),
  (10, 5, 1, 3, '2023-01-10');
