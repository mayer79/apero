#' Counts Number of Clinks
#'
#' Counts the number of clinks during an apero.
#'
#' @param x An object of class \code{apero}.
#' @return The number of clinks.
#' @export
#' @examples
#' x <- apero()
#' clinks(x)
clinks <- function(x) {
  stopifnot(inherits(x, "apero"))
  n <- nrow(x$guests)
  n * (n - 1) / 2
}
