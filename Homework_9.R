# Homework 9
library(tidyverse)

moaloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

# use purrr concepts map for question 2
moaloa %>% map(max)

# using for loop
# print longest species name
# for each taxa 
# nchar () = #characters

for (i in unique(surveys$taxa)){
  mytaxon <- surveys %>% filter(taxa == i)
  print(i)
  myspcies <- unique(mytaxon$species)
  maxlength <- max(nchar(myspecies))
  mytaxon %>% filter(nchar(species) == maxlength) %>% 
    select(species) %>%  unique() # if there were multiple rows of "species" then you need a pipe and unique() at the end
} 

mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/mauna_loa_met_2001_minute.csv")

mycols <- moaloa %>% select("windDir", "windSpeed_m_s",
                          "baro_hPa", 
                          "temp_C_2m",
                          "temp_C_10m",
                          "temp_C_towertop",
                          "rel_humid",
                          "precip_intens_mm_hr")
mycols %>% map(min, na.rm = T)

#part 3

C_to_F <- function(x){
  x *1.8 + 32
}

#mutate
moaloa <- moaloa %>% mutate(
  temp_F_2m = C_to_F(temp_C_2m),
  temp_F_10m = C_to_F(temp_C_10m),
                            temp_F_towertop = C_toF(temp_C_towertop),)

#bonus
#challenge 
#use lapply to make new column that inlcudes genus + species
# how can we make it one string 

# how to replace to string 
library(stringr)
str_replace("temp_F_2m", "_F_", "_C_")

# for loop is you set out a list beforehand 
# map is based on output 