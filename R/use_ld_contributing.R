#' @title Add CONTRIBUTING.md in .github
#' @param package_name Package name
#'
#' @export
use_ld_github <- function(package_name){
  use_contributing_template(package_name = package_name)
  usethis::use_build_ignore(".github")
}

# Use CONTRIBUTING template

use_contributing_template <- function(package_name){
  fs::dir_create(".github")
  usethis::use_template(template = "CONTRIBUTING.md",
                        save_as = file.path(".github", "CONTRIBUTING.md"),
                        package = "lockedev",
                        data = list(package = package_name))
  
}