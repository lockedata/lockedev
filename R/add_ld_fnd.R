#' Add Locke Data as funder to DESCRIPTION
#'
#' @param path path to package
#'
#' @export
add_ld_fnd <- function(path = getwd()){
  descr <- desc::desc(file.path(path, "DESCRIPTION"))
  descr$add_author(given = "Locke Data",
                   role = "fnd",
                   comment = "https://itsalocke.com")
  descr$write("DESCRIPTION")
}