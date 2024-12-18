# Week 6 Data Visualization part 1b notes
## time series and facets

library(tidyverse)
surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.)) # the dot means on the entire data frame 

head(yearly_counts <- surveys_complete %>% count(year, species_id))
head(surveys_complete %>% group_by(year,species_id) %>% tally())
# these are two different ways of doing the same thing 
# whatever colors you ask to be on last is the one you see 
?count # count 

yearly_counts <- surveys_complete %>% count(year, species_id)

head(yearly_counts)
## ggplots like long data

#class notes
ggplot(data = yearly_counts, mapping = aes(x=year, y=n, group = species_id)) +
  geom_line(aes(colour = species_id))

ggplot(data = yearly_counts, mapping = aes(x=year, y=n, group = species_id)) +
  geom_line() + 
  facet_wrap( ~species_id) 

plot(data = yearly_counts,
     mapping = aes( x= year, y=n, group = species_id)) +
  geom_line(aes(colour = species_id))

ggplot( data= yearly_counts[yearly_counts$species_id %in% c("BA","DM", "DO", "DS")],
        mapping = aes(x= year, y=n, group = species_id)) +
  geom_line +
  facet_wrap(~species_id) + 
  scale_y_continous(name = "obs", breaks = seq(0,600,100)) + 
  theme_bw

#default
theme_bw()

# make scatter plots
ggplot( data = yearly_counts, mapping = aes(x= year, y=n)) +
  geom_point()
# Maya, remember to clear out your plots!! orelse your plots won't show!!!

# line plot
ggplot(data = yearly_counts, mapping = aes(x= year, y=n, group = species_id)) + 
  geom_line() 
# lines goes up and down for years without data 
# we can't see which species is which 

ggplot(data = yearly_counts, mapping = aes(x= year, y=n, colour = species_id)) +
  geom_line()
# not good plot

ggplot((data = yearly_counts, mapping = aes(x= year, y=n)) + 
          geom_line() +
         facet_wrap(~species_id,  scales = "free"))
# why isn't my plot showing up..? 

# good image of most frequent animals and temporal distribution 
# facet_wrap allows you add a third dimension to your plot 

library(ggthemes)
install.packages("ggthemes")       
library(ggthemes)
library("tigris")
install.packages("tigris")
library("sf")
install.packages("sf")
ca_counties = tigris :: counties (state = "CA", class = "sf") #, year = 2024

ggplot(data = ca_counties) + geom_sf() +theme_map ()

ggplot(data = ca_counties) + 
  geom_sf(aes(fill = -ALAND)) + theme_map() +
  scale_fill_continuous_tableau()
