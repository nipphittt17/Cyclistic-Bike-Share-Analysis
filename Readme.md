# Cyclistic Bike Share Case Study

## Introduction
The Cyclistic Bike Share Case Study is a capstone project for the Google Data Analytics Professional Certificate offered by Coursera.


## Background
In 2016, Cyclistic launched a successful bike-share program in Chicago, which has grown to encompass 5,824 bicycles and 692 stations. The program allows users to unlock bikes from one station and return them to any other station in the system. Cyclistic's marketing strategy has supported flexible pricing plans, including single-ride passes, full-day passes, and annual memberships. Finance analysts have determined that annual members are more profitable than casual riders. Therefore, the company aims to convert casual riders into annual members. To achieve this goal, the team plans to analyze historical bike trip data to understand differences between casual riders and annual members and identify effective marketing strategies.


## Business tasks
The following are key questions that will guide the future marketing program.
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?
 
The primary objective of this project is to convert Cyclistic's casual riders into annual members. This will be achieved by uncovering valuable insights from data on how casual riders and annual members use Cyclistic bikes differently. The project utilized R programming for data exploration and cleaning, SQL for analysis, and Tableau for visualization. Below are the links to each component of the project for further exploration.

- [Data cleaning](bike_2023_clean_data.R)
- [Data analysis](bike_2023_analyze_data.sql)
- [Data visualization](https://public.tableau.com/views/bike_data_17111672299010/Dashboard1?:language=en-US&onFirstInteraction=function()%20%7B%0A%20%20%20%20%20%20%20%20workbook%20%3D%20viz.getWorkbook();%0A%20%20%20%20%20%20%20%20activeSheet%20%3D%20workbook.getActiveSheet();%0A%20%20%20%20%20%20%20%20console.log(%22My%20dashboard%20is%20interactive%22);%0A%20%20%20%20%7D&:embed=y&:display_count=n&:sid=&:origin=viz_share_link)


## Data preparation
The dataset can be found [here](https://divvy-tripdata.s3.amazonaws.com/index.html). It has been made by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement). <br>

In this case study, I utilized a dataset spanning from January to June 2023, comprising six files in total. Below is a table detailing the 13 variables along with their descriptions.

| Variable          | Description                                                                                                    |
|-------------------|----------------------------------------------------------------------------------------------------------------|
| ride_id           | The unique id of each ride                                                                                     |
| rideable_type     | Type of bicycles, including classic, electric, and docked bikes                                                |
| started_at        | The start time of the trip                                                                                     |
| ended_at          | The end time of the trip                                                                                       |
| start_station_name| The name of the station where the ride started                                                                 |
| start_station_id  | The unique identifier for the station where the ride started                                                   |
| end_station_name  | The name of the station where the ride ended                                                                   |
| end_station_id    | The unique identifier for the station where the ride ended                                                     |
| start_lat         | The latitude coordinate of the starting station                                                                |
| start_lng         | The longitude coordinate of the starting station                                                               |
| end_lat           | The latitude coordinate of the ending station                                                                  |
| end_lng           | The longitude coordinate of the ending station                                                                 |
| member_casual     | Indicates whether the rider is a member or a casual rider                                                      |


## Data exploration
R programming was employed for this step. Initially, the datasets from January to June 2023 were merged, resulting in a total of 2,390,459 entries. Subsequently, the **skim_without_charts** function was utilized to generate a data summary, as depicted in the figure below.

<img src="/images/skim_without_charts.png" alt="Data Summary" height="500"> <br>

Referring to the figure, it's evident that there are **null values** present in the following variables: start_station_id, start_station_name, end_station_id, end_station_name, end_lat, and end_lng.
Following this observation, I conducted checks for **duplications** and **spelling errors** within string datatype columns, including rideable_type, start_station_name, and end_station_name. No errors were detected.

## Data cleaning

Following exploration, the dataset was cleaned by:

1. Entries with null values in start_station_id, start_station_name, end_station_id, and end_station_name were removed.
2. Three new columns were added: ride_length (ended_at - started_at), day_of_week (Sunday - Saturday), and month.
3. Entries where the ended time preceded the started time were excluded.
4. Entries with ride durations longer than a day or less than a minute were excluded.

After cleaning, 613,050 entries were removed, resulting in a total of 1,777,409 entries in the dataset.
The cleaned data was saved as a .csv file, making it readily available for analysis.

## Data analysis
To address the key findings, the following analyses were performed using SQL.
1. The number of casual riders vs annual members.
2. Average duration of all trips for casual riders and annual members.
3. The number of casual riders and annual members for each type of bike.
4. The number of casual riders and annual members per day of the week, alongside the average trip duration.
5. The distribution of casual riders and annual members across each hour of the day.
6. The number of casual riders and annual members in each month, along with the average trip duration.
7. The top 10 popular routes for annual members, including the total number of rides.
8. The top 10 popular routes for casual riders, including the total number of rides.
9. The top 10 round trip routes, including the number of rides by both members and casual riders.

The codes and results can be found [here](bike_2023_analyze_data.sql)

## Data visualization
The visualization was crafted using Tableau Public, featuring two pages: "Ride Distribution" and "Duration & Routes". 
The first page illustrates the total number of rides compared between annual members and casual riders across six months, each bike type, weekdays, and hourly intervals. 
<br><br> <img src="/images/dashboard_1.png" alt="Data Summary" height="500"> <br>

The second page displays the average ride length (in minutes) across weekdays and months, alongside the top 10 popular routes for annual members, casual riders, and round trips.
<br><br><img src="/images/dashboard_2.png" alt="Data Summary" height="500"> <br>


The interactive dashboard can be found [here](https://public.tableau.com/views/bike_data_17111672299010/Dashboard1?:language=en-US&onFirstInteraction=function()%20%7B%0A%20%20%20%20%20%20%20%20workbook%20%3D%20viz.getWorkbook();%0A%20%20%20%20%20%20%20%20activeSheet%20%3D%20workbook.getActiveSheet();%0A%20%20%20%20%20%20%20%20console.log(%22My%20dashboard%20is%20interactive%22);%0A%20%20%20%20%7D&:embed=y&:display_count=n&:sid=&:origin=viz_share_link)

## Key findings
- **Total Ride Distribution:** Annual members contribute to areound two times higher number of total rides, compared to casual riders.
 
- **Monthly Variation:** Both casual riders and annual members show increasing rides across six months. The number peaks in June, coinciding with the summer season in Chicago.

- **Bike Type:** Both annual members and casual riders preferred classic bikes over electric bikes. However, only casual members utilized docked bikes and contribute to the longest average ride durations.

- **Weekly Variation:** Annual members exhibit higher bike usage on weekdays, whereas casual riders show increased usage on weekends.

- **Hourly Usage:** Annual members peak in usage at 8 a.m. and 5 p.m., while casual riders peak in the afternoon.

- **Ride Duration:** Casual riders typically experience longer average ride durations in comparison to annual members across all weekdays and months.

- **Popular Routes:** Casual riders and annual members have distinctively different routes with the highest ride frequencies. While annual members' preferred routes tend to be more directed towards specific destinations, 7 out of the top 10 favored routes for casual riders are round trips. 

Combining the analysis of bike type usage, weekday and hourly patterns, it appears that annual members primarily utilize Cyclistic bikes for daily commutes or errands. On the other hand, casual riders tend to use Cyclistic bikes more for leisure. Analysis on popular routes also provides further evidence supporting this assumption.

## Recommendations
- **Introduce Customized Membership Plans** tailored for casual riders as they exhibit distinct ride patterns compared to annual members as mentioned in key findings. One recommendation is a membership plan targeting weekend bike users, offering reduced costs compared to regular annual memberships with a limited number of uses throughout the year e.g. approximately matching the number of weekends annually. This necessitates further analysis of the average yearly cost spending by casual riders to present the benefits of such a plan and encourage membership uptake.

- **Launching Advertisements During Peak Hours Particularly on Weekends** to encourage casual riders to consider memberships through digital media. These advertisements could emphasize the advantages of annual membership, such as cost savings or additional perks. This targeted approach aims to capture the attention of casual riders during their leisure time and persuade them to consider becoming long-term members.

- **Encourage casual riders who frequently use docked bikes**, as this group often have round trips with the longest average ride duration, around 40 minutes. This suggests usage for exercise. The company could consider developing an application to record ride duration and other health-related features. This application could offer exclusive features accessible only to members, serving as an incentive for casual riders to consider annual membership.

- **Mobile application for seamless user experience** can be used to encourage users to explore supplementary services, potentially fostering brand loyalty. The application can also serve as a channel to promote marketing campaigns and advertisements, showcasing the benefits of annual membership. 
