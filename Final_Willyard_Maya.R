# Final Exam 
library(tidyverse)
library(ggplot2)
library(lubridate)
library(dplyr)
library()
# Question 1
lap <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv")

##lap %>% filter(!is.na("cycling")) %>% 
 # filter(!is.na(running$minutes_per_mile > 10 & running$minutes_per_mile < 5 &
       #    running$total_elapsed_time_s)) %>% 
 # group_by(month,day) %>% 
 # mutate(normal_running = case_when(date <= 2023 ~ "pre-2024 running", 
                                    #date > 2024 & date <= 2024.6 ~ "intial rehab",
                                   # date >= 2024.6 ~ "present")) %>% 
# this is too much in one code; break it apart

# Question 2 & Question 3
normal_running <- lap %>% filter(!is.na(minutes_per_mile > 10 & minutes_per_mile < 5 & total_elapsed_time_s)) %>% filter(!sport == "cycling")

# Question 4
normal_running %>% mutate(Time_Period = case_when(
  timestamp < ymd("2024-01-01") ~ "Pre-2024 Running",
  timestamp >= ymd("2024-01-01") & timestamp <= ymd("2024-06-30") ~ "Initial Rehab, Jan.-Jun. 2024",
  timestamp >= ymd("2024-07-01") ~ "Present"
))
view(normal_running)
# how do you make this into actual columns though, not reflected in view(normal_running)
# mutate function is included...

# Question 5 & 6
ggplot() +
  geom_point(aes(x= minutes_per_mile, y = steps_per_minute)) +
  geom_line(aes(x=minutes_per_mile, y = steps_per_minute)) +
  theme(axis.text.x = element_text (angle = 45,vjust = 1)) +
  scale_fill_colorblind("pop") +
  ggtitle("Change in strides in speed by time period") +
  xlab("Speed") +
  ylab("Steps Per Minute") +
  
# ran out of time.. will come back to this 
# run colorblind package, differentiate plot color by time period 
# never finished quesiton 7 and 8

?geom_smooth
