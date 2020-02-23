# Sys.getenv("PPT_R_GOOGLE_SERVICE_ACCOUNT_PATH")
# https://github.com/jdeboer/ganalytics

source("reqs/requirements.r")
source("fn/connections.r")
library(ganalytics)
my_creds <- GoogleApiCreds(readline(prompt="Enter email: "), Sys.getenv("PPT_R_GOOGLE_OAUTH20_ACCOUNT_PATH"))


# test authentication
myQuery <- GaQuery(view_id, creds = my_creds )
GetGaData(myQuery)