# Packages will be installed only in
# projects's main directory at ".checkpoint" folder
# They will not be shared globally

# https://mran.revolutionanalytics.com/web/packages/checkpoint/checkpoint.pdf



if (!require("devtools")) install.packages("devtools", repos="https://mran.microsoft.com/snapshot/2020-02-21")
if (!require("checkpoint")) install.packages("checkpoint", repos="https://mran.microsoft.com/snapshot/2020-02-21")

library("checkpoint")
print(getwd())
checkpoint("2020-02-21", checkpointLocation=getwd())

if (!require("ganalytics")) install.packages("ganalytics", dependencies = TRUE, repos="https://mran.microsoft.com/snapshot/2020-02-21")

##########################
# Use only when neccesary
# if (!require("usethis")) install.packages("usethis", repos="https://mran.microsoft.com/snapshot/2020-02-21")
# https://usethis.r-lib.org/articles/articles/usethis-setup.html
#library("usethis")
#usethis::edit_r_environ()



getOption("repos")