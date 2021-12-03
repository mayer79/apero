#' Summarizes an Apero
#'
#' Summary method for an object of class \code{apero}.
#'
#' @param x A on object of class \code{apero}.
#' @param ... Further arguments passed from other methods.
#' @return Invisibly, the number of clinks is returned.
#' @method summary apero
#' @export
#' @examples
#' x <- apero()
#' summary(x)
summary.apero <- function(x, ...) {
  n <- nrow(x$guests)
  clinks <- n * (n - 1) / 2
  print(x)
  cat("There will be", clinks, "clinks. Poor glasses...")
  invisible(clinks)
}
