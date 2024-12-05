# process fit files 
# make sure that you use package that ecists 
# make sure the simple thing works before making it complicated 

for(f in gz_files){print(f)} # check when its simple 
# start with i, then j 

library(pbapply)
# lapply(fit_files), print)

# do.call map but in base R
# stacking up 10 data frame
# data frames are picky lists 
# strava data 
# i never found the data link....
