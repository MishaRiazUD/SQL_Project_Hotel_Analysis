select * from hotel_reservation;

-- Question 1 : What is the total number of reservations in the dataset? 
SELECT COUNT(*) as No_of_Reservations
FROM hotel_reservation;

-- Question 2 : Which meal plan is the most popular among guests?  
SELECT type_of_meal_plan, count(*) AS plan_count
FROM hotel_reservation
GROUP BY type_of_meal_plan
ORDER BY plan_count DESC
LIMIT 1;

-- Question 3 : What is the average price per room for reservations involving children? 
SELECT ROUND(AVG(avg_price_per_room)) AS avg_price_per_room_with_children
FROM hotel_reservation
WHERE no_of_children > 0;

-- Question 4 : How many reservations were made for the year 20XX (replace XX with the desired year)? 
SELECT COUNT(*) AS total_reservations_2017
FROM hotel_reservation
WHERE arrival_date LIKE '%-2017';

-- Question 5 : What is the most commonly booked room type? 
SELECT room_type_reserved, count(*) AS commonly_booked_room_type
FROM hotel_reservation
GROUP BY room_type_reserved
ORDER BY commonly_booked_room_type DESC
LIMIT 1;

-- Question 6 : How many reservations fall on a weekend (no_of_weekend_nights > 0)?  
SELECT COUNT(*) AS reservation_on_weekend
FROM hotel_reservation
WHERE no_of_weekend_nights > 0;

-- Question 7 : What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time) AS lowest_lead_time
FROM hotel_reservation;

-- Question 8 : What is the most common market segment type for reservations?
SELECT market_segment_type, COUNT(*) AS segment_count
FROM hotel_reservation
GROUP BY market_segment_type
ORDER BY segment_count DESC
LIMIT 1;

-- Question 9 : How many reservations have a booking status of "Confirmed"?  
SELECT COUNT(*) AS total_booking_status_of_CONFIRMED
FROM hotel_reservation
WHERE booking_status = 'Not_Canceled';

-- Question 10 : What is the total number of adults and children across all reservations?  
SELECT SUM(no_of_adults) AS no_of_adults_across_reservation,
       SUM(no_of_children) AS no_of_children_across_reservation
FROM hotel_reservation;

-- Question 11 :  What is the average number of weekend nights for reservations involving children? 
SELECT ROUND(AVG(no_of_weekend_nights)) AS avg_weekend_nights_with_children
FROM hotel_reservation
WHERE no_of_children > 0;

-- Question 12 : How many reservations were made in each month of the year? 
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(arrival_date, '%d-%m-%Y')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(arrival_date, '%d-%m-%Y')) AS month,
    COUNT(*) AS reservations_count
FROM hotel_reservation
GROUP BY year, month
ORDER BY year, month;

-- Question 13 :  What is the average number of nights (both weekend and weekday) spent by guests for each room type?  
SELECT room_type_reserved, ROUND(AVG(no_of_weekend_nights + no_of_week_nights)) AS avg_nights
FROM hotel_reservation
GROUP BY room_type_reserved;

-- Question 14 : For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT 
    room_type_reserved,
    COUNT(*) AS reservations_count,
    ROUND(AVG(avg_price_per_room)) AS average_price
FROM hotel_reservation
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY reservations_count DESC
LIMIT 1;

-- Question 15 : Find the market segment type that generates the highest average price per room. 
SELECT market_segment_type, ROUND(AVG(avg_price_per_room)) AS avg_price
FROM hotel_reservation
GROUP BY market_segment_type
ORDER BY avg_price DESC
LIMIT 1;

--  ------THE END-------