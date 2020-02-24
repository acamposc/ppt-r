# parsing.r
# parses app.yaml before hitting ganalytics

# parses fields in app.yaml
# if none is provided then "dimensions" is set by default
# to get other fields create new objects with "Yamlparser" class

# https://campus.datacamp.com/courses/object-oriented-programming-with-s3-and-r6-in-r/using-r6?ex=8

library(purrr)
library(R6)
Yamlparser <- R6Class(
  "Yamlparser",
  private = list(
    ..field = 'dimensions'
  ),
  active = list(
    field = function(value){
      if(missing(value)){
        private$..field
        library(purrr)
        fn_dims <- function(x){
          require(magrittr)
          require(stringr)
          outline$appyaml[[x]] %>%
            magrittr::extract(c(private$..field)) %>%
            stringr::str_split(., pattern = ',') %>%
            unlist(outline$appyaml[[x]]) %>%
            stringr::str_trim(.)
          
          
        }
        dims <- map(1:length(outline$appyaml), fn_dims)
        
        
        
        
      } else {
        private$..field <- value
        
        library(purrr)
        fn_dims <- function(x){
          require(magrittr)
          require(stringr)
          outline$appyaml[[x]] %>%
            magrittr::extract(c(private$..field)) %>%
            stringr::str_split(., pattern = ',') %>%
            unlist(outline$appyaml[[x]]) %>%
            stringr::str_trim(.)
          
          
        }
        dims <- map(1:length(outline$appyaml), fn_dims)
        
        
        
      }}))
