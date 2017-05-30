monitoring_data <- read.csv(file='C:/Users/Joabe/Dev/DataScience/monitoring_data/activity.csv',head=TRUE,sep = ",")

steps_by_day <- tapply(monitoring_data$steps, monitoring_data$date, FUN = sum, na.rm = TRUE)

mean(steps_by_day, na.rm = TRUE)
median(steps_by_day, na.rm = TRUE)