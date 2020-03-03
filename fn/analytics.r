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
    public = list (
        query = function(){
            fn_ga <- function(x){
                fn_dateranges <- function(){  
                        c(
                            unlist(yaml_daterange$field[[x]])
                        )
                }
                fn_metrics <- function(){
                    c(
                        unlist(yaml_metrics$field[[x]])
                    )
                }
                fn_dimensions <- function(){
                    c(
                        unlist(yaml_dimension$field[[x]])
                    )
                }
                fn_filter_ga3 <- function(){
                    yaml_filter_expr$field[[x]]
                }
                fn_ordertype <- function(){
                    require(stringr)
                    require(googleAnalyticsR)

                    field <- stringr::str_sub(
                        unlist(yaml_metrics$field[[x]])[1], 4
                    )

                    return(
                        order_type(
                            field,
                            yaml_sort$field[[x]],
                            "DELTA"
                            )
                    )
                }
                fn_daterange_null <- function(){
                    daterange <- NULL
                }

                fn_delta_null <- function(){
                    delta <- NULL
                }

                #set absolute ordering
                if(
                    length(fn_dateranges()) < 3
                ) {
                    delta <- fn_delta_null()

                } else if(
                    #set up order_type object aka absolute change
                    yaml_absolutechange$field[[x]] == TRUE
                    &&
                    is.element("ASCENDING", yaml_sort$field[[x]]) | is.element("DESCENDING", yaml_sort$field[[x]]) == TRUE
                    ) {
                        delta <- fn_ordertype()
                        print("------- absolute change incoming ------")
                    } 
                    else {
                        delta <- fn_delta_null()
                    }
                #google_analytics api query

                tbl <- google_analytics(
                    viewId = view_id,
                    date_range = fn_dateranges(),
                    metrics = fn_metrics(),
                    dimensions = fn_dimensions(),
                    segments = NULL,
                    if(is.null(delta)){
                        order = NULL
                    } else {
                        order = fn_ordertype()
                    }
                )

                tbl <- as_tibble(tbl)

            }

            tbl <- map(1:length(outline$appyaml), fn_ga)
        }
    )
)
