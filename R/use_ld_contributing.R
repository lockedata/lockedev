#' @title Add CONTRIBUTING.md in .github
#' @param project_name Project name
#'
#' @export
use_ld_github <- function(project_name){
  if(fs::file_exists("DESCRIPTION")){
    suppressWarnings(
      use_contributing_template())
    usethis::use_template("CODE_OF_CONDUCT.md", 
                          save_as = "CODE_OF_CONDUCT.md")
    usethis::use_build_ignore(c(".github",
                                "CODE_OF_CONDUCT.md"))
    message(glue::glue("Paste this at the bottom of the README.md:\n",
                       "\n Wanna report a bug or suggest a feature? Great stuff! For more information on how to contribute check out [our contributing guide](.github/CONTRIBUTING.md). \n \n Please note that this R package is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this package project you agree to abide by its terms.
                     "))
  }else{
    suppressWarnings(
      use_notR_contributing_template())
    usethis::use_template("CODE_OF_CONDUCT.md", 
                          save_as = "CODE_OF_CONDUCT.md")
    message(glue::glue("Paste this at the bottom of the README.md:\n",
                       "\n Wanna report a bug or suggest a feature? Great stuff! For more information on how to contribute check out [our contributing guide](.github/CONTRIBUTING.md). \n \n Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project project you agree to abide by its terms.
                       "))
  }
}

# Use CONTRIBUTING template

use_contributing_template <- function(project_name){
  fs::dir_create(".github")
  usethis::use_template(template = "CONTRIBUTING.md",
                        save_as = file.path(".github", "CONTRIBUTING.md"),
                        package = "lockedev",
                        data = list(package = project_name))
  
}

use_notR_contributing_template <- function(project_name){
  fs::dir_create(".github")
  usethis::use_template(template = "CONTRIBUTING_notR.md",
                        save_as = file.path(".github", "CONTRIBUTING.md"),
                        package = "lockedev",
                        data = list(package = project_name))
  
}