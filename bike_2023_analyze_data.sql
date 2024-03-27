CREATE DATABASE IF NOT EXISTS bike_data;
USE bike_data;

-- Table data import wizard (bike_data_2023_cleaned.csv) 

SELECT DISTINCT(ride_id) FROM bike_data_2023_cleaned;

-- The number of casual riders vs annual members.
SELECT member_casual, COUNT(*) as num_of_rides
FROM bike_data_2023_cleaned
GROUP BY member_casual;
    
    
-- Average duration of all trips for casual riders and annual members.
SELECT 
	member_casual,
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(CAST(ride_length AS TIME)))), '%H:%i:%s') AS avg_time
FROM bike_data_2023_cleaned
GROUP BY member_casual;


-- The number of casual riders and annual members for each type of bike.
SELECT 
	rideable_type,
	COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS members,
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casuals
FROM bike_data_2023_cleaned
GROUP BY rideable_type;
    
    
-- The number of casual riders and annual members per day of the week, alongside the average trip duration.
SELECT member_t.day_of_week, COUNT(ride_id) AS member_rides,
	TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(CAST(ride_length AS TIME)))), '%H:%i:%s') AS member_avg_time,
    casual_t.num_of_ride AS casual_rides, casual_t.avg_time AS casual_avg_time
FROM bike_data_2023_cleaned AS member_t INNER JOIN (
	SELECT day_of_week, COUNT(ride_id) AS num_of_ride,
	TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(CAST(ride_length AS TIME)))), '%H:%i:%s') AS avg_time
	FROM bike_data_2023_cleaned
	WHERE member_casual = 'casual'
	GROUP BY day_of_week
) AS casual_t
ON member_t.day_of_week = casual_t.day_of_week
WHERE member_casual = 'member'
GROUP BY day_of_week
ORDER BY day_of_week;


-- The distribution of casual riders and annual members across each hour of the day.
SELECT HOUR(started_at) as time_ride,
       COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS members,
	   COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casuals
FROM bike_data_2023_cleaned
-- WHERE day_of_week = 1
GROUP BY time_ride
ORDER BY time_ride;


-- The number of casual riders and annual members in each month, along with the average trip duration.
SELECT out_t.month, COUNT(ride_id) AS member_ride,
	TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(CAST(ride_length AS TIME)))), '%H:%i:%s') AS member_avg_time,
    in_t.num_of_ride AS casual_ride , in_t.avg_time AS casual_avg_time
FROM bike_data_2023_cleaned AS out_t INNER JOIN (
	SELECT month, COUNT(ride_id) AS num_of_ride,
	TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(CAST(ride_length AS TIME)))), '%H:%i:%s') AS avg_time
	FROM bike_data_2023_cleaned
	WHERE member_casual = 'casual'
	GROUP BY month
) AS in_t
ON out_t.month = in_t.month
WHERE member_casual = 'member'
GROUP BY month
ORDER BY month;


-- The top 10 popular routes for annual members, including the total number of rides.
SELECT 
    start_station_name, 
    end_station_name, 
    COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_route
FROM bike_data_2023_cleaned 
GROUP BY start_station_name, end_station_name
ORDER BY member_route DESC
LIMIT 10;


-- The top 10 popular routes for casual riders, including the total number of rides.
SELECT 
    start_station_name, 
    end_station_name, 
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_route
FROM bike_data_2023_cleaned 
GROUP BY start_station_name, end_station_name
ORDER BY casual_route DESC
LIMIT 10;


-- The top 10 round trip routes, including the number of rides by both members and casual riders.
SELECT start_station_name,
	(COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) + 
    COUNT(CASE WHEN member_casual = 'member' THEN 1 END)) AS total_ride,
	COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_route,
    COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_route
FROM bike_data_2023_cleaned 
WHERE start_station_name = end_station_name
GROUP BY start_station_name
ORDER BY total_ride DESC
LIMIT 10;
