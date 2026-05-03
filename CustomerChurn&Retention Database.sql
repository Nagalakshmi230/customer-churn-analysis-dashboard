CREATE DATABASE CustomerChurnDB;
USE CustomerChurnDB;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    join_date DATE,
    last_active_date DATE,
    subscription_type VARCHAR(20),
    monthly_charges DECIMAL(10,2),
    tenure_months INT,
    churn_status VARCHAR(5)
);

INSERT INTO Customers VALUES
(1, 'Female', 25, '2023-01-10', '2023-10-05', 'Basic', 500, 9, 'No'),
(2, 'Male', 32, '2022-06-15', '2023-02-20', 'Premium', 1200, 8, 'Yes'),
(3, 'Female', 28, '2023-03-12', '2023-10-01', 'Standard', 800, 7, 'No'),
(4, 'Male', 45, '2021-11-20', '2022-12-01', 'Premium', 1500, 13, 'Yes'),
(5, 'Female', 30, '2022-09-05', '2023-10-10', 'Basic', 600, 13, 'No'),
(6, 'Male', 27, '2023-04-01', '2023-07-15', 'Standard', 750, 3, 'Yes'),
(7, 'Female', 35, '2022-02-18', '2023-10-12', 'Premium', 1300, 20, 'No'),
(8, 'Male', 29, '2023-05-10', '2023-09-01', 'Basic', 550, 4, 'Yes'),
(9, 'Female', 40, '2021-08-22', '2023-10-10', 'Standard', 900, 26, 'No'),
(10, 'Male', 31, '2022-12-01', '2023-06-20', 'Basic', 500, 6, 'Yes'),
(11, 'Female', 26, '2023-02-15', '2023-10-15', 'Standard', 700, 8, 'No'),
(12, 'Male', 38, '2022-04-10', '2023-03-01', 'Premium', 1400, 11, 'Yes'),
(13, 'Female', 33, '2021-10-05', '2023-10-01', 'Premium', 1250, 24, 'No'),
(14, 'Male', 22, '2023-06-01', '2023-08-01', 'Basic', 450, 2, 'Yes'),
(15, 'Female', 29, '2022-01-01', '2023-10-10', 'Standard', 850, 21, 'No');

--Total Customers
select count(*)as Num_of_customers from Customers;

--Churn Rate
Select count(case when churn_status='yes' then 1 end)*100.0/count(*) AS Churn_rate from Customers;

--Retention Rate
Select count(case when churn_status='No' then 1 end)*100.0/count(*) AS Retention_rate from Customers;

--Churn by Subscription Type
select subscription_type,count(*) as total_customers,sum(case when churn_status='yes' then 1 end)as churned_customers  from Customers
group by subscription_type;

--High-Risk Customers
select * from Customers where tenure_months<=3;

--Average Revenue per Customer
SELECT AVG(monthly_charges) AS avg_revenue FROM Customers;