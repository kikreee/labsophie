CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

-- Создание таблицы Employees
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(50)
);

-- Создание таблицы Services
CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2)
);

-- Создание таблицы Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    service_id INT,
    order_date DATE,
    completion_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);
