#=============================================================================
# Guide to an R package
#=============================================================================

# WORKFLOW A: CREATE PACKAGE
# 1) In RStudio: File -> New Project -> New Directory -> R Package
#    Enter package name (e.g., apero) and tick "create a git repository".
# 2) Move "packaging.R" to the new project.
# 3) Put each user visible function into subfolder "R" as "[functionname].R"
#    Document them using Roxygen tags. Other functions can be put undocumented
#    into R/utils.R or below any of the documented functions.
# 4) Go through this script and modify it as desired.

# WORKFLOW B: UPDATE EXISTING PACKAGE
# 1) Modify package content and documentation.
# 2) Increase package number in "use_description" below.
# 3) Go through this script and carefully answer "no" if a "use_*" function
#    asks to overwrite the existing files. Or just skip that function call.

#=============================================================================
# Put together the package
#=============================================================================

library(usethis)

# Sketch of description file
use_description(
  fields = list(
    Title = "Apero",    # Change
    Version = "0.1.0",  # Increase when updating
    Date = Sys.Date(),
    Description = "This package shows how to have apero during pandemics.",
    `Authors@R` = "person('Michael', 'Mayer', email = 'mayermichael79@gmail.com', role = c('aut', 'cre'))",
    Depends = "R (>= 3.1.0)",
    Maintainer = "Michael Mayer <mayermichael79@gmail.com>",
    LazyData = NULL),    # change to TRUE if there is data in your package
  roxygen = TRUE)

use_gpl_license(2)
# use_github_links() # use this if this project is on github

# Your files that do not belong to the package itself (others are added by "use_* function")
use_build_ignore(c("packaging.R"))

# Required external packages
use_package("ggplot2")
use_package("emojifont")

# If your code uses the pipe operator %>%
# use_pipe()

# If your package contains data. Google how to document
# use_data()

# Add short docu in Markdown (without running R code)
use_readme_md()

# Longer docu in RMarkdown (with running R code). Often quite similar to readme.
# use_vignette("apero")            # Change name

# If you want to add unit tests
# use_testthat()
# use_test("apero")               # Ideally one "use_test" per file in folder "R"
# ...

# On top of NEWS.md, describe changes made to the package
use_news_md()

# To finish this part: Open DESCRIPTION. Does it make sense?


#=============================================================================
# Finish package building
#=============================================================================

library(devtools)

document()
# test()
# build_vignettes()
check(vignettes = FALSE)
build()
build(binary = TRUE)
install()

# Run only if package is public(!) and should go to CRAN
if (FALSE) {
  use_cran_comments()                # Write something to CRAN, including what type checks were done.
  check_win_devel()
  check_rhub()

  # Wait until above checks are passed without relevant notes/warnings
  # then submit to CRAN
  devtools::release()
}
