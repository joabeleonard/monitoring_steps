monitoring_data <- read.csv(file='C:/Users/Joabe/Dev/DataScience/monitoring_data/activity.csv',head=TRUE,sep = ",")

steps_by_interval <- setNames(aggregate(monitoring_data$steps ~ monitoring_data$interval, monitoring_data$data, mean), c("interval","steps"))
steps_by_interval

plot(steps_by_interval$interval, steps_by_interval$steps, type='l', 
     main="Average number of steps over all days", xlab="Interval", 
     ylab="Average number of steps")