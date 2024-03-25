# Cyclistic Bike Share Case Study

## Introduction
The Cyclistic Bike Share Case Study is a capstone project for the Google Data Analytics Professional Certificate offered by Coursera.

The main goal of this project is to convert the Cyclistic's casual riders into annual members. This will be done by find valuable insights from data on how casual riders and annual members use Cyclistic bike differently. 

I use R for data exploration and data cleaning, SQL for analyzing, and tableau for visualiztion. The links of each .... can be found below.


## Background
In 2016, Cyclistic launched a successful bike-share program in Chicago, which has grown to encompass 5,824 bicycles and 692 stations. The program allows users to unlock bikes from one station and return them to any other station in the system. Cyclistic's marketing strategy has supported flexible pricing plans, including single-ride passes, full-day passes, and annual memberships. Finance analysts have determined that annual members are more profitable than casual riders. Therefore, the company aims to convert casual riders into annual members. To achieve this goal, the team plans to analyze historical bike trip data to understand differences between casual riders and annual members and identify effective marketing strategies.

## Ask?
....
[Change word choices]
How do annual members and casual riders use Cyclistic bikes differently?
Why would casual riders buy Cyclistic annual memberships?
How can Cyclistic use digital media to influence casual riders to become members?


## Data preparation
The dataset can be found at https://divvy-tripdata.s3.amazonaws.com/index.html
[Note that the data has been made available by Motivate International Inc. under this license.]
In this case study, I used the dataset from January to June 2023 (6 files in total)

The following table shows the 16 variables and their descriptions

[table]

## Data exploration
R programming was used for this step. I firstly combined the dataset of January to June 2023, resulting in 2,390,459 entries.
then use skim_without_charts function to see the data summary.

[picture]

Referred to the figures, there are null values .. start_staion_id, start_staion_name, end_station_id, end_station_name, end_lat, and end_lang

- check duplications
- check spelling for string datatype columns: rideable_type, start_station_name, and end_station_name

## Data cleaning

After exploration, the dataset was cleaned by:

- Removing the entries with null values in start_staion_id, start_staion_name, end_station_id, end_station_name.
- Adding 3 columns: ride_length,day_of_week, and month.
- Exclusing the rides with duration less than a minute or longer than a day and the rides that end time comes before start time.
After cleaning, 613,050 entries were removed, resulting in 1,777,409 entries in total.

The cleaned data was save as .csv file, readily for analyzing.


## Data analysis

