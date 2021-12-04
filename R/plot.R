#' Plots an Apero
#'
#' Plot method for an object of class \code{apero}.
#'
#' @import ggplot2
#' @importFrom emojifont emoji load.emojifont
#' @param x An object of class \code{apero}.
#' @param emo An emoji, e.g., "beer", "drink", "syringe", "wine_glass". Try emojifont::search_emoji("glass", approximate = TRUE) etc.
#' @param size Size of emoji.
#' @param color Color of emoji.
#' @param ... Further arguments passed to \code{geom_text()}.
#' @return A "ggplot" object.
#' @method plot apero
#' @export
#' @examples
#' \dontrun{
#' x <- apero()
#' x
#' plot(x)
#' plot(x, emo = "syringe", color = "red")
#'
#' x2 <- apero(2, 1)
#' plot(x2)
#' }
plot.apero <- function(x, emo = "beer", size = 8, color = "orange", ...) {
  load.emojifont()
  xmin <- xmax <- ymin <- ymax <- y <- NULL
  ggplot() +
    geom_rect(
      aes(xmin = xmin, xmax = xmax, ymin = ymin, ymax = ymax),
      data = data.frame(
        xmin = -x$room_length/2, xmax = x$room_length/2,
        ymin = -x$room_width/2,  ymax = x$room_width/2
      ),
      fill = "grey95"
    ) +
    geom_text(aes(x = x, y = y), x$guests,
              label = emoji(emo), size = size,
              family="EmojiOne",
              color = color, ...) +
    scale_y_continuous(expand = c(0, 0)) +
    scale_x_continuous(expand = c(0, 0)) +
    theme_minimal() +
    coord_equal() +
    labs(
      title = paste(
        "Apero with", nrow(x$guests),
        "guests (incl. you) and a safety distance of",
        x$min_distance, "m"
      ),
      x = paste0("Length of the room: ", x$room_length, "m"),
      y = paste0("Width of the room: ", x$room_width, "m"),
    ) +
    theme(
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank()
    )
}
