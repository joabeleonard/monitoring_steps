monitoring_data <- read.csv(file='C:/Users/Joabe/Dev/DataScience/monitoring_data/activity.csv',head=TRUE,sep = ",")

#Code to describe and show a strategy for imputing missing data
missing <- is.na(monitoring_data$steps)
# How many missing
table(missing)