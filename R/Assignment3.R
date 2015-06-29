source("util.r")
requirePkg("hexbin")
library(ggplot2)
library(hexbin)

turnstile_dataframe <- read.table( file.choose(), header=T,sep=",")
summary(turnstile_dataframe)
str(turnstile_dataframe)

#rain1 <- as.factor(rain)

ggplot(turnstile_dataframe, aes(x = Hour , y = ENTRIESn_hourly)) + geom_point() + stat_smooth(method="lm")

ggplot(turnstile_dataframe, aes(x = Hour , y = ENTRIESn_hourly)) + geom_point() + geom_smooth() 

ggplot(turnstile_dataframe, aes(x = Hour, y = ENTRIESn_hourly)) + geom_hex(aes(color = as.factor(rain))) + geom_smooth(color="white", se=F)
ggplot(turnstile_dataframe, aes(x = Hour, y = EXITSn_hourly)) + geom_hex(aes(color = as.factor(rain))) + geom_smooth(color="white", se=T)
#---------------------------------------------------------#

qplot(Hour, ENTRIESn_hourly, data = turnstile_dataframe)
qplot(Hour, ENTRIESn_hourly, data = turnstile_dataframe, color=as.factor(rain))

qplot(Hour,ENTRIESn_hourly, data = turnstile_dataframe, color = as.factor(rain), geom = c("point","smooth"))

qplot(ENTRIESn_hourly, data= turnstile_dataframe, fill = as.factor(rain))

qplot(Hour, ENTRIESn_hourly, data = turnstile_dataframe, facets = .~rain, color = as.factor(rain))

#-------------Entries By Day---------------------#
rm(list=ls())

turnstile_dataframe <- read.table( file.choose(), header=T,sep=",")
turnstile_dataframe <- data.frame(turnstile_dataframe)
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
print(plot)
