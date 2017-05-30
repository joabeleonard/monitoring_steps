monitoring_data <- read.csv(file='C:/Users/Joabe/Dev/DataScience/monitoring_data/activity.csv',head=TRUE,sep = ",")

#Code to describe and show a strategy for imputing missing data
steps_by_day <- tapply(monitoring_data$steps, monitoring_data$date, FUN = sum, na.rm = TRUE)

steps_by_day
hist(steps_by_day, xlab = "Total number of steps", main="Number of steps by day")