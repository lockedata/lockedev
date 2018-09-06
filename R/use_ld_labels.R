#' Use LD official labels
#'
#' @details Get a token https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
#'  and save it via usethis::edit_r_environ()
#' @export
#'
use_ld_labels <- function(){
  
  labels <- c("bug :bug:" = "EAEF49",
              "documentation :page_with_curl:" = "23FDF2",
              "duplicate :dancers:" = "D4A484",
              "enhancement :sparkles:" = "2165B6",
              "good first issue :hatching_chick:" = "4d4d4d",
              "help wanted :raised_hand:" = "E8830C",
              "question :question:" = "798FE7",
              "wontfix :see_no_evil:" = "F0FA1E")
  usethis::use_github_labels(labels,
                             delete_default = TRUE)
}