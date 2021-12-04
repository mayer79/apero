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
#' x2 <- apero(1, 1)
#' x2
print.apero <- function(x, ...) {
  n <- nrow(x$guests)

  cat("The apero takes place in a ", x$room_length, "m x ", x$room_width,
      "m room and the safety distance is ", x$min_distance, "m.\n", sep = "")
  if (n == 1L) {
    cat("Oh no, you are all alone - the room is simply too small!\n",
    "At least you are not at risk catching a virus...\n")
  } else {
    cat("A whopping", n, "guests are here (incl. you). Nice apero so far!\n")
  }
  invisible(x)
}
