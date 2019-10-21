#' Use LD official labels
#'
#' @details Get a token https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
#'  and save it via usethis::edit_r_environ()
#' @export
#'
use_ld_labels <- function(){
  
  repo <- usethis:::github_repo_spec()
  
  labels <- c("bug :bug:" = "EAEF49",
              "documentation :page_with_curl:" = "23FDF2",
              "duplicate :dancers:" = "D4A484",
              "enhancement :sparkles:" = "2165B6",
              "good first issue :hatching_chick:" = "4d4d4d",
              "help wanted :raised_hand:" = "E8830C",
              "question :question:" = "798FE7",
              "wontfix :see_no_evil:" = "F0FA1E")
  
  rename <- c("bug :bug:", "documentation :page_with_curl:", "duplicate :dancers:", 
              "enhancement :sparkles:", "good first issue :hatching_chick:", 
              "help wanted :raised_hand:", "question :question:", "wontfix :see_no_evil:"
  )
  names(rename) <- c("bug", "documentation", "duplicate", "enhancement", "good first issue", 
                     "help wanted", "question", "wontfix")
  
  usethis::use_github_labels(repo_spec = repo,
                             labels = names(labels),
                             rename = rename,
                             colours = labels,
                             delete_default = TRUE)
}