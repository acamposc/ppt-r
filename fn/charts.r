library(R6)

# not working yet
Chart <- R6Class("Chart",
    public = list(
        data = NULL,
        dimension = NULL,
        initialize = function(data = NA){
            self$data <- data
            #self$dimension <- dimension
            self$create_chart()
        },
        set_data = function(val){
            self$data <- val
        },
        create_chart = function(){
            require(ggplot2)
            png(file = "~/ppt-r/plots/r6_geomcol_sessions.png")
            g <- ggplot(self$data, aes(self$data$date, self$data$sessions))
            g + geom_col()
            print("chart created in /plots")
        }
    )

)
