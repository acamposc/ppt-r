# slides.r
# object Slides creates slides 
# slides attributes comes from app.yaml fields
# main attributes: layout, title, graph
# file path must be written in con.yaml
# https://davidgohel.github.io/officer/articles/offcran/powerpoint.html

library(officer)
library(magrittr)
library(mschart)

ppt <- officer::read_pptx(path = pptx_file)
lyt <- officer::layout_summary(ppt)
lyt <- tibble::as_tibble(lyt)

fn_ppt <- function(x){

    ppt <- ppt %>% 
        officer::add_slide(., layout = yaml_layout$field[[x]], master = "Tema de Office") %>%
        officer::ph_with(., value = x, location = ph_location_type(type = "title")) %>%
        officer::ph_with(., value = charts[[x]], location = ph_location_type(type = "body"))
}

ppt <- map(.x = 1:length(outline$appyaml), .f = fn_ppt)

print(x = ppt, target = "~/ppt-r/output/sample.pptx")