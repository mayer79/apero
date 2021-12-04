#' Summarizes an Apero
#'
#' Summary method for an object of class \code{apero}.
#'
#' @param x An object of class \code{apero}.
#' @param ... Further arguments passed from other methods.
#' @return Invisibly, the number of clinks is returned.
#' @method summary apero
#' @export
#' @examples
#' x <- apero()
#' summary(x)
#'
#' x2 <- apero(2, 1)
#' summary(x2)
summary.apero <- function(x, ...) {
  print(x)
  nclinks <- clinks(x)
  if (nclinks == 0L) {
    cat("There won't be any clink. Lucky glass...")
  } else {
    cat("There will be", nclinks, "clinks. Poor glasses...")
  }
  invisible(nclinks)
}
