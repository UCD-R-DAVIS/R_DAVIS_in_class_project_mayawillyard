# Accessing Spreadsheets
#CSV file, text file open in R
surveys <- read.csv("data/portal_data_joined.csv") #click on tab to import data 
str(surveys)
surveys
class(surveys)

nrow(surveys)
ncol(surveys)
str(surveys)

head(surveys) #shows the top function
tail(surveys) # shows the end function
?head #default options shows the first 6 rows of the object you are running 
head(surveys, n=11) #change the number of rows that will come out 
head (surveys, n=3)


summary(surveys) # descriptive summary of every column it finds
#summary on sex 
surveys$sex
?summary
summary.data.frame(surveys)
summary(object = surveys)

surveys[1, 5]
head(surveys, 1)

# you can pull multiple values out of the row or column 
surveys[1,] # show me all of the row
surveys[,1] #show me all of the data in the column
surveys[1]
head(surveys[1]) #understand the dimensionality of what you are indexing because answer could come out vertically or horizontally
head(surveys[,1])
#vector is one dimnesional vs datagrame is multidimensional

surveys [1:3,] #give me the first three rows

1:10
surveys[1:10] #gives first 10 rows of the survey object
surveys [,1:3] #all of the rows of the first three column 
surveys[1:3,1:3]

surveys[c(1,4,10),  c(2,4,6)] #if you put c, it filters it out but 
surveys[,-1] #surveys without the first column
surveys [-1,] #all columns without the first row 

surveys [-c(7:nrow(surveys)),]
nrow(surveys)==34786
#LINE 48 is the same as head(surveys)
head(surveys)

#index by name of column 
surveys["genus"]
head(surveys["genus"]) #first 6 rows of genus column
head(surveys[, "genus"]) #same information as LINE 55 but different format
#check what is going on in this function 
class(head(surveys[,"genus"]))#R returns all of the value not the data frame
class(head(surveys["genus"])) 
surveys[["genus"]] #same as LINE 58


#walk through the data frame object
#index numerically or use the dollar sign 

surveys$record_id

install.packages("tidyverse") 
library(tidyverse)

t_surveys <- read_csv('data/portal_data_joined.csv')
t_surveys
class(t_surveys)
#last thing is the real thing so it is a "data frame" but the rest are wrappers
#tibble wrappers = instead of typing out all of the tibble, give subset and other information/comments

surveys[,1]
t_surveys[,1]
