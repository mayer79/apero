#' Plots an Apero
#'
#' Plot method for an object of class \code{apero}.
#'
#' @importFrom graphics plot, rect, text
#' @importFrom emojifont emoji
#' @param x A on object of class \code{apero}.
#' @param emo An emoji, e.g., "beer", "drink", "syringe", "wine_glass". Try emojifont::search_emoji("glass", approximate = TRUE)) etc.
#' @param cex Size of emoji.
#' @param col Color of emoji.
#' @param ... Further arguments passed to \code{text()}.
#' @return NULL.
#' @method plot apero
#' @export
#' @examples
#' x <- apero()
#' plot(x)
plot.apero <- function(x, emo = "beer", cex = 1.5, col = "orange", ...) {
  plot(
    c(-x$width/2, x$width/2), c(-x$height/2, x$height/2),
    type = "n", axes = FALSE, ann = FALSE
  )
  rect(-x$width/2, -x$height/2, x$width/2, x$height/2)
  text(x$guests$x, x$guests$y, labels = emoji(emo), cex = cex, col = col, ...)
}

