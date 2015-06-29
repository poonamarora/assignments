# Question 2
source("util.r")
entries_histogram <- function(turnstile_wether){
  dataFrameForRain <- turnstile_weather[turnstile_weather$rain==0,]
  dataFrameForNoRain <- turnstile_weather[turnstile_weather$rain==1,]
  plot <- hist(dataFrameForRain$ENTRIESn_hourly, col=4, main = "Histogram for Hourly Entries - Rain V/s No rain"
               , xlab="Hourly Entries", xlim=c(0,6000),breaks=200)
  plot2 <- hist(dataFrameForNoRain$ENTRIESn_hourly,col=2,add=T,breaks=200)
  legend("topright", c("No-Rain", "Rain"), fill=c("blue", "red"))
  plot2
}

#turnstile_weather <- read.table(input,header=T,sep=',' )
turnstile_weather <- read.table(file.choose(),header=T,sep=',' )
dim(turnstile_weather)
names(turnstile_weather)
attach(turnstile_weather)

entries_histogram(turnstile_weather)



