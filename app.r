# Sys.getenv("PPT_R_GOOGLE_SERVICE_ACCOUNT_PATH")
# https://github.com/jdeboer/ganalytics

source("reqs/requirements.r")
source("fn/connections.r")
library(ganalytics)
my_creds <- GoogleApiCreds(readline(prompt="Enter email: "), Sys.getenv("PPT_R_GOOGLE_OAUTH20_ACCOUNT_PATH"))


# test authentication
myQuery <- GaQuery(view_id, creds = my_creds )
pptr_sessions <- GetGaData(myQuery)
print(str(pptr_sessions))

library(ggplot2)
#https://ggplot2.tidyverse.org/reference/geom_bar.html
png(file = "~/ppt-r/plots/geomcol_sessions.png")
g <- ggplot(pptr_sessions, aes(date, sessions))
g + geom_col()


#DateRange(myQuery) <- c("2020-01-01", "2020-02-22")
#data <- GetGaData(myQuery)
#summary(data)

#Metrics(myQuery) <- c("ga:pageviews", "ga:sessions")
#data <- GetGaData(myQuery)
#summary(data)

#library(ggplot2)
#p <- ggplot(pptr_sessions$sessions, aes(pptr_sessions$date))
#p+geom_bar()



source("fn/charts.r")
bar <- Chart$new(pptr_sessions)
