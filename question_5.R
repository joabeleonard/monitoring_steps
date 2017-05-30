monitoring_data <- read.csv(file='C:/Users/Joabe/Dev/DataScience/monitoring_data/activity.csv',head=TRUE,sep = ",")

steps_by_interval <- setNames(aggregate(monitoring_data$steps ~ monitoring_data$interval, monitoring_data$data, mean), c("interval","steps"))

#The 5-minute interval that, on average, contains the maximum number of steps
max(steps_by_interval$steps)