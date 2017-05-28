library(ggplot2)

monitoring_data <- read.csv(file='C:/Users/Joabe/Dev/DataScience/monitoring_data/activity.csv',head=TRUE,sep = ",")
# convert date from string to Date class
monitoring_data$date <- as.Date(monitoring_data$date, "%Y-%m-%d")

# add a new column indicating day of the week 
monitoring_data$day <- weekdays(monitoring_data$date)

# add a new column called day type and initialize to weekday
monitoring_data$day_type <- c("weekday")

# If day is Saturday or Sunday, make day_type as weekend
for (i in 1:nrow(monitoring_data)){
  if (monitoring_data$day[i] == "sábado" || monitoring_data$day[i] == "domingo"){
    monitoring_data$day_type[i] <- "weekend"
  }
}

# convert day_time from character to factor
monitoring_data$day_type <- as.factor(monitoring_data$day_type)

# aggregate steps as interval to get average number of steps in an interval across all days
table_interval_steps_imputed <- aggregate(steps ~ interval+day_type, monitoring_data, mean)

monitoring_data

qplot(interval, steps, data=table_interval_steps_imputed, geom=c("line"), xlab="Interval", 
      ylab="Number of steps", main="") + facet_wrap(~ day_type, ncol=1)

