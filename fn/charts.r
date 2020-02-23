# https://adv-r.hadley.nz/r6.html
library(R6)


# guide
# using data at private level
Test <- R6Class("Test",
          private = list(
            ..data = mtcars
          ),
          public = list(
          fn = function(){
            print(private$..data$cyl)
            invisible(self)
          })
        )


# a <- Test$new()
# a$fn()
# end of guide

# guide # 2
# passing arguments
Test <- R6Class("Test",
          private = list(
            ..data = mtcars$vs
          ),
          public = list(
          fn = function(data){
            png(file = "~/ppt-r/plots/r6_plot_mtcars.png")
            plot(data)
            dev.off()
            invisible(self)
          })
        )


# a <- Test$new()
# a$fn(mtcars$hp)

# end of second guide


# example 3
Test <- R6Class("Test",
          private = list(
            ..data = mtcars
          ),
          public = list(
          fn = function(){
            require(ggplot2)
            png(file = "~/ppt-r/plots/r6_scatterplot_mtcars.png")
            g <- ggplot(private$..data, aes(private$..data$cyl, private$..data$mpg))
            print(g + geom_col())
            dev.off()
            invisible(self)
          })
        )


# a <- Test$new()
# a$fn()

# end of 3rd example

# working piece.
ChartSessionsLastWeek <- R6Class("ChartSessionsLastWeek",
    public = list(
        chart = function(x){
            require(ggplot2)
            png(file = paste0("~/ppt-r/plots/r6_geomcol_sessions_", Sys.Date(), ".png"))
            g <- ggplot(x, aes(date, sessions))
            print(g + geom_col())
            dev.off()
            invisible(self)
        }
    ))
