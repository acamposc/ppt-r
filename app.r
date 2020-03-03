# app.r
# order of code execution is controlled here

source("~/ppt-r/reqs/requirements.r")
source("~/ppt-r/fn/con.r")
source("~/ppt-r/fn/yaml.r")

# requirements needs no initialization
# initialize viewid.r
    vw = Con$new()
    con <- unlist(vw$con)
    view_id <- con[1]
    pptx_file <- con[2]

# initialize yaml.r
    outline = Appyaml$new()

source("~/ppt-r/fn/fields.r")
source("~/ppt-r/fn/values.r")
source("~/ppt-r/fn/analytics.r")

# initialize analytics.r
    analytics = Analytics$new()
    tbls <- analytics$query()
    print(tbls)
    
source("~/ppt-r/fn/charts.r")
source("~/ppt-r/fn/slides.r")