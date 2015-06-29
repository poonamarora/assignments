source("Assignments.R")

# inputs
file1 <- read.table("file_1.txt", sep = ",")
file2 <- read.table("file_2.txt", sep = ",")

#Test : dimensions are equal
assertEquals(length(file1), length(masterfile))
assertEquals(nrow(file1) + nrow(file2), nrow(masterfile))

# Test: master's head should be equal to the head of first file
header.actual <- head(masterfile)
header.expected <- head(file1)

assertEquals(header.actual,header.expected)

# Test: tail of file2 and masterfile shd be same
footer.actual <- tail(masterfile)
footer.expected <- tail(file2)
assertEquals(footer.actual,footer.expected)
