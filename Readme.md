# Cyclistic Bike Share Case Study

## Introduction
The Cyclistic Bike Share Case Study is a capstone project for the Google Data Analytics Professional Certificate offered by Coursera.


## Background
In 2016, Cyclistic launched a successful bike-share program in Chicago, which has grown to encompass 5,824 bicycles and 692 stations. The program allows users to unlock bikes from one station and return them to any other station in the system. Cyclistic's marketing strategy has supported flexible pricing plans, including single-ride passes, full-day passes, and annual memberships. Finance analysts have determined that annual members are more profitable than casual riders. Therefore, the company aims to convert casual riders into annual members. To achieve this goal, the team plans to analyze historical bike trip data to understand differences between casual riders and annual members and identify effective marketing strategies.

## Business tasks
The following are key questions that will guide the future marketing program.
1. How do annual members and casual riders use Cyclistic bikes di erently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to in uence casual riders to become members?


## Data preparation
The dataset can be found at [data source](https://divvy-tripdata.s3.amazonaws.com/index.html) [It has been made by Motivate International Inc. under [this license](https://divvybikes.com/data-license-agreement).] <br>
In this case study, I utilized a dataset spanning from January to June 2023, comprising six files in total. Below is a table detailing the 13 variables along with their descriptions.

| Variable          | Description                                                                                                     |
|-------------------|-----------------------------------------------------------------------------------------------------------------|
| ride_id           | The unique id of each ride                                                                                     |
| rideable_type     | Type of bicycles, including classic, electric, and docked bikes                                                |
| started_at        | The start time of the trip                                                                                     |
| ended_at          | The end time of the trip                                                                                       |
| start_station_name| The name of the station where the ride started                                                                 |
| start_station_id  | The unique identifier for the station where the ride started                                                    |
| end_station_name  | The name of the station where the ride ended                                                                   |
| end_station_id    | The unique identifier for the station where the ride ended                                                      |
| start_lat         | The latitude coordinate of the starting station                                                               |
| start_lng         | The longitude coordinate of the starting station                                                              |
| end_lat           | The latitude coordinate of the ending station                                                                 |
| end_lng           | The longitude coordinate of the ending station                                                                |
| member_casual     | Indicates whether the rider is a member or a casual rider                                                       |


## Data exploration
R programming was employed for this step. Initially, the datasets from January to June 2023 were merged, resulting in a total of 2,390,459 entries. Subsequently, the skim_without_charts function was utilized to generate a data summary, as depicted in the figure below.

![Data Summary](/images/skim_without_charts.png)

Referring to the figure, it's evident that there are null values present in the following variables: start_station_id, start_station_name, end_station_id, end_station_name, end_lat, and end_lng.
Following this observation, I conducted checks for duplications and spelling errors within string datatype columns, including rideable_type, start_station_name, and end_station_name. No errors were detected.

## Data cleaning

Following exploration, the dataset was cleaned by:

- Entries with null values in start_station_id, start_station_name, end_station_id, and end_station_name were removed.
- Three new columns were added: ride_length (ride duration computed by ended_at - started_at), day_of_week (Sunday - Saturday), and month.
- Rides where the end time preceded the start time were excluded.
- Rides with durations longer than a day or less than a minute were excluded.

After cleaning, 613,050 entries were removed, resulting in a total of 1,777,409 entries in the dataset.
The cleaned data was saved as a .csv file, making it readily available for analysis.

## Data analysis

