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
# date-range
    yaml_daterange = Yamlparser$new()
    yaml_daterange$field <- 'date-range'
    #str(yaml_daterange$field)
# sort
    yaml_sort = Yamlparser$new()
    yaml_sort$field <- 'sort'
    #str(yaml_sort$field)
# absolute-change
    yaml_absolutechange = Yamlparser$new()
    yaml_absolutechange$field <- 'absolute-change'
    #str(yaml_absolutechange$field)
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
