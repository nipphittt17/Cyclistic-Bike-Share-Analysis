install.packages("tidyverse")
install.packages("readr")
install.packages("skimr")
install.packages("ggplot2")
library("tidyverse")
library("readr")
library("skimr")
library("ggplot2")
library("dplyr")
library("lubridate")
library("hms")

setwd("/Users/nipphittt/Documents/DA_Project/GoogleAnalytics/Project_Track1/")
bike_data <- read_csv("Divvy_Trips_2020_Q1.csv")

skim_without_charts(bike_data)

# Check duplicate
print(sum(duplicated(bike_data)))

# Check spelling
print(unique(bike_data$rideable_type))
print(unique(bike_data$start_station_name))
print(unique(bike_data$end_station_name))

check_null <- bike_data %>% filter(is.na(end_station_name))
# Filter the record with no ended station (id, name, and time) out
bike_data <- bike_data %>% 
  filter(!is.na(end_station_name))

# Create new column named ride_length (ended_at - started_at) for recording time ride.
bike_data <- bike_data %>% 
  mutate(ride_length = as_hms(difftime(ended_at, started_at)))

# Remove rows that ride_length are more than a day (24 hrs).
bike_data <- bike_data %>% 
  filter(!(difftime(ended_at, started_at) > 24*60*60))
filtered_check <- filter(bike_data, difftime(ended_at, started_at) > 24*60*60)

# Remove rows that end time are before start time.
bike_data <- bike_data %>% 
  filter(!(ended_at <= started_at))
filtered_check2 <- filter(bike_data, ended_at < started_at)

# Remove rows that ride_length are less than 1 minute
filtered_check3 <- filter(bike_data, difftime(ended_at, started_at) < 60)
bike_data <- bike_data %>% 
  filter(!(difftime(ended_at, started_at) < 60))


# Create new column named day_of_week (Sunday = 1, Monday = 2, ...)
bike_data <- bike_data %>% 
  mutate(day_of_week = wday(started_at))

# Create new column named month (January = 1, February = 2, ...)
bike_data <- bike_data %>% 
  mutate(month = month(started_at))

# Import the cleaned data as .csv file
write.csv(bike_data, file = "bike_data_cleaned.csv")


