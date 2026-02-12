# Setup
library(tidyverse)

# Input
url = 'https://raw.githubusercontent.com/hannesdatta/course-dprep/main/material/tutorials/r-bootcamp/streams.csv'
download.file(url, destfile = 'streams.csv')

streams = read_csv('streams.csv', skip = 1)

# Transformation

earnings = streams %>% group_by(Artist) %>% summarise(total_streams = sum(Streams),
                                           dollars_earned = sum(Streams)*.004) %>% 
  arrange(-total_streams)

# Output
write_csv(earnings, 'earnings.csv')

