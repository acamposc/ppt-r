# app.r
# order of code execution is controlled here

source("reqs/requirements.r")
source("fn/viewid.r")
source("fn/yaml.r")

# requirements needs no initialization
# initialize viewid.r
    vw = Viewidyaml$new()
    view_id <- unlist(vw$viewid)

# initialize yaml.r
    outline = Appyaml$new()

source("fn/fields.r")
source("fn/values.r")
source("fn/analytics.r")

# initialize analytics.r
    analytics = Analytics$new()
    print(analytics$query())