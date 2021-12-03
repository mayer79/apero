#' Creates Pandemic Apero
#'
#' This function creates an apero in a room of given size. Guests stick to a minimum distance of each other.
#'
#' @param width Width of room.
#' @param height Height of room.
#' @param min_distance Minimum distance guests should have from each other.
#' @param margin How close to the walls do guests stand?
#' @return An object of type 'apero' with the following elements:
#' \itemize{
#'   \item \code{width}: User input.
#'   \item \code{height}: User input.
#'   \item \code{min_distance}: User input.
#'   \item \code{margin}: User input.
#'   \item \code{guests}: \code{data.frame} with x and y coordinates of guests.
#' }
#' @export
#' @examples
#' an_apero <- apero()
#' an_apero
#' @seealso \code{\link{plot.apero}}, \code{\link{summary.apero}}.
apero <- function(width = 6, height = 4, min_distance = 1.5, margin = 0.3) {
  stopifnot(
    "height must be positive" = height > 0,
    "width must be positive" = width > 0,
    "margin can't be negative" = margin >= 0,
    "margin can't be larger than height or width" = margin < min(height, width)
  )

  x <- seq(-width / 2 + margin, width / 2 - margin, by = min_distance)
  y <- seq(-height / 2 + margin, height / 2 - margin, by = min_distance)

  shift_right <- (width / 2 - margin - max(x)) / 2
  shift_up <- (height / 2 - margin - max(y)) / 2

  out <- list(
    width = width,
    height = height,
    min_distance = min_distance,
    margin = margin,
    guests = expand.grid(x = x + shift_right, y = y + shift_up)
  )
  class(out) <- "apero"
  out
}
