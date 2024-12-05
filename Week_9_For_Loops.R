# Week 9 Video Notes For Loops 

head(iris) # data upload
head(mtcars) # data upload
# map function is in base R and apply functions are in tidyverse
# for each row in that column calculate the mean 

# Subsetting refreshers 
# square brackets to index
iris[1]
iris[[1]] # vector of values get pulled out from that coloumn with DOUBLE brackets
# this is the same as calling up the cololumn 
iris$Sepal.Length
# or this form of indexing to gather that vector value 
iris[,1] # row, coloumn 
iris[1,1]
iris$Sepal.Length[1]

# For Loops 
# when you want to do something down rows of data
# takes an index value runs it through your function 
# layout: use of i to specify index value (although you can use any value here)
# function vs for loops
## 

test <- function(i){
  print(i)
}

test(1)

# verses iteration 
for(i in 1:10){
  print(i)
}

# values are stored in iteration 
# how do we store multiple things in iteration 
results <- rep(NA, nrow(mtcars))
results

for(i in 1:10){
  print(i)
}
# for every index value, in the range 1-10, print that value -- which is for every single i
# stores the very last value that went through for loop

for(i in 1:10){
  print(iris$Sepal.Length[i])
  print(mtcars$mpg[i])
}
head(iris$Sepal.Length, n = 10)

# you can do multiple things at once
# data is alternating by rows with mtcars and iris 
# your cursor is important 

#store the output 
# vector of values related to mpg in this data frame

results <- rep(NA, nrow(mtcars))
results
# counts how many rows are there, so counts NA values for each row existing

for (i in 1:nrow(mtcars)) {
  results[i] <- mtcars$wt[i]*100
}
results
mtcars$wt
# a list of 32 values
# save the value in "results" 

# Map family of functions 
# map functions are useful when you want to do something acorss multiple columns 
library(tidyverse)
# two arguments: the data and the function
# cross multiple cause (covert multiple coloumns to a factor)
map(iris, mean)
# NA for species so its unable to generate mean 
# default output is a list
map_df(iris, mean) # take a dataframe in and dataframe out 

# map functions are used in conjunction with custom function you have written 
head(mtcars)
print_mpg <- function (x,y){
  paste(x, "gets", y, "miles per gallon")
}

# put text value and data value and put it together throgugh PASTE
# Another type of map function : map2_chr
# format: map2_chr(input1, input2, function)

map2_chr(rownames(mtcars), mtcars$mpg, print_mpg)

# create function called print_mpg to create map2
# create embed anonymous function 
map2_chr(rownames(mtcars), mtcars$mpg, function (x,y)
  paste(x, "gets", y, "miles per gallon"))
# pasted equation in here as well

paste(rownames(mtcars), "gets", mtcars$mpg, "miles per gallon")
# regression model for different subsets of data; use for loop

#For Loop extra notes 
# dataframe example
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")
for(i in unique(gapminder$country)){
  country_df <- gapminder[gapminder$country == i, 1]
  df <- country_df %>% 
    summarize(meanGDP = mean(gdpPercap, na.rm = TRUE))
  print(df)
}
# if this was tidyverse
gapminder %>% 
  group_by(country) %>% 
  summarize(meanGDP = mean(gdpPercap, na.rm = TRUE)) %>% 
  head()
# for loops make it easier so that you can do it in one step 
