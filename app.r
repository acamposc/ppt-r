# app.r
# order of code execution is controlled here

source("reqs/requirements.r")
source("fn/viewid.r")
source("fn/yaml.r")
source("fn/fields.r")
#source("fn/ganalytics.r")

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
    str(yaml_title$field)
# dimensions
    yaml_dimension <- Yamlparser$new()
    str(yaml_dimension$field)
# metrics
    yaml_metrics <- Yamlparser$new()
    yaml_metrics$field <- 'metrics'
    str(yaml_metrics$field)
# filter
    yaml_filter <- Yamlparser$new()
    yaml_filter$field <- 'filter'
    str(yaml_filter$field)
# date-begin
    yaml_datebegin <- Yamlparser$new()
    yaml_datebegin$field <- 'date-begin'
    str(yaml_datebegin$field)
# date-end
    yaml_dateend <- Yamlparser$new()
    yaml_dateend$field <- 'date-end'
    str(yaml_dateend$field)
# graph
    yaml_graph <- Yamlparser$new()
    yaml_graph$field <- 'graph'
    str(yaml_graph$field)
# layout
    yaml_layout <- Yamlparser$new()
    yaml_layout$field <- 'layout'
    str(yaml_layout$field)
# data-source
    yaml_datasource <- Yamlparser$new()
    yaml_datasource$field <- 'data-source'
    str(yaml_datasource$field)

#source("fn/charts.r")
#bar <- ChartSessionsLastWeek$new()
#bar$chart(pptr_sessions)
