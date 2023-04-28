# apero

<!-- badges: start -->

[![R-CMD-check](https://github.com/mayer79/apero/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mayer79/apero/actions)
[![Codecov test coverage](https://codecov.io/gh/mayer79/apero/branch/main/graph/badge.svg)](https://app.codecov.io/gh/mayer79/apero?branch=main)

<!-- badges: end -->

## Overview

The {apero} package has three purposes. The last one of course is purely recreational and not at all serious.

1. Its "packaging.R" script explains how to build a simple package using "usethis" and "devtools".
2. It shows how to use S3 object oriented programming.
3. How many guests can you place in a room of given length and width, given that each person should be at least some distance (1.5 m, say) away from each other?

## Installation

```r
library(devtools)
install_github("mayer79/apero", dependencies = TRUE)
```

## Usage

``` r
library(apero)

x <- apero()
summary(x)
plot(x)
```

