source("util.r")
library(logging)
basicConfig()
addHandler(writeToFile, file = mapper_output, level='INFO')

turnstile_weather <- read.table(input, header=T, sep="," )
head(turnstile_weather)

mapper <- function (turnstile_weather){
  Df <- turnstile_weather[,c("UNIT","ENTRIESn_hourly")]
  loginfo(paste(Df$UNIT, Df$ENTRIESn_hourly, sep = "\t"))
}

mapper(turnstile_weather)
