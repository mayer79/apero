#=============================================================================
# Guide to an R package
#=============================================================================

# WORKFLOW A: CREATE PACKAGE
# 1) In RStudio: File -> New Project -> New Directory -> New Project
#    Enter package name as project name and tick "create a git repository".
#    Use a local folder, not on a linked network drive.
# 2) Move this file ("packaging.R") to the new project folder.
# 3) Put R scripts in subfolder "R". Document user visible functions
#    with Roxygen. Other functions can be put without roxygen tags, e.g.,
#    into R/utils.R or below any of the documented functions.
# 4) Go through this script and modify it as desired.

# WORKFLOW B: UPDATE EXISTING PACKAGE
# 1) Modify package content and documentation.
# 2) Increase package number in "use_description" below.
# 3) Go through this script and carefully answer "no" if a "use_*" function
#    asks to overwrite the existing files. Don't skip these.

#=============================================================================
# Put together the package
#=============================================================================

library(usethis)

# Sketch of description file
use_description(
  fields = list(
    Title = "Apero",
    Version = "0.1.0",
    Description = "This package shows how to have apero during pandemics.",
    `Authors@R` = "person('Michael', 'Mayer', email = 'mayermichael79@gmail.com', role = c('aut', 'cre'))",
    Depends = "R (>= 3.1.0)",
    LazyData = NULL
  ),
  roxygen = TRUE
)

# Required external packages
use_package("ggplot2", type = "Imports")
use_package("emojifont", type = "Imports")

use_gpl_license(2)

# Your files that do not belong to the package itself
# (more are being added by "use_* function")
use_build_ignore(
  c("^packaging.R$", "[.]Rproj$", "^RPackage_en.pptx$"),
  escape = FALSE
)

# If your code uses the pipe operator %>%
# use_pipe()

# If your package contains data. Google how to document
# use_data()

# Add short docu in Markdown (without running R code)
use_readme_md()

# Optional: longer docu in RMarkdown (with running R code)
use_vignette("apero")

# If you want to add unit tests
use_testthat()
use_test("clinks")
# use_test("apero")
# use_test("methods")

# If this project is on github
# use_github_links()

# Describe changes made to the package (newest first)
use_news_md()

# If package should go to CRAN, message with check results etc.
use_cran_comments()

#=============================================================================
# Finish package building (can use fresh session)
#=============================================================================

library(devtools)

document()
test()
build_vignettes()
check(vignettes = FALSE)
build()
# build(binary = TRUE)
install()

# Run only if package is public(!) and should go to CRAN
if (FALSE) {
  check_win_devel()
  check_rhub()

  # Wait until above checks are passed without relevant notes/warnings
  # then submit to CRAN
  devtools::release()
}
