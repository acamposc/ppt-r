# app.yaml
# reads builds specs
# returns a key value pair list object for each slide requested

require(yaml)
require(R6)

appyaml_location <- c("~/ppt-r/user/app.yaml")

Appyaml <- R6Class("Appyaml",
                   private = list(
                     ..outline = read_yaml(file = appyaml_location, fileEncoding = "UTF-8")
                   ),
                   active = list(
                     appyaml = function(){
                       private$..outline
                     }))
