d_colocontext("test-get_ld_colours")

test_that("get_ld_colours works", {
  df <- structure(list(colour_name = c("orange", "blue", "grey"), colour_hex = c("#E8830C", 
                                                                                 "#2165B6", "#4d4d4d")), row.names = c(NA, -3L), class = c("tbl_df", 
                                                                                                                                           "tbl", "data.frame"))
  expect_equal(get_ld_colours(),
               df)
})
