-- You are given the following table **ProductDetail**:

-- | OrderID | CustomerName  | Products                        |
-- |---------|---------------|---------------------------------|
-- | 101     | John Doe      | Laptop, Mouse                   |
-- | 102     | Jane Smith    | Tablet, Keyboard, Mouse         |
-- | 103     | Emily Clark   | Phone                           |


-- - In the table above, the **Products column** contains multiple values, which violates **1NF**.
-- - **Write an SQL query** to transform this table into **1NF**, ensuring that each row represents a single product for an order


CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);
INSERT INTO ProductDetail (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- You are given the following table **OrderDetails**, which is already in **1NF** but still contains partial dependencies:

-- | OrderID | CustomerName  | Product      | Quantity |
-- |---------|---------------|--------------|----------|
-- | 101     | John Doe      | Laptop       | 2        |
-- | 101     | John Doe      | Mouse        | 1        |
-- | 102     | Jane Smith    | Tablet       | 3        |
-- | 102     | Jane Smith    | Keyboard     | 1        |
-- | 102     | Jane Smith    | Mouse        | 2        |
-- | 103     | Emily Clark   | Phone        | 1        |

-- - In the table above, the **CustomerName** column depends on **OrderID** (a partial dependency), which violates **2NF**. 

-- - Write an SQL query to transform this table into **2NF** by removing partial dependencies. Ensure that each non-key column fully depends on the entire primary key.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);
CREATE TABLE OrderProducts (
    OrderID int,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

INSERT into OrderProducts (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);