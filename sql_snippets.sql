-- show all customer data
SELECT * FROM sales.customer;

-- get the count of customer
SELECT COUNT(*) FROM sales.customer;

-- get the count of records and sales from each market

select market_code,count(*) as records_count,sum(sales_amount) as total_sales
from sales.transaction
group by market_code;

-- get the count of records where sales <=0....because sales cant be -ve so we should treat these records if any

select count(*) from sales.transaction
where sales_amount<=0;

-- lets find the count of records in INR and USD,as USD = 82.75*INR this has to treated
select currency,count(*) from sales.transaction
group by currency;

-- lets find from which date to till which date we have transactions 
select min(order_date),max(order_date) from sales.transaction;

--get the yearly sales
//use sales table//

select date.year,count(*),sum(sales_amount)
from sales.transaction transaction
inner join date date on 
transaction.order_date=date.date
group by year;

-- get the yearly sales from each market
//use sales//

select year,market_name,count(*),sum(sales_amount)
from sales.transaction transaction
inner join date date on 
transaction.order_date=date.date
inner join market market on
 market.market_code = transaction.market_code
group by year,market_name;