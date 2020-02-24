# ganalytics.r
# only meant to run when yaml.r's data-source field is set to google analytics
# reference:
# https://github.com/jdeboer/ganalytics


library(ganalytics)
my_creds <- GoogleApiCreds(readline(prompt="Enter email: "), Sys.getenv("PPT_R_GOOGLE_OAUTH20_ACCOUNT_PATH"))


# test authentication
myQuery <- GaQuery(view_id, creds = my_creds )
pptr_sessions <- GetGaData(myQuery)
print(str(pptr_sessions))



#DateRange(myQuery) <- c("2020-01-01", "2020-02-22")
#data <- GetGaData(myQuery)
#summary(data)

#Metrics(myQuery) <- c("ga:pageviews", "ga:sessions")
#data <- GetGaData(myQuery)
#summary(data)