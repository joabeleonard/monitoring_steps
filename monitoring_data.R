monitoring_data <- read.csv(file='C:/Users/Joabe/Dev/DataScience/monitoring_data/activity.csv',head=TRUE,sep = ",")
summary(monitoring_data)

monitoring_data

#Code to describe and show a strategy for imputing missing data
steps_by_day <- tapply(monitoring_data$steps, monitoring_data$date, FUN = sum, na.rm = TRUE)

steps_by_day
hist(steps_by_day, xlab = "Total number of steps", main="Number of steps by day")

mean(steps_by_day, na.rm = TRUE)
median(steps_by_day, na.rm = TRUE)

steps_by_interval <- setNames(aggregate(monitoring_data$steps ~ monitoring_data$interval, monitoring_data$data, mean), c("interval","steps"))
steps_by_interval

plot(steps_by_interval$interval, steps_by_interval$steps, type='l', 
     main="Average number of steps over all days", xlab="Interval", 
     ylab="Average number of steps")

#The 5-minute interval that, on average, contains the maximum number of steps
max(steps_by_interval$steps)

#
#Code to describe and show a strategy for imputing missing data
missing <- is.na(monitoring_data$steps)
# How many missing
table(missing)

# Replace each missing value with the mean value of its 5-minute interval
fill.value <- function(steps, interval) {
  filled <- NA
  if (!is.na(steps)) 
    filled <- c(steps) else filled <- (steps_by_interval[steps_by_interval$interval == interval, "steps"])
    return(filled)
}
filled.data <- monitoring_data
filled.data$steps <- mapply(fill.value, filled.data$steps, filled.data$interval)
total.steps <- tapply(filled.data$steps, filled.data$date, FUN = sum)

hist(steps_by_day, xlab = "Total number of steps", main="Number of steps by day")

mean(total.steps)


#8 - Panel plot comparing the average number of steps taken per 5-minute interval across weekdays and weekends
activityDataImputed$dateType <-  ifelse(as.POSIXlt(monitoring_data$date)$wday %in% c(0,6), 'weekend', 'weekday')

