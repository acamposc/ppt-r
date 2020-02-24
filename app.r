# app.r
# order of code execution is controlled here

source("reqs/requirements.r")
source("fn/viewid.r")
source("fn/yaml.r")
source("fn/fields.r")
##source("fn/ganalytics.r")

# requirements needs no initialization
# initialize viewid.r
    vw = Viewidyaml$new()
    view_id <- unlist(vw$viewid)

# initialize yaml.r
    outline = Appyaml$new()

# initialize fields.r
# title
    yaml_title <- Yamlparser$new()
    yaml_title$field <- 'title'
    #str(yaml_title$field)
# dimensions
    yaml_dimension <- Yamlparser$new()
    #str(yaml_dimension$field)
# metrics
    yaml_metrics <- Yamlparser$new()
    yaml_metrics$field <- 'metrics'
    #str(yaml_metrics$field)
# filter-key
    yaml_filter_key <- Yamlparser$new()
    yaml_filter_key$field <- 'filter-key'
    #str(yaml_filter_key$field)
# filter-value
    yaml_filter_value <- Yamlparser$new()
    yaml_filter_value$field <- 'filter-value'
    #str(yaml_filter_value$field)
# date-begin
    yaml_datebegin <- Yamlparser$new()
    yaml_datebegin$field <- 'date-begin'
    #str(yaml_datebegin$field)
# date-end
    yaml_dateend <- Yamlparser$new()
    yaml_dateend$field <- 'date-end'
    #str(yaml_dateend$field)
# graph
    yaml_graph <- Yamlparser$new()
    yaml_graph$field <- 'graph'
    #str(yaml_graph$field)
# layout
    yaml_layout <- Yamlparser$new()
    yaml_layout$field <- 'layout'
    #str(yaml_layout$field)
# data-source
    yaml_datasource <- Yamlparser$new()
    yaml_datasource$field <- 'data-source'
    #str(yaml_datasource$field)



# initialize ganalytics.r
    print("---- googleanalytics ----")
    print("----            ----")
    
    fn_ganalytics <- function(x){
        require(ganalytics)
        require(magrittr)
        require(stringr)
            
        print("---- filters ----")
        key <- unlist(yaml_filter_key$field[[x]])
        value <- unlist(yaml_filter_value$field[[x]])
        print("---- unlisted filters ----")
        print(key)
        str(key)
        print(value)
        str(value)

        my_creds <- GoogleApiCreds(readline(prompt="Enter email: "), Sys.getenv("PPT_R_GOOGLE_OAUTH20_ACCOUNT_PATH"))
        myQuery <- GaQuery(view_id, creds = my_creds)

        StartDate(myQuery) <- yaml_datebegin$field[[x]]
        EndDate(myQuery) <- yaml_dateend$field[[x]]

        Metrics(myQuery) <- unlist(yaml_metrics$field[[x]])
        Dimensions(myQuery) <- unlist(yaml_dimension$field[[x]])

        #SortBy(myQuery) <- -yaml_metrics$field[[x]]

        # filter reference
        # https://github.com/jdeboer/ganalytics
        # https://developers.google.com/analytics/devguides/reporting/core/v3/reference#filterOperators

        # does not work
        # filterExpr <- Expr(~key == value)
        # in the meantime filters will be added manually
        #Segments(myQuery) <- Expr(~ "medium" == "organic")
        #TableFilter(myQuery) <- Expr(~ "medium" == "organic")
        Segments(myQuery) <- Expr(~ toString(key) == toString(value))


        data <- GetGaData(myQuery)
        


    }
    googleanalytics <- map(1, fn_ganalytics)
    print(googleanalytics)
