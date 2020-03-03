# analytics.r
# fetches data from google analytics
# http://code.markedmondson.me/googleAnalyticsR/articles/v4.html#filters
# http://code.markedmondson.me/googleAnalyticsR/articles/v4.html

# order: http://code.markedmondson.me/googleAnalyticsR/reference/order_type.html

library(tibble)
# service account authentication
# run once
library(googleAuthR)
gar_set_client(
    Sys.getenv("PPT_R_GOOGLE_OAUTH20_ACCOUNT_PATH"),
    scopes = "https://www.googleapis.com/auth/analytics.readonly"
)
library(googleAnalyticsR)
service_token <- gar_auth_service(json_file=Sys.getenv("PPT_R_GAR_CLIENT_JSON"))

# test: print(ga_account_list())
# service account authentication end


Analytics <- R6Class(
    "Analytics",
    private = list(
        ..query = NULL
    ),
    public = list(
        query = function(){

            fn_ga <- function(x){
                require(googleAnalyticsR)

                fn_delta_null <- function(){
                    delta <- NULL
                }

                fn_daterange_null <- function(){
                    daterange <- NULL
                }
                
                fn_ordertype <- function(){
                    require(stringr)
                    delta <- googleAnalyticsR::order_type(
                        stringr::str_sub(unlist(yaml_metrics$field[[x]])[1], 4),
                        yaml_sort$field[[x]],
                        c("DELTA")
                        )
                }

                fn_dateranges <- function(){
                    c(
                        yaml_datebeginprev$field[[x]],
                        yaml_dateendprev$field[[x]],
                        yaml_datebegin$field[[x]],
                        yaml_dateend$field[[x]]
                    )
                }

                #print(yaml_absolutechange$field[[x]])
                #print(yaml_sort$field[[x]])
                #print(yaml_datebegin$field[[x]])
                #print(yaml_dateend$field[[x]])
                #print(yaml_datebeginprev$field[[x]])
                #print(yaml_dateendprev$field[[x]])

                #set up date ranges
                if(
                    is.element("", yaml_datebeginprev$field[[x]]) &&
                    is.element("", yaml_dateendprev$field[[x]])
                ) {
                    daterange <- fn_daterange_null()
                    daterange <- c(
                        yaml_datebegin$field[[x]],
                        yaml_dateend$field[[x]]
                    )

                    delta <- fn_delta_null()

                } else if(
                    #set up order_type object aka absolute change
                    yaml_absolutechange$field[[x]] == TRUE
                    &&
                    is.element("ASCENDING", yaml_sort$field[[x]]) | is.element("DESCENDING", yaml_sort$field[[x]]) == TRUE
                    ) {
                        delta <- fn_ordertype()
                        #print(delta)
                        daterange <- fn_dateranges()
                        #print(daterange)

                        #print(is.element("ASCENDING", yaml_sort$field[[x]]) | is.element("DESCENDING", yaml_sort$field[[x]]))
                    } 
                    else {
                        print("no absolute change ordering")
                        delta <- fn_delta_null()
                        daterange <- c(
                            yaml_datebegin$field[[x]],
                            yaml_dateend$field[[x]]
                        )
                    }
                        
                        
                # google analytics api query
                tbl <- google_analytics(view_id, 
                    date_range = daterange,
                    dimensions = c(
                        unlist(yaml_dimension$field[[x]])
                    ),
                    metrics = c(
                        unlist(yaml_metrics$field[[x]])
                    ),
                    filtersExpression = yaml_filter_expr$field[[x]],
                    
                    if(is.null(delta)){
                        order = NULL
                    } else {
                        order = order_type("goalCompletionsAll","DESCENDING", "DELTA")
                    }
                )

            tbl <- as_tibble(tbl)

            }

            tbl <- map(1:length(outline$appyaml), fn_ga)

        }
    )
)
