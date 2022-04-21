---
  title: "Bike Share Analysis"
author: "Mussa Ubapa"
date: '2022-04-20'
output: word_document
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Tidyverse and data Importation

After Data Cleaning on spreadsheets, my data was transferred to R program for further analysis, this was done after the installation and loading of tidyverse package.

```{r Tidyverse}
library("tidyverse")
```

## Data Manipulation

Data was trimmed to get the required columns to solve the business problem, this was followed by filtering and sorting of data to keep it in a understandable format.

```{r Data Manipulation}
bike_data<-read.csv(choose.files())
bike_filtered<- bike_data%>%select(start_station_name,member_casual)
bike_rename<- bike_filtered%>%rename(membership_type=member_casual)
bike_filtered2<-bike_rename%>%filter(membership_type=="casual")
bike_summary<-bike_filtered2%>%group_by(start_station_name)%>%count(membership_type)
bike_rename2<-bike_summary%>%rename(number_riders=n)
bike_arrange<-bike_rename2%>%arrange(-number_riders)
Bike_final<-bike_arrange%>%filter(number_riders>=176)
head(Bike_final)
```

## Data summary and Viz

The summary of data focused on identifying the start station names with the most number of casual riders. By identifying these location it will be easier to allocate all marketing and advertising resources to these location, so as to convince a large number of audience to subscribe for membership package.

### The table below shows the top six start station with most of casual rider.
