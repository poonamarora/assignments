source("util.r")
requirePkg("hexbin")
library(ggplot2)
library(hexbin)

#rain1 <- as.factor(rain)
#----------------------hex bin plots----------------------------#
plot_entries_by_hour_of_the_day <- function(turnstile_weather){
  plot <- ggplot(turnstile_dataframe, aes(x = Hour, y = ENTRIESn_hourly)) + geom_hex(aes(color = as.factor(rain))) + geom_smooth(color="white", se=F)
  plot
}

plot_exits_by_hour_of_the_day <- function(turnstile_weather){
  plot <- ggplot(turnstile_dataframe, aes(x = Hour, y = EXITSn_hourly)) + geom_hex(aes(color = as.factor(rain))) + geom_smooth(color="white", se=T)
  plot
}
#----------------------Q plots----------------------------#

qplot_entries_by_hour_of_the_day = function(turnstile_dataframe){
  plot <- qplot(Hour,ENTRIESn_hourly, data = turnstile_dataframe, color = as.factor(rain), geom = c("point","smooth"))  
  plot
}

saprate_rain_norain_by_hour = function(turnstile_dataframe){
  plot <- qplot(Hour, ENTRIESn_hourly, data = turnstile_dataframe, facets = .~rain, color = as.factor(rain))  
  plot
}


plot_entries_by_day_of_week <- function(turnstile_dataframe){
  Date_TWD <- turnstile_dataframe[,"DATEn"]
  Date_TWD <- data.frame(Date_TWD)
  dim(Date_TWD)
  
  #Day <- weekdays(as.Date(Date_TWD$Date))
  Day <- as.POSIXlt(turnstile_dataframe$DATEn)$wday
  turnstile_dataframe <- cbind(turnstile_dataframe, Day)
  
  dim(turnstile_dataframe)
  head(turnstile_dataframe)
  
  head(Date_TWD)
  tail(Date_TWD)
  
  agg <- aggregate(ENTRIESn_hourly ~ Day, turnstile_dataframe, mean)
  head(agg)
  dim(agg)
  p <- ggplot(agg, aes(x=Day, y=ENTRIESn_hourly))
  plot <- p + geom_line(aes(colour=ENTRIESn_hourly)) + geom_point()
  plot
}

#---RUN--
turnstile_data <- read.table(input, header=T,sep=",")
#turnstile_data <- read.table(file.choose(), header=T,sep=",")
summary(turnstile_data)
str(turnstile_data)
turnstile_dataframe <- data.frame(turnstile_data)

print(plot_entries_by_day_of_week(turnstile_dataframe))
print(plot_entries_by_hour_of_the_day(turnstile_dataframe))
print(plot_exits_by_hour_of_the_day(turnstile_dataframe))
print(qplot_entries_by_hour_of_the_day(turnstile_dataframe))
print(saprate_rain_norain_by_hour(turnstile_dataframe))


