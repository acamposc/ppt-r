# app.r
# order of code execution is controlled here

source("reqs/requirements.r")
source("fn/con.r")
source("fn/yaml.r")

# requirements needs no initialization
# initialize viewid.r
    vw = Con$new()
    con <- unlist(vw$con)
    view_id <- con[1]
    pptx_file <- con[2]

# initialize yaml.r
    outline = Appyaml$new()

source("fn/fields.r")
source("fn/values.r")
source("fn/analytics.r")

# initialize analytics.r
    analytics = Analytics$new()
    tbls <- analytics$query()
    print(tbls)
    
source("fn/charts.r")
source("fn/slides.r")