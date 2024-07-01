use hotel_revenue;


-- joining the tables
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select * from total_hotel join `market _segment`
on total_hotel.market_segment=`market _segment`.market_segment join `meal_cost` on `meal_cost`.meal=total_hotel.meal;


-- Average daily rate
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select avg(adr) from total_hotel;


-- year wise revenue
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select arrival_date_year,sum((stays_in_weekend_nights+stays_in_week_nights)* adr)* sum(ï»¿Discount)
as revenue from total_hotel join `market _segment`
on total_hotel.market_segment=`market _segment`.market_segment group by arrival_date_year;


-- Cancellation rate
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
SELECT sum(is_canceled)/sum(stays_in_weekend_nights+stays_in_week_nights)* 100 AS Cancellation_Rate from total_hotel;


-- total revenue
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select sum((stays_in_weekend_nights+stays_in_week_nights)*adr)* sum(ï»¿Discount) as total_revenue 
from total_hotel join `market _segment`
on total_hotel.market_segment=`market _segment`.market_segment;


-- No. of hotels in different country
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select country, count(ï»¿hotel) as hotels from total_hotel group by country;


-- No. of nights stayed by customers
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select sum(stays_in_weekend_nights)+ sum(stays_in_week_nights) as total_nights from total_hotel;


-- discount offered
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select avg(ï»¿Discount)*100 as discount_in_percentage from total_hotel join `market _segment`
on total_hotel.market_segment=`market _segment`.market_segment;


-- How many days prior bookings are made
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select avg(lead_time) as prior_booking_days from total_hotel;


-- Number of Total people visiting each year by month and year.
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select arrival_date_month, arrival_date_year, sum(adults)+ sum(children)+ sum(babies) as total_people 
from total_hotel group by arrival_date_month, arrival_date_year ;


-- car parking spaces
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select arrival_date_year, sum(required_car_parking_spaces) as required_car_parking_spaces, sum(required_car_parking_spaces)/(sum(stays_in_weekend_nights)+ sum(stays_in_week_nights))*100
as car_parking_space_percent from total_hotel group by arrival_date_year;


-- Relationship between ADR and the lead time before booking.
with total_hotel as (select * from `2018` union
select * from `2019`union
select * from `2020`)
select lead_time, AVG(adr) as avg_adr from total_hotel group by lead_time order by lead_time;
