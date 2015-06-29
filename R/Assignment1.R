# Please make sure that all the input files are placed under ../%workingDirectory%/data directory
source("util.r")

# input : filenames, var args and outputfile!
create_master_turnstile_file = function(..., outputfile){
  filenames <- list(...)
  files <- lapply(filenames, function(filename){
    file <- read.table(filename, sep=',')
    names(file) <- c("C/A","UNIT","SCP","DATEn","TIMEn","DESCn","ENTRIESn","EXITSn")
    file
  })
  masterfile <- do.call("rbind", files)
  write.table(masterfile, file = outputfile, sep = ",", row.names=FALSE)
  masterfile
}
masterfile <- create_master_turnstile_file(file1, file2, outputfile = master)
print(head(masterfile))



# Tryings...
# file1 <- read.table(file.choose(),sep=',')
# file.choose() will open the file explorer and allows user  to choose
# the file from whereever one has saved it

#names(file1) <- c("C/A","UNIT","SCP","DATEn","TIMEn","DESCn","ENTRIESn","EXITSn")
#head(file1)
#dim(file1)

# file 2
#file2 <- read.table(file.choose(),sep=',')
#names(file2) <- c("C/A","UNIT","SCP","DATEn","TIMEn","DESCn","ENTRIESn","EXITSn")
#head(file2)
#dim(file2)

#masterfile <- rbind(file1,file2)
#dim(masterfile)
# The above command will save the file in current working directory
# One can retrieve working directory in R using getwd() command
# Question 2




