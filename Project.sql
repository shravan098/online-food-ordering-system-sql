
-- CASE STUDY: ONLINE FOOD ORDERING SYSTEM

Create Database Online_Food_Ordering_System;
use online_food_ordering_system;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    RegistrationDate DATE
);

CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY,
    RestaurantName VARCHAR(100),
    Address VARCHAR(150),
    CuisineType VARCHAR(50)
);

CREATE TABLE MenuItems (
    MenuItemID INT PRIMARY KEY,
    RestaurantID INT,
    ItemName VARCHAR(100),
    Price DECIMAL(8,2),
    Description TEXT,
    IsVeg CHAR(1),  -- 'Y' or 'N', used for veg vs non-veg revenue comparison
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    MenuItemID INT,
    Quantity INT,
    ItemPrice DECIMAL(8,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY,
    RestaurantID INT,
    CustomerID INT,
    ReviewDate DATE,
    Rating DECIMAL(2,1),
    Comments TEXT,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);



-- Customers (15)
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, RegistrationDate) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@mail.com', '9876500001', '2023-01-12'),
(2, 'Diya', 'Patel', 'diya.patel@mail.com', '9876500002', '2023-02-05'),
(3, 'Vihaan', 'Reddy', 'vihaan.reddy@mail.com', '9876500003', '2023-02-20'),
(4, 'Ananya', 'Iyer', 'ananya.iyer@mail.com', '9876500004', '2023-03-01'),
(5, 'Kabir', 'Nair', 'kabir.nair@mail.com', '9876500005', '2023-03-18'),
(6, 'Ishaan', 'Verma', 'ishaan.verma@mail.com', '9876500006', '2023-04-02'),
(7, 'Myra', 'Gupta', 'myra.gupta@mail.com', '9876500007', '2023-04-25'),
(8, 'Advait', 'Joshi', 'advait.joshi@mail.com', '9876500008', '2023-05-10'),
(9, 'Saanvi', 'Kulkarni', 'saanvi.kulkarni@mail.com', '9876500009', '2023-05-30'),
(10, 'Reyansh', 'Rao', 'reyansh.rao@mail.com', '9876500010', '2023-06-15'),
(11, 'Aadhya', 'Menon', 'aadhya.menon@mail.com', '9876500011', '2023-07-01'),
(12, 'Vivaan', 'Chopra', 'vivaan.chopra@mail.com', '9876500012', '2023-07-22'),
(13, 'Kiara', 'Bose', 'kiara.bose@mail.com', '9876500013', '2023-08-09'),
(14, 'Arjun', 'Malhotra', 'arjun.malhotra@mail.com', '9876500014', '2023-09-14'),
(15, 'Navya', 'Pillai', 'navya.pillai@mail.com', '9876500015', '2023-10-03'),
(16, 'Rohan', 'Mehta', 'rohan.mehta@mail.com', '9876500016', '2023-10-15'),
(17, 'Sneha', 'Desai', 'sneha.desai@mail.com', '9876500017', '2023-10-20'),
(18, 'Yash', 'Singh', 'yash.singh@mail.com', '9876500018', '2023-11-02'),
(19, 'Riya', 'Kapoor', 'riya.kapoor@mail.com', '9876500019', '2023-11-15'),
(20, 'Kunal', 'Shah', 'kunal.shah@mail.com', '9876500020', '2023-12-01'),
(21, 'Aisha', 'Khan', 'aisha.khan@mail.com', '9876500021', '2023-12-10'),
(22, 'Dev', 'Mishra', 'dev.mishra@mail.com', '9876500022', '2023-12-15'),
(23, 'Tanvi', 'Jain', 'tanvi.jain@mail.com', '9876500023', '2024-01-05'),
(24, 'Aryan', 'Saxena', 'aryan.saxena@mail.com', '9876500024', '2024-01-12'),
(25, 'Meera', 'Bhat', 'meera.bhat@mail.com', '9876500025', '2024-01-20');
-- Restaurants (8)
INSERT INTO Restaurants (RestaurantID, RestaurantName, Address, CuisineType) VALUES
(1, 'Spice Route', 'MG Road, Bengaluru', 'Indian'),
(2, 'Pasta Fiesta', 'Bandra, Mumbai', 'Italian'),
(3, 'Dragon Wok', 'Salt Lake, Kolkata', 'Chinese'),
(4, 'Burger Barn', 'Connaught Place, Delhi', 'American'),
(5, 'Sushi Central', 'Koramangala, Bengaluru', 'Japanese'),
(6, 'Tandoori Nights', 'Andheri, Mumbai', 'Indian'),
(7, 'Taco Fiesta', 'HSR Layout, Bengaluru', 'Mexican'),
(8, 'Green Bowl', 'Powai, Mumbai', 'Healthy/Salads');

-- MenuItems (30)
INSERT INTO MenuItems (MenuItemID, RestaurantID, ItemName, Price, Description, IsVeg) VALUES
(1, 1, 'Paneer Butter Masala', 220.00, 'Rich tomato gravy with cottage cheese', 'Y'),
(2, 1, 'Chicken Biryani', 280.00, 'Fragrant basmati rice with spiced chicken', 'N'),
(3, 1, 'Dal Makhani', 180.00, 'Slow-cooked black lentils', 'Y'),
(4, 1, 'Butter Naan', 40.00, 'Soft leavened bread', 'Y'),
(5, 2, 'Margherita Pizza', 260.00, 'Classic cheese and tomato pizza', 'Y'),
(6, 2, 'Alfredo Pasta', 240.00, 'Creamy white sauce pasta', 'Y'),
(7, 2, 'Chicken Lasagna', 320.00, 'Layered pasta with chicken and cheese', 'N'),
(8, 2, 'Garlic Bread', 120.00, 'Toasted bread with garlic butter', 'Y'),
(9, 3, 'Veg Manchurian', 190.00, 'Fried vegetable balls in tangy sauce', 'Y'),
(10, 3, 'Chicken Fried Rice', 220.00, 'Wok-tossed rice with chicken', 'N'),
(11, 3, 'Spring Rolls', 150.00, 'Crispy vegetable rolls', 'Y'),
(12, 3, 'Kung Pao Chicken', 260.00, 'Spicy stir-fried chicken with peanuts', 'N'),
(13, 4, 'Classic Cheeseburger', 180.00, 'Beef-free patty with cheese', 'N'),
(14, 4, 'Veggie Burger', 150.00, 'Grilled vegetable patty burger', 'Y'),
(15, 4, 'French Fries', 90.00, 'Crispy salted fries', 'Y'),
(16, 4, 'Chicken Wings', 240.00, 'Spicy fried chicken wings', 'N'),
(17, 5, 'California Roll', 300.00, 'Crab, avocado, cucumber roll', 'N'),
(18, 5, 'Veg Tempura', 250.00, 'Battered fried vegetables', 'Y'),
(19, 5, 'Salmon Nigiri', 350.00, 'Fresh salmon over rice', 'N'),
(20, 5, 'Miso Soup', 100.00, 'Traditional fermented soybean soup', 'Y'),
(21, 6, 'Tandoori Chicken', 300.00, 'Char-grilled marinated chicken', 'N'),
(22, 6, 'Paneer Tikka', 230.00, 'Grilled marinated cottage cheese', 'Y'),
(23, 6, 'Seekh Kebab', 260.00, 'Grilled minced meat skewers', 'N'),
(24, 6, 'Jeera Rice', 130.00, 'Cumin flavored rice', 'Y'),
(25, 7, 'Chicken Tacos', 200.00, 'Soft shell tacos with spiced chicken', 'N'),
(26, 7, 'Veg Burrito', 210.00, 'Rice, beans and veggies wrapped', 'Y'),
(27, 7, 'Nachos Supreme', 180.00, 'Loaded nachos with cheese and salsa', 'Y'),
(28, 8, 'Quinoa Salad Bowl', 220.00, 'Quinoa, greens and roasted veggies', 'Y'),
(29, 8, 'Grilled Chicken Salad', 250.00, 'Greens with grilled chicken breast', 'N'),
(30, 8, 'Avocado Smoothie Bowl', 190.00, 'Blended avocado with toppings', 'Y');

-- Orders (40) — spread across dates, some old (>3 months), some recent, weekday/weekend mix
INSERT INTO Orders (OrderID, CustomerID, RestaurantID, OrderDate, TotalAmount) VALUES
(1, 1, 1, '2025-03-05', 500.00),
(2, 1, 1, '2025-04-10', 320.00),
(3, 1, 2, '2025-06-01', 480.00),
(4, 2, 3, '2025-03-15', 410.00),
(5, 2, 3, '2025-05-20', 260.00),
(6, 3, 4, '2025-02-01', 270.00),
(7, 3, 4, '2025-02-14', 180.00),
(8, 4, 5, '2025-06-10', 650.00),
(9, 4, 5, '2025-06-25', 350.00),
(10, 5, 6, '2025-01-20', 560.00),
(11, 6, 7, '2025-04-02', 380.00),
(12, 6, 7, '2025-05-15', 200.00),
(13, 7, 8, '2025-06-05', 440.00),
(14, 7, 1, '2025-06-12', 260.00),
(15, 8, 2, '2025-03-22', 360.00),
(16, 9, 3, '2025-01-10', 190.00),
(17, 10, 4, '2025-06-18', 330.00),
(18, 10, 4, '2025-06-19', 180.00),
(19, 11, 5, '2025-05-05', 300.00),
(20, 12, 6, '2025-06-01', 530.00),
(21, 13, 7, '2025-06-08', 200.00),
(22, 14, 8, '2025-06-14', 470.00),
(23, 15, 1, '2025-06-20', 540.00),
(24, 1, 3, '2025-06-22', 220.00),
(25, 2, 4, '2025-06-24', 150.00),
(26, 3, 5, '2025-06-25', 300.00),
(27, 4, 6, '2025-06-26', 300.00),
(28, 5, 7, '2025-06-27', 210.00),
(29, 6, 8, '2025-06-28', 220.00),
(30, 7, 1, '2025-06-29', 280.00),
(31, 8, 2, '2025-06-30', 260.00),
(32, 9, 3, '2025-07-01', 190.00),
(33, 10, 4, '2025-07-02', 150.00),
(34, 11, 5, '2025-07-03', 350.00),
(35, 12, 6, '2025-07-04', 300.00),
(36, 13, 7, '2025-07-05', 200.00),
(37, 1, 1, '2025-07-06', 280.00),
(38, 1, 1, '2025-07-08', 220.00),
(39, 1, 2, '2025-07-10', 240.00),
(40, 2, 1, '2025-07-11', 320.00);
INSERT INTO Orders (OrderID, CustomerID, RestaurantID, OrderDate, TotalAmount) VALUES
(41, 16, 2, '2025-01-05', 250.00),
(42, 16, 5, '2025-03-28', 420.00),

(43, 17, 1, '2025-02-11', 310.00),
(44, 17, 4, '2025-03-30', 275.00),

(45, 18, 6, '2025-01-18', 480.00),
(46, 18, 8, '2025-04-05', 360.00),

(47, 19, 3, '2025-02-20', 195.00),
(48, 19, 2, '2025-03-15', 450.00),

(49, 20, 5, '2025-01-25', 520.00),
(50, 20, 7, '2025-04-10', 180.00),

(51, 21, 4, '2025-02-07', 330.00),
(52, 21, 6, '2025-03-18', 290.00),

(53, 22, 8, '2025-01-30', 610.00),
(54, 22, 1, '2025-03-25', 210.00),

(55, 23, 3, '2025-02-14', 275.00),
(56, 23, 5, '2025-04-08', 390.00),

(57, 24, 2, '2025-01-12', 180.00),
(58, 24, 7, '2025-03-05', 340.00),

(59, 25, 4, '2025-02-26', 460.00),
(60, 25, 8, '2025-04-01', 295.00);
-- OrderDetails (linking orders to menu items, quantities roughly match TotalAmount)
INSERT INTO OrderDetails (OrderDetailID, OrderID, MenuItemID, Quantity, ItemPrice) VALUES
(1, 1, 1, 1, 220.00),(2, 1, 2, 1, 280.00),
(3, 2, 2, 1, 280.00),(4, 2, 4, 1, 40.00),
(5, 3, 5, 1, 260.00),(6, 3, 8, 1, 120.00),(7, 3, 8, 1, 120.00),
(8, 4, 9, 1, 190.00),(9, 4, 10, 1, 220.00),
(10, 5, 10, 1, 220.00),(11, 5, 11, 1, 150.00),
(12, 6, 13, 1, 180.00),(13, 6, 15, 1, 90.00),
(14, 7, 14, 1, 150.00),(15, 7, 15, 1, 90.00),
(16, 8, 17, 1, 300.00),(17, 8, 19, 1, 350.00),
(18, 9, 18, 1, 250.00),(19, 9, 20, 1, 100.00),
(20, 10, 21, 1, 300.00),(21, 10, 23, 1, 260.00),
(22, 11, 25, 1, 200.00),(23, 11, 26, 1, 210.00) ,
(24, 12, 25, 1, 200.00),
(25, 13, 28, 1, 220.00),(26, 13, 29, 1, 250.00) ,
(27, 14, 1, 1, 220.00),(28, 14, 4, 1, 40.00),
(29, 15, 6, 1, 240.00),(30, 15, 8, 1, 120.00),
(31, 16, 9, 1, 190.00),
(32, 17, 13, 1, 180.00),(33, 17, 15, 1, 90.00),(34, 17, 15, 1, 90.00),
(35, 18, 14, 1, 150.00),
(36, 19, 17, 1, 300.00),
(37, 20, 21, 1, 300.00),(38, 20, 24, 1, 130.00),(39, 20, 24, 1, 130.00),
(40, 21, 25, 1, 200.00),
(41, 22, 28, 1, 220.00),(42, 22, 29, 1, 250.00),
(43, 23, 2, 1, 280.00),(44, 23, 3, 1, 180.00),(45, 23, 4, 2, 40.00),
(46, 24, 9, 1, 190.00),(47, 24, 11, 1, 150.00),
(48, 25, 14, 1, 150.00),
(49, 26, 18, 1, 250.00),(50, 26, 20, 1, 100.00),
(51, 27, 22, 1, 230.00),
(52, 28, 25, 1, 200.00),
(53, 29, 28, 1, 220.00),
(54, 30, 1, 1, 220.00),(55, 30, 4, 1, 40.00),
(56, 31, 5, 1, 260.00),
(57, 32, 9, 1, 190.00),
(58, 33, 14, 1, 150.00),
(59, 34, 18, 1, 250.00),(60, 34, 20, 1, 100.00),
(61, 35, 22, 1, 230.00),
(62, 36, 25, 1, 200.00),
(63, 37, 2, 1, 280.00),
(64, 38, 1, 1, 220.00),
(65, 39, 5, 1, 240.00),
(66, 40, 2, 1, 280.00),(67, 40, 4, 1, 40.00);

-- Reviews (25) — deliberately includes some low ratings and repeat "unhappy" customers
INSERT INTO Reviews (ReviewID, RestaurantID, CustomerID, ReviewDate, Rating, Comments) VALUES
(1, 1, 1, '2025-03-06', 4.5, 'Great taste, fast delivery'),
(2, 1, 7, '2025-06-13', 2.0, 'Food arrived cold and late'),
(3, 1, 15, '2025-06-21', 4.0, 'Good flavors, generous portion'),
(4, 2, 1, '2025-06-02', 4.8, 'Best pasta in town'),
(5, 2, 8, '2025-03-23', 3.5, 'Decent but a bit pricey'),
(6, 3, 2, '2025-03-16', 2.5, 'Late delivery, food was okay'),
(7, 3, 9, '2025-01-11', 1.5, 'Cold food, very disappointed'),
(8, 3, 1, '2025-06-23', 2.0, 'Again late delivery, needs improvement'),
(9, 4, 3, '2025-02-02', 4.2, 'Quick service, tasty burger'),
(10, 4, 10, '2025-06-19', 3.8, 'Good value for money'),
(11, 5, 4, '2025-06-11', 5.0, 'Fresh sushi, amazing experience'),
(12, 5, 11, '2025-05-06', 4.6, 'Authentic Japanese flavors'),
(13, 6, 5, '2025-01-21', 4.9, 'Absolutely delicious tandoori'),
(14, 6, 12, '2025-06-02', 4.3, 'Great taste, on time delivery'),
(15, 7, 6, '2025-04-03', 2.2, 'Tacos were soggy, cold food'),
(16, 7, 13, '2025-06-09', 2.8, 'Average, nothing special'),
(17, 8, 7, '2025-06-06', 4.0, 'Healthy and fresh ingredients'),
(18, 8, 14, '2025-06-15', 4.4, 'Loved the salad bowl'),
(19, 1, 1, '2025-07-07', 2.1, 'Cold food again, disappointing'),
(20, 3, 9, '2025-06-24', 2.6, 'Late delivery once more'),
(21, 2, 15, '2025-04-01', 4.7, 'Consistently good quality'),
(22, 4, 2, '2025-06-25', 3.9, 'Solid burger, fries were cold though'),
(23, 5, 3, '2025-06-26', 4.9, 'Top notch sushi experience'),
(24, 6, 4, '2025-06-27', 4.5, 'Great flavors as always'),
(25, 7, 5, '2025-06-28', 2.3, 'Cold food, late delivery again');

-- ============================================================
-- SECTION 3: ANALYSIS QUERIES (mapped to case study problem statement)
-- ============================================================
select *from reviews;
select * from orders;
select * from customers;
select * from restaurants;
select * from orderdetails;
select * from Menuitems;

-- ---------- CUSTOMER BEHAVIOR & ENGAGEMENT ----------

-- 1.	Identify customers who have placed the highest number of orders. What does this indicate about their loyalty or engagement?
select c.customerid,concat(c.Firstname ," ", c.Lastname) as FullName,count(o.orderid) as No_of_orders 
from customers  c inner join orders o 
on c.customerid=o.customerid 
group by c.customerid
order by No_of_orders desc
limit 5;

-- 2. Customers who haven't ordered in the last 3 months (reference date: 2025-07-13)
SELECT c.CustomerID, c.FirstName, c.LastName, MAX(o.OrderDate) AS LastOrderDate
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING MAX(o.OrderDate) < DATE_SUB('2025-07-13', INTERVAL 3 MONTH);



-- 3. Average order value per customer
select c.customerid,c.firstname,c.email ,round(avg(o.TotalAmount),2) as Avg_amount 
from customers c left join orders o on c.customerid=o.customerid
group by c.customerid , c.FirstName,c.Email;
-- ---------- RESTAURANT PERFORMANCE ANALYSIS ----------

-- 1. Top 5 restaurants by average rating
select r.restaurantid,r.restaurantname,r.address,round(avg(re.rating),2) as Avg_rating 
from reviews re left join restaurants r on re.restaurantid=r.restaurantid
group by r.restaurantid;

-- 2. Restaurants with the lowest number of orders
select r.restaurantid,count(o.orderid) as No_of_orders,r.restaurantname from restaurants r left join orders o on r.restaurantid=o.restaurantid group by r.restaurantid order by count(o.orderid) asc limit 5;
-- 3. Orders / cuisine popularity
SELECT
    m.MenuItemID,
    m.ItemName,
    COUNT(o.OrderID) AS No_of_Orders,
    CASE
        WHEN COUNT(o.OrderID) < 5 THEN 'Low'
        WHEN COUNT(o.OrderID) BETWEEN 5 AND 8 THEN 'Moderate'
        ELSE 'Popular'
    END AS Cuisine_Popularity
FROM MenuItems m
LEFT JOIN OrderDetails o
ON m.MenuItemID = o.MenuItemID
GROUP BY
    m.MenuItemID,
    m.ItemName
ORDER BY No_of_Orders DESC;
-- ---------- REVENUE & BUSINESS METRICS ----------

-- 1. Total revenue in the last quarter (Apr-Jun 2025) vs previous quarter (Jan-Mar 2025)
with a as (SELECT SUM(TotalAmount) AS "Revenue Of 2 Quarter"
FROM Orders
WHERE YEAR(OrderDate) = 2025
AND QUARTER(OrderDate) = 2),
b as ( SELECT SUM(TotalAmount) AS "Revenue Of 1 Quarter"
FROM Orders
WHERE YEAR(OrderDate) = 2025
AND QUARTER(OrderDate) = 1)
select * from a cross join b ;

-- 2. Top 3 most ordered menu items
SELECT mi.ItemName, SUM(od.Quantity) AS TotalQuantitySold
FROM OrderDetails od
JOIN MenuItems mi ON od.MenuItemID = mi.MenuItemID
GROUP BY mi.ItemName
ORDER BY TotalQuantitySold DESC
LIMIT 3;

-- 3. Revenue contribution by restaurant
SELECT r.RestaurantName, SUM(o.TotalAmount) AS TotalRevenue
FROM Restaurants r
JOIN Orders o ON r.RestaurantID = o.RestaurantID
GROUP BY r.RestaurantName
ORDER BY TotalRevenue DESC;

-- ---------- OPERATIONAL EFFICIENCY ----------

-- 1. Average number of items per order
SELECT ROUND(AVG(ItemCount),2) AS AvgItemsPerOrder
FROM (
  SELECT OrderID, SUM(Quantity) AS ItemCount
  FROM OrderDetails
  GROUP BY OrderID
) sub;

-- 2. Orders below a threshold (e.g., ₹200)
SELECT OrderID, CustomerID, RestaurantID, TotalAmount
FROM Orders
WHERE TotalAmount < 200
ORDER BY TotalAmount ASC;

-- 3. Restaurants with many reviews but low average rating (< 3.0)
SELECT r.RestaurantName, COUNT(rv.ReviewID) AS ReviewCount, ROUND(AVG(rv.Rating),2) AS AvgRating
FROM Restaurants r
JOIN Reviews rv ON r.RestaurantID = rv.RestaurantID
GROUP BY r.RestaurantName
HAVING AVG(rv.Rating) < 3.0
ORDER BY ReviewCount DESC;

-- ---------- CUSTOMER SATISFACTION & FEEDBACK ----------

-- 1. Distribution of ratings, and count of 4+ star reviews
SELECT
  SUM(CASE WHEN Rating >= 4 THEN 1 ELSE 0 END) AS FourStarPlus,
  SUM(CASE WHEN Rating < 4 THEN 1 ELSE 0 END) AS BelowFourStar,
  COUNT(*) AS TotalReviews
FROM Reviews;

-- 2. Customers who frequently leave low ratings (avg < 3.0, 2+ reviews)
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(rv.ReviewID) AS ReviewCount, ROUND(AVG(rv.Rating),2) AS AvgRatingGiven
FROM Customers c
JOIN Reviews rv ON c.CustomerID = rv.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(rv.ReviewID) >= 2 AND AVG(rv.Rating) < 3.0;

-- 3. Recurring issues in review comments (simple keyword search)
SELECT RestaurantID, Comments
FROM Reviews
WHERE Comments LIKE '%cold%' OR Comments LIKE '%late%';

-- ---------- COMPARATIVE & PREDICTIVE ANALYSIS ----------

-- 1. Revenue: Veg vs Non-Veg items
SELECT mi.IsVeg, SUM(od.Quantity * od.ItemPrice) AS Revenue
FROM OrderDetails od
JOIN MenuItems mi ON od.MenuItemID = mi.MenuItemID
GROUP BY mi.IsVeg;

-- 2. Customers likely to become inactive (no order in 60+ days, only 1-2 lifetime orders)
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(o.OrderID) AS TotalOrders, MAX(o.OrderDate) AS LastOrder
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(o.OrderID) <= 2 AND MAX(o.OrderDate) < DATE_SUB('2025-07-13', INTERVAL 2 MONTH);

-- 3. Weekday vs weekend order trends
SELECT
  CASE WHEN DAYOFWEEK(OrderDate) IN (1,7) THEN 'Weekend' ELSE 'Weekday' END AS DayType,
  COUNT(*) AS TotalOrders,
  SUM(TotalAmount) AS Revenue
FROM Orders
GROUP BY DayType;
