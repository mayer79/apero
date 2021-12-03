#' Prints an Apero
#'
#' Print method for an object of class \code{apero}.
#'
#' @param x A on object of class \code{apero}.
#' @param ... Further arguments passed from other methods.
#' @return Invisibly, the input is returned.
#' @method print apero
#' @export
#' @examples
#' x <- apero()
#' x
print.apero <- function(x, ...) {
  cat("A whopping number of", nrow(x$guests),
      "guests are here. Nice apero so far!\n\n")
  invisible(x)
}
