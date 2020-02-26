# Packages will be installed only in
# projects's main directory at ".checkpoint" folder
# They will not be shared globally

# https://mran.revolutionanalytics.com/web/packages/checkpoint/checkpoint.pdf
# https://github.com/viking/r-yaml/

# repo variables
# change when it is time to update / downgrade packages 
# or change package repositories
ppt_r_checkpoint_date <- c("2020-02-21")
ppt_r_repo_mran_snapshot <- c("https://mran.microsoft.com/snapshot/")
# if looking to use CRAN as repo, uncomment next line
# and replace where necessary.
# ppt_r_repo_cran_snapshot <- c("CRAN")

#.libPaths(c( "~/ppt-r/.checkpoint/2020-02-21/lib/x86_64-apple-darwin15.6.0/3.6.2/"))
if (!require("googleAnalyticsR")) install.packages("googleAnalyticsR", repo = c("https://mran.microsoft.com/snapshot/2020-02-21"))

if (!require("devtools")) install.packages("devtools", repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))
if (!require("checkpoint")) install.packages("checkpoint", repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))

library("checkpoint")
print(getwd())
checkpoint(ppt_r_checkpoint_date, checkpointLocation=getwd())

# Data loading
if (!require("yaml")) install.packages("yaml", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))
#if (!require("ganalytics")) install.packages("ganalytics", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))
if (!require("googleAuthR")) install.packages("googleAuthR", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))

# Data munging
# https://tidyverse.tidyverse.org/
# ggplot2, dplyr, tidyr, readr, purrr, tibble, stringr, forcats, hms, lubridate, httr, jsonlite, readxl, rvest, xml2, modelr, broom
if (!require("tidyverse")) install.packages("tidyverse", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))
if (!require("R6")) install.packages("R6", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))
if (!require("stringr")) install.packages("stringr", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))
if (!require("purrr")) install.packages("purrr", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))

# Data output
if (!require("officer")) install.packages("officer", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))
if (!require("magrittr")) install.packages("magrittr", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))
if (!require("mschart")) install.packages("mschart", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))
if (!require("rvg")) install.packages("rvg", dependencies = TRUE, repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))


##########################
# Use only when neccesary
# if (!require("usethis")) install.packages("usethis", repos=paste0(ppt_r_repo_mran_snapshot, ppt_r_checkpoint_date))
# https://usethis.r-lib.org/articles/articles/usethis-setup.html
#library("usethis")
#usethis::edit_r_environ()



getOption("repos")