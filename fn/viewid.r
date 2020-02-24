# viewid.r
# must be sourced before "ganalytics"
# read yaml files in "user" folder and parses values as lists
# set up Google Analytics View ID for the report

require(yaml)
require(R6)

viewidyaml_location <- c("~/ppt-r/user/con.yaml")

Viewidyaml <- R6Class("Viewidyaml",
                      private = list(
                        ..viewid = read_yaml(file = viewidyaml_location, fileEncoding = "UTF-8")
                      ),
                      active = list(
                        viewid = function(){
                          private$..viewid
                        }))

