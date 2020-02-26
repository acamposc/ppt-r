# values.r
# sets values to query

# initialize fields.r
# title
    yaml_title = Yamlparser$new()
    yaml_title$field <- 'title'
    #str(yaml_title$field)
# dimensions
    yaml_dimension = Yamlparser$new()
    #str(yaml_dimension$field)
# metrics
    yaml_metrics = Yamlparser$new()
    yaml_metrics$field <- 'metrics'
    #str(yaml_metrics$field)
# filtersExpression
    yaml_filter_expr = Yamlparser$new()
    yaml_filter_expr$field <- 'filtersExpression'
    #str(yaml_filter_key$field)
# date-begin
    yaml_datebegin = Yamlparser$new()
    yaml_datebegin$field <- 'date-begin'
    #str(yaml_datebegin$field)
# date-end
    yaml_dateend = Yamlparser$new()
    yaml_dateend$field <- 'date-end'
    #str(yaml_dateend$field)
# graph
    yaml_graph = Yamlparser$new()
    yaml_graph$field <- 'graph'
    #str(yaml_graph$field)
# layout
    yaml_layout = Yamlparser$new()
    yaml_layout$field <- 'layout'
    #str(yaml_layout$field)
# data-source
    yaml_datasource = Yamlparser$new()
    yaml_datasource$field <- 'data-source'
    #str(yaml_datasource$field)