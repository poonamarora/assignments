rm(list=ls())
# input/output file names
input <- "../data/turnstile_data_master_with_weather.csv"
file1 <- "../data/file_1.txt"
file2 <- "../data/file_2.txt"
master <- "results/master.txt"
mapper_output <- "results/mapper_output.log"

# utility to install package if not present already
requirePkg <- function(x)
{
  if (!require(x,character.only = TRUE))
  {
    install.packages(x, dep=TRUE)
    if(!require(x, character.only = TRUE)) stop("Given package not found")
  }
}

# function to test if two arguments are equal
requirePkg("compare")
library(compare)
assertEquals <- function(expected, actual){
  comparison <- compare(actual, expected, allowAll=TRUE)
  comparison$result
}
