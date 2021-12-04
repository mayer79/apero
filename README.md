
# apero

<!-- badges: start -->
<!-- badges: end -->

The "apero" package has three purposes:

1. Its "packaging.R" script explains how to build a simple package using "usethis" and "devtools".
2. It shows how to use S3 object oriented programming.
3. How many guests can you place in a room of given length and width, given that each person should be at least some distance (1.5 m, say) away from each other?

## Installation

You can install the released version of apero from github with:

``` r
library(devtools)
install_github("mayer79/apero", dependencies = TRUE)
```

## Example

``` r
library(apero)

x <- apero()

summary(x)

plot(x)
```

