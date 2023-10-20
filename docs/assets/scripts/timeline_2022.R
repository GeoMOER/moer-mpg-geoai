# Description on GitHub:
# {timevis} lets you create rich and fully interactive timeline visualizations in R.
# Timelines can be included in Shiny apps and R markdown documents, or viewed from the R console
# and RStudio Viewer. {timevis} includes an extensive API to manipulate a timeline after creation,
# and supports getting data out of the visualization into R. This package is based on the visjs
# Timeline JavaScript library.

# install.packages("timevis")
library(timevis)

# to create a timeline you basically just need a data.frame with at least six columns (id,content,start,end,group,type)
# for one example look below or on these websites: https://github.com/daattali/timevis or https://daattali.com/shiny/timevis-demo/
# for clarity I would suggest to designate each date with a name or number

timevisData <- data.frame(
  id = 1:29,
  content = c( 
    # sessions
    "Kick off & Unit 1",                         # 1
    "Unit 1",                                    # 2
  #  "Unit 2",                                    # 3
    "Unit 2",                                    # 4
    "Unit 3",                                    # 5
    "Unit 3",                                    # 6
    "Unit 3/4",                                  # 7
    "Unit 4",                                    # 8  
    "Unit 4",                                    # 9  
    "Unit 4 + Start team project",               # 10
    "Unit 5: Concept discussion/presentation",   # 11
    "Unit 5: Team project",                      # 12
    "Unit 5: Team Project",                      # 13
    "Unit 5: Team project",                      # 14
    "Unit 5: Goodbye",                           # 15
   
   
    # self-learning 
    "Unit 1",                            # 16
    "Unit 2",                            # 17
    "Unit 3",                            # 18
    "Unit 4",                            # 19
    "Concept team project + Team project",       # 20
    "Team project",                              # 21
    # submission
    "Assignment Unit 1-1",                         # 22
    "Assignment Unit 1-2",                         # 23
 #   "Assignment Unit 2-1",                         # 24
    "Assignment Unit 2",                         # 25
    "Assignment Unit 03-1",                      # 26
    "Assignment Unit 03-2",                      # 27
    "Assignment Unit 04-1",                      # 28
    "Assignment Unit 04-2",                      # 29
    "Concept submission",                        # 30
    "Team project submission"                   # 31  

    
  ),                                    
  start   = c(
    # sessions
    "2022-10-21 09:15:00",                       # 1
    "2022-10-28 09:15:00",                       # 2
  #  "2022-11-04 09:15:00",                       # 3
    "2022-11-11 09:15:00",                       # 4
    "2022-11-18 09:15:00",                       # 5
    "2022-11-25 09:15:00",                       # 6
    "2022-12-02 09:15:00",                       # 7
    "2022-12-09 09:15:00",                       # 8
    "2022-12-16 09:15:00",                       # 9
    "2022-12-23 09:15:00",                       # 10 
    "2023-01-13 09:15:00",                       # 11
    "2023-01-20 09:15:00",                       # 12
    "2023-01-27 09:15:00",                       # 13               
    "2023-02-03 09:15:00",                       # 14
    "2023-02-10 09:15:00",                       # 15
    
    
    # self-learning
    "2022-10-21 11:45:00",                       # 16
    "2022-11-11 11:45:00",                       # 17
    "2022-11-18 11:45:00",                       # 18
    "2022-12-02 11:45:00",                       # 19
    "2022-12-23 11:45:00",                       # 20
    "2023-01-13 11:45:00",                       # 21

    
    # submission
    "2022-10-28 09:00:00",                                # 22
  #  "2022-11-04 09:00:00",                                # 23
    "2022-11-11 09:00:00",                                # 24
    "2022-11-18 09:00:00",                                # 25
    "2022-11-25 09:00:00",                                # 26
    "2022-12-02 09:00:00",                                # 27
    "2022-12-09 09:00:00",                                # 28
    "2022-12-23 09:00:00",                                # 29
    "2023-01-09 23:59:00",                                # 30
    "2023-03-10 23:59:00"                                # 31

  ),                     
  end     = c(
    # sessions
    NA,                                          # 1 
    NA,                                          # 2
 #   NA,                                          # 3
    NA,                                          # 4
    NA,                                          # 5
    NA,                                          # 6
    NA,                                          # 7
    NA,                                          # 8
    NA,                                          # 9
    NA,                                          # 10
    NA,                                          # 11
    NA,                                          # 12
    NA,                                          # 13
    NA,                                          # 14
    NA,                                          # 15
    # self-learning
    "2022-11-11 09:15:00",                       # 16
    "2022-11-18 09:15:00",                       # 17
    "2022-12-02 09:15:00",                       # 18
    "2022-12-23 09:15:00",                       # 19
    "2023-01-09 23:59:00",                       # 20
    "2023-03-10 23:59:00",                       # 21
    # submission
    NA,                                          # 22
  #  NA,                                          # 23 
    NA,                                          # 24
    NA,                                          # 25
    NA,                                          # 26
    NA,                                          # 27
    NA,                                          # 28
  NA,                                          # 29
  NA,                                          # 30
    NA#,                                          # 31
    # other
 #   "2021-10-19",                                # 29
  #  "2022-01-07",                                # 30
 #   "2022-02-20",                                # 31
 #   "2022-04-02"                                 # 32
    
  ),
  
  
  group = c(rep("sessions", 14),rep("selfLearning",6), rep("submission", 9)),
  type = c(rep("point", 14),rep("range",6),rep("point",9))
)


# this following dataframe is just needed if you would like to create a timeline with different groups
timevisDataGroups <- data.frame(
  id = c("sessions","selfLearning", "submission"),
  content = c("Hybrid sessions","Self-learning", "Submission")
)

# finally just call the timevis function to get your plot/timeline
# we can change the width, but this is not recommend; e.g.: height = 500,width = 800
t <- timevis(timevisData,groups=timevisDataGroups,fit=FALSE, width = '100%') 

t
