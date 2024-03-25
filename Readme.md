# Cyclistic Bike Share Case Study

## Introduction
The Cyclistic Bike Share Case Study is a capstone project for the Google Data Analytics Professional Certificate offered by Coursera.

The primary objective of this project is to convert Cyclistic's casual riders into annual members. This will be achieved by uncovering valuable insights from data on how casual riders and annual members utilize Cyclistic bikes differently. The project utilized R programming for data exploration and cleaning, SQL for analysis, and Tableau for visualization. Below are the links to each component of the project for further exploration.

- [Data cleaning]()
- [Data analysis]()
- [Data visualization](https://public.tableau.com/views/bike_data_17111672299010/Dashboard1?:language=en-US&onFirstInteraction=function()%20%7B%0A%20%20%20%20%20%20%20%20workbook%20%3D%20viz.getWorkbook();%0A%20%20%20%20%20%20%20%20activeSheet%20%3D%20workbook.getActiveSheet();%0A%20%20%20%20%20%20%20%20console.log(%22My%20dashboard%20is%20interactive%22);%0A%20%20%20%20%7D&:embed=y&:display_count=n&:sid=&:origin=viz_share_link)


## Background
In 2016, Cyclistic launched a successful bike-share program in Chicago, which has grown to encompass 5,824 bicycles and 692 stations. The program allows users to unlock bikes from one station and return them to any other station in the system. Cyclistic's marketing strategy has supported flexible pricing plans, including single-ride passes, full-day passes, and annual memberships. Finance analysts have determined that annual members are more profitable than casual riders. Therefore, the company aims to convert casual riders into annual members. To achieve this goal, the team plans to analyze historical bike trip data to understand differences between casual riders and annual members and identify effective marketing strategies.

## Ask?
....
[Change word choices]
How do annual members and casual riders use Cyclistic bikes differently?
Why would casual riders buy Cyclistic annual memberships?
How can Cyclistic use digital media to influence casual riders to become members?


## Data preparation
The dataset can be found at [data source](https://divvy-tripdata.s3.amazonaws.com/index.html) [The data has been made available by Motivate International Inc. under [this license](https://divvybikes.com/data-license-agreement).] <br>
In this case study, I utilized a dataset spanning from January to June 2023, comprising six files in total. Below is a table detailing the 16 variables along with their descriptions.

| Variable | Description |
|----------|-------------|
| Variable 1 | Description of Variable 1 |
| Variable 2 | Description of Variable 2 |
| Variable 3 | Description of Variable 3 |
| Variable 4 | Description of Variable 4 |
| Variable 5 | Description of Variable 5 |
| Variable 6 | Description of Variable 6 |
| Variable 7 | Description of Variable 7 |
| Variable 8 | Description of Variable 8 |
| Variable 9 | Description of Variable 9 |
| Variable 10 | Description of Variable 10 |
| Variable 11 | Description of Variable 11 |
| Variable 12 | Description of Variable 12 |
| Variable 13 | Description of Variable 13 |
| Variable 14 | Description of Variable 14 |
| Variable 15 | Description of Variable 15 |
| Variable 16 | Description of Variable 16 |


## Data exploration
R programming was employed for this step. Initially, the datasets from January to June 2023 were merged, resulting in a total of 2,390,459 entries. Subsequently, the skim_without_charts function was utilized to generate a data summary, as depicted in the figure below.

![Data Summary](/images/data_summary.png)

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

