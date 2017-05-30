monitoring_data <- read.csv(file='C:/Users/Joabe/Dev/DataScience/monitoring_data/activity.csv',head=TRUE,sep = ",")

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
