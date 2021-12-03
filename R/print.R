#' Prints an Apero
#'
#' Print method for an object of class \code{apero}.
#'
#' @param x An object of class \code{apero}.
#' @param ... Further arguments passed from other methods.
#' @return Invisibly, the input is returned.
#' @method print apero
#' @export
#' @examples
#' x <- apero()
#' x
#'
#' x2 <- apero(width = 1, height = 1)
#' x2
print.apero <- function(x, ...) {
  n <- nrow(x$guests)

  if (n == 1L) {
    cat("Oh no, you are all alone! Next time, book a larger room.\n")
  } else {
    cat("A whopping number of", n, "guests are here. Nice apero so far!\n")
  }
  invisible(x)
}
