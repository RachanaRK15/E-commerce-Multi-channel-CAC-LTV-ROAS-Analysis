CREATE DATABASE IF NOT EXISTS analytics_project;
use analytics_project;
create table customers
( customer_id varchar(20) primary key,
signup_date date,
acquisition_channel varchar(50),
city varchar(50)
);
create table transactions
( transaction_id varchar(20) primary key,
customer_id varchar(20),
order_date date,
order_amount decimal(10,2),
product_category varchar(50)
);
create table marketing_spend
(
month varchar(10),
channl varchar(50),
total_spend decimal(10,2)
);
 
#LTV
with customer_spend as (
select c.CustomerID,c.AcquisitionChannel as Channel,
count(t.TransactionID) as TotalOrders,
sum(t.OrderAmount) as TotalLifetimeSpend
from customers c
join transactions t on
c.CustomerID=t.CustomerID
group by c.CustomerID,c.AcquisitionChannel
)
select channel,count(CustomerID) as TotalCustomers,
round (avg(TotalLifetimeSpend),2) as AverageLTV
from customer_spend
group by channel;

#CAC 

WITH cust_by_channel AS (
    SELECT
        AcquisitionChannel AS channel,
        COUNT(DISTINCT CustomerId) AS TotalCustomersAcquired
    FROM customers
    GROUP BY AcquisitionChannel
),
spend_by_channel AS (
    SELECT
        Channel AS channel,
        SUM(TotalSpend) AS ChannelSpend
    FROM marketing_spend
    GROUP BY Channel
)
SELECT
    c.channel,
    c.TotalCustomersAcquired,
    ROUND(COALESCE(s.ChannelSpend, 0), 0) AS TotalMarketingSpend,
    ROUND(COALESCE(s.ChannelSpend, 0) / NULLIF(c.TotalCustomersAcquired, 0), 2) AS CAC
FROM cust_by_channel c, spend_by_channel s
WHERE c.channel = s.channel
ORDER BY c.channel;

#ROAS

with channel_revenue as(
select c.AcquisitionChannel as channel,
round(sum(t.OrderAmount),2) as TotalRevenue
from customers c
join transactions t on c.CustomerID=t.CustomerID
group by c.AcquisitionChannel
),
channel_spend as(
select channel, round(sum(TotalSpend),2) as TotalAdSpend
from marketing_spend
group by channel
)
select
r.channel,
s.TotalAdSpend,
r.TotalRevenue,
round(r.TotalRevenue / s.TotalAdSpend,2) as ROAS
from channel_revenue r 
join channel_spend s on r.Channel=s.Channel;
