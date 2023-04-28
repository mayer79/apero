#' Counts Number of Clinks
#'
#' Counts the number of glass clinks.
#'
#' @param object An object of class \code{apero} or a vector of length one with the
#' number of persons.
#' @param ... Arguments passed from or to other methods.
#' @return The number of clinks.
#' @export
#' @examples
#' x <- apero()
#' clinks(x)
clinks <- function(object, ...) {
  UseMethod("clinks")
}

#' @describeIn clinks Calculates the number of glass clinks between n (= object) persons.
#' @export
clinks.default <- function(object, ...) {
  stopifnot(length(object) == 1L, object >= 1L)
  object * (object - 1) / 2
}

#' @describeIn clinks Calculates the number of glass clinks of all persons of an apero.
#' @export
clinks.apero <- function(object, ...) {
  clinks(nrow(object$guests))
}
