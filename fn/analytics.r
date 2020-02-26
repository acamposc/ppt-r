# analytics.r
# fetches data from google analytics
# http://code.markedmondson.me/googleAnalyticsR/articles/v4.html#filters
# http://code.markedmondson.me/googleAnalyticsR/articles/v4.html


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

                google_analytics(view_id, 
                    date_range = c(
                        yaml_datebegin$field[[x]], 
                        yaml_dateend$field[[x]]
                        ),
                    dimensions = c(
                        unlist(yaml_dimension$field[[x]])
                    ),
                    metrics = c(
                        unlist(yaml_metrics$field[[x]])
                    ),
                    filtersExpression = yaml_filter_expr$field[[x]]
            )

            }

            tbl <- map(1:length(outline$appyaml), fn_ga)

        }
    )
)
