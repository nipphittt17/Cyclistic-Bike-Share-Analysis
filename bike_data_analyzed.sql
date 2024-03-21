CREATE DATABASE IF NOT EXISTS bike_data;
USE bike_data;

-- Table data import wizard (bike_data_cleaned.csv) 

SELECT COUNT(*) FROM bike_data_2023_cleaned;

-- Count number of rides of members and casuals
SELECT 
	COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS members,
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casuals
FROM bike_data_2023_cleaned; 
    
    
-- Find average time of all rides
SELECT 
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(CAST(ride_length AS TIME)))), '%H:%i:%s') AS avg_time
FROM bike_data_2023_cleaned;


-- Find average & max time of rides compared between member and casual
SELECT 
	member_casual,
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(CAST(ride_length AS TIME)))), '%H:%i:%s') AS avg_time
FROM bike_data_2023_cleaned
GROUP BY member_casual;

SELECT 
	rideable_type,
	COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS members,
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casuals
FROM bike_data_2023_cleaned
GROUP BY rideable_type;
    

-- Find the couple of start-end station where 
SELECT
	start_station_name, end_station_name,
    TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(CAST(ride_length AS TIME)))), '%H:%i:%s') as avg_time
FROM bike_data_2023_cleaned
WHERE member_casual = 'member'
GROUP BY start_station_name, end_station_name
HAVING AVG(TIME_TO_SEC(CAST(ride_length AS TIME))) > (
	SELECT
		AVG(TIME_TO_SEC(CAST(ride_length AS TIME))) AS avg_time
	FROM bike_data_2023_cleaned
    WHERE member_casual = 'member'
)
ORDER BY AVG(TIME_TO_SEC(CAST(ride_length AS TIME)));


-- Find number of rides and average time rides of each weekday compared between member and casual
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

-- Order busy hours for each day_of_week
SELECT day_of_week, 
       HOUR(started_at) as time_ride,
       COUNT(*) as ride_count
FROM bike_data_2023_cleaned
-- WHERE day_of_week = 1
GROUP BY day_of_week, time_ride
ORDER BY day_of_week, ride_count DESC;


-- Find umber of rides and average time of each month compared between member and casual
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


-- Find the top 10 frequent routes of members

SELECT 
    start_station_name, 
    end_station_name, 
    COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_route
FROM bike_data_2023_cleaned 
GROUP BY start_station_name, end_station_name
ORDER BY member_route DESC
LIMIT 10;

SELECT 
    start_station_name, 
    end_station_name, 
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_route
FROM bike_data_2023_cleaned 
GROUP BY start_station_name, end_station_name
ORDER BY casual_route DESC
LIMIT 10;


-- Find the top 10 frequent routes of casuals + avg time rides
SELECT 
    bike.start_station_name, 
    bike.end_station_name, 
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_route,
    COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_route,
    avg_time.avg_time AS avg_time
FROM bike_data_cleaned AS bike
INNER JOIN (
	SELECT start_station_name, end_station_name,
	TIME_FORMAT(SEC_TO_TIME(AVG(TIME_TO_SEC(CAST(ride_length AS TIME)))), '%H:%i:%s') AS avg_time
	FROM  bike_data_cleaned
    WHERE member_casual = 'casual'
	GROUP BY start_station_name, end_station_name
) AS avg_time
ON bike.start_station_name = avg_time.start_station_name AND
bike.end_station_name = avg_time.end_station_name
GROUP BY start_station_name, end_station_name
ORDER BY casual_route DESC
LIMIT 10;


-- Find top10 round trip
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

-- Order busy hours for each month
SELECT month, 
       HOUR(started_at) as ride_hour,
       COUNT(*) as ride_count
FROM bike_data_cleaned
GROUP BY month, ride_hour
ORDER BY month, ride_count DESC;

