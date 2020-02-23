# connections.r
# must be sourced before "ganalytics"
# read yaml files in "user" folder and parses values as lists

# next line has to be removed in production
#source("reqs/requirements.r")

library("yaml")

# con.yaml
# set up Google Analytics View ID for the report
con <- read_yaml(file = "~/ppt-r/user/con.yaml", fileEncoding = "UTF-8")
view_id <- con$view_id


# app.yaml
# reads builds specs
# returns a key value pair list
test <- read_yaml(file = "~/ppt-r/user/app.yaml", fileEncoding = "UTF-8")
