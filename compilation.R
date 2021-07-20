# Compilation

library(bookdown)
setwd("vignettes")                   # enter vignettes sub-folder
bookdown::render_book("index.Rmd")   # compile
setwd("..")                          # return to base directory
