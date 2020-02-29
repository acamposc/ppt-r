# viewid.r
# must be sourced before "ganalytics"
# read yaml files in "user" folder and parses values as lists
# set up Google Analytics View ID for the report

require(yaml)
require(R6)

conyaml_location <- c("~/ppt-r/user/con.yaml")

Con <- R6Class("Con",
                      private = list(
                        ..con = read_yaml(file = conyaml_location, fileEncoding = "UTF-8")
                      ),
                      active = list(
                        con = function(){
                          private$..con
                        }))

