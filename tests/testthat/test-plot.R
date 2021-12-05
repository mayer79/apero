test_that("basic usage returns a ggplot object", {
  expect_true(inherits(plot(apero()), "ggplot"))
})
