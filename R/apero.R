#' Creates Pandemic Apero
#'
#' This function creates an apero in a room of given size.
#' Guests stick to a minimum distance of each other in order to stay safe.
#'
#' @param room_length Length of room in meter.
#' @param room_width Width of room in meter.
#' @param min_distance Minimum distance in meter guests should have from each other.
#' @param margin How close to the walls do guests stand (in meter)?
#' @return An object of type 'apero' with the following elements:
#' \itemize{
#'   \item \code{room_length}: User input.
#'   \item \code{room_width}: User input.
#'   \item \code{min_distance}: User input.
#'   \item \code{margin}: User input.
#'   \item \code{guests}: \code{data.frame} with x and y coordinates of guests (incl. you).
#' }
#' @export
#' @examples
#' x <- apero()
#' x
#'
#' x2 <- apero(1, 1)
#' plot(x2)
#' @seealso \code{\link{plot.apero}}, \code{\link{summary.apero}}.
apero <- function(room_length = 6, room_width = 4,
                  min_distance = 1.5, margin = 0.3) {
  stopifnot(
    "room_length must be positive" = room_length > 0,
    "room_width must be positive" = room_width > 0,
    "margin can't be negative" = margin >= 0,
    "margin can't be larger than half of the room height or width" =
      margin < min(room_length, room_width) / 2
  )

  x <- seq(-room_length / 2 + margin, room_length / 2 - margin, by = min_distance)
  y <- seq(-room_width  / 2 + margin, room_width  / 2 - margin, by = min_distance)

  shift_right <- (room_length / 2 - margin - max(x)) / 2
  shift_up <- (room_width / 2 - margin - max(y)) / 2

  out <- list(
    room_length = room_length,
    room_width = room_width,
    min_distance = min_distance,
    margin = margin,
    guests = expand.grid(x = x + shift_right, y = y + shift_up)
  )
  class(out) <- "apero"
  out
}
