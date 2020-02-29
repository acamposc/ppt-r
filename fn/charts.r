# mscharts
library(mschart)

fn_charts <- function(x){

    if (yaml_graph$field[[x]] == "ms_barchart"){
      print("a barchart")
      bar_chart <- ms_barchart(
        data = tbls[[x]],
        x = "medium",
        y = "goalCompletionsAll",
        group = "deviceCategory"
        )

    } else if (yaml_graph$field[[x]] == "ms_linechart"){
      print("a linechart") 
      line_chart <- ms_linechart(
        data = tbls[[x]],
        x = "date",
        y = "sessions",
        group = "deviceCategory"
      )
      line_chart <- chart_ax_x(
        line_chart, num_fmt = "d/m/yy"
      )

    } else if (yaml_graph$field[[x]] == "ms_scatterchart"){
      print("a scatterchart")
    } else if (yaml_graph$field[[x]] == "ms_areachart"){
      print("an areachart")
    } else {
      print("not a ms_chart")
    }
}
charts <- map(.x = 1:length(outline$appyaml), .f = fn_charts)