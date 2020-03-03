# mscharts
# charts ref: https://ardata-fr.github.io/mschart/reference/mschart.html
# themes ref: https://ardata-fr.github.io/mschart/reference/set_theme.html
# set chart reF: https://ardata-fr.github.io/mschart/reference/chart_settings.html
# details ref: https://ardata-fr.github.io/mschart/articles/details.html
# fp_text ref: https://www.rdocumentation.org/packages/officer/versions/0.3.6/topics/fp_text
# fp_border ref: https://www.rdocumentation.org/packages/officer/versions/0.3.6/topics/fp_border


# theme must be customized on every new account.
fn_theme <- function(){
  require(mschart)
  mschart_theme(
    axis_title_x = fp_text(
      bold = TRUE,
      font.size = 16,
      color = "#000000", #  (e.g. "#000000" or "black")
      font.family = "Montserrat",
      vertical.align = "baseline" #'baseline' or 'subscript' or 'superscript'
    ),
    axis_title_y = fp_text(
      bold = TRUE,
      font.size = 16,
      color = "black", #  (e.g. "#000000" or "black")
      font.family = "Montserrat",
      vertical.align = "baseline" #'baseline' or 'subscript' or 'superscript'
    ),
    main_title = fp_text(
      bold = TRUE,
      font.size = 20,
      color = "red", #  (e.g. "#000000" or "black")
      font.family = "Montserrat",
      vertical.align = "baseline" #'baseline' or 'subscript' or 'superscript'
    ),
    legend_text = fp_text(
      bold = FALSE,
      font.size = 14,
      color = "black", #  (e.g. "#000000" or "black")
      font.family = "Montserrat"
    ),
    grid_major_line_x = fp_border(
      color = "#99999999", #  (e.g. "#000000" or "black")
      style = "dashed", # "none" or "solid" or "dotted" or "dashed"
      width = 0
    ),
    grid_major_line_y = fp_border(
      color = "#99999999", #  (e.g. "#000000" or "black")
      style = "dashed", # "none" or "solid" or "dotted" or "dashed"
      width = 0
    ),
    grid_minor_line_x = fp_border(
      width = 0
    ),
    grid_minor_line_y = fp_border(
      width = 0
    ),
    str_fmt = "General",
    date_fmt = "yyyy/mm/dd",
    double_fmt = "#,##0.00",
    integer_fmt = "0",
    legend_position = "b"  # 'b', 'tr', 'l', 'r', 't', 'n' (for 'none')
  )


}



fn_charts <- function(x){
    require(mschart)

    if (yaml_graph$field[[x]] == "ms_barchart"){
      print("a barchart")
      bar_chart <- ms_barchart(
        data = tbls[[x]],
        x = stringr::str_sub(yaml_dimension$field[[x]], 4)[1],
        y = stringr::str_sub(yaml_metrics$field[[x]], 4)[1],
        #group = stringr::str_sub(yaml_dimension$field[[x]], 4)[2]
        if(
          is.na(stringr::str_sub(yaml_dimension$field[[x]], 4)[2])
        ) {
          group = NULL
        } else {
          group = stringr::str_sub(yaml_dimension$field[[x]], 4)[2]
        }
        )
      bar_chart <- chart_settings(
        x = bar_chart, 
        grouping = "clustered"
      )
      bar_chart <- set_theme(
        x = bar_chart,
        value = fn_theme()
      )

    } else if (yaml_graph$field[[x]] == "ms_linechart"){
      print("a linechart") 
      line_chart <- ms_linechart(
        data = tbls[[x]],
        x = stringr::str_sub(yaml_dimension$field[[x]], 4)[1],
        y = stringr::str_sub(yaml_metrics$field[[x]], 4[1]),
        #group = stringr::str_sub(yaml_dimension$field[[x]], 4)[2]
        if(
          is.na(stringr::str_sub(yaml_dimension$field[[x]], 4)[2])
        ) {
          group = NULL
        } else {
          group = stringr::str_sub(yaml_dimension$field[[x]], 4)[2]
        }
      )
      line_chart <- chart_ax_x(
        line_chart, num_fmt = "yyyy-mm-dd"
      )
      line_chart <- set_theme(
        x = line_chart,
        value = fn_theme()
      )

    } else if (yaml_graph$field[[x]] == "ms_scatterchart"){
      print("a scatterchart")
      scatter_chart <- ms_scatterchart(
        data = tbls[[x]],
        x = stringr::str_sub(yaml_metrics$field[[x]], 4)[1],
        y = stringr::str_sub(yaml_metrics$field[[x]], 4)[2],
        #group = stringr::str_sub(yaml_dimension$field[[x]], 4)[1]
        if(
          is.na(stringr::str_sub(yaml_dimension$field[[x]], 4)[2])
        ) {
          group = NULL
        } else {
          group = stringr::str_sub(yaml_dimension$field[[x]], 4)[2]
        }
      )
      scatter_chart  <- set_theme(
        x = scatter_chart,
        value = fn_theme()
      )
    } else if (yaml_graph$field[[x]] == "ms_areachart"){
      print("an areachart")
    } else {
      print("not a ms_chart")
    }
}
charts <- map(.x = 1:length(outline$appyaml), .f = fn_charts)
