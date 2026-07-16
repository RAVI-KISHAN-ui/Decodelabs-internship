


-- QUERY 1: View Sample Data
SELECT *
FROM orders
LIMIT 10;


-- QUERY 2: Business KPIs
SELECT 
    COUNT(*) AS total_orders,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS avg_order_value
FROM orders;


-- QUERY 3: Revenue by Product
SELECT 
    Product,
    COUNT(*) AS order_count,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS avg_revenue
FROM orders
GROUP BY Product
ORDER BY total_revenue DESC;


-- QUERY 4: Cancelled Orders
SELECT 
    OrderID,
    CustomerID,
    Product,
    TotalPrice,
    Date
FROM orders
WHERE OrderStatus = 'Cancelled'
ORDER BY TotalPrice DESC;


-- QUERY 5: Order Status Breakdown
SELECT 
    OrderStatus,
    COUNT(*) AS order_count,
    ROUND(COUNT(*) * 100.0 / 1200, 1) AS percentage
FROM orders
GROUP BY OrderStatus
ORDER BY order_count DESC;


-- QUERY 6: High Value VIP Orders
SELECT 
    OrderID,
    CustomerID,
    Product,
    TotalPrice
FROM orders
WHERE TotalPrice > 3000
ORDER BY TotalPrice DESC;


-- QUERY 7: Revenue by Referral Source
SELECT 
    ReferralSource,
    COUNT(*) AS orders,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS avg_order_value
FROM orders
GROUP BY ReferralSource
ORDER BY total_revenue DESC;


-- QUERY 8: Monthly Revenue Trend
SELECT 
    EXTRACT(MONTH FROM Date::DATE) AS month_number,
    COUNT(*) AS orders,
    SUM(TotalPrice) AS revenue
FROM orders
GROUP BY month_number
ORDER BY month_number;


-- QUERY 9: Payment Method Analysis
SELECT 
    PaymentMethod,
    COUNT(*) AS orders,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS avg_order_value
FROM orders
GROUP BY PaymentMethod
ORDER BY total_revenue DESC;


-- QUERY 10: Coupon Code Performance (HAVING)
SELECT 
    CouponCode,
    COUNT(*) AS orders,
    SUM(TotalPrice) AS total_revenue,
    AVG(TotalPrice) AS avg_order_value
FROM orders
GROUP BY CouponCode
HAVING COUNT(*) > 290
ORDER BY total_revenue DESC;