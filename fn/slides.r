# slides.r
# object Slides creates slides 
# slides attributes comes from app.yaml fields
# main attributes: layout, title, graph
# if no file path is provided a new file will be created at the project's directory.

library(R6)
library(officer)
PPT <- R6Class(
    "PPT", 
    private = list(
        ..file_new = NULL         
        ..slide_new = NULL
    ), 
    active = list(
        file_new = function(value){
            if(missing(value)){
                private$..file_new
            } else {
                private$..file_new <- value
            }},
        slide_new = function(value){
            if(missing(value)){
                private$..slide_new
            } else {
                private$..slide_new <- value
            }})
)

# unfinished