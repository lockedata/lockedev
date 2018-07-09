repos <- ghrecipes::get_repos("lockedata")
repos <- dplyr::mutate(repos, 
                       name = stringr::str_remove(name,
                                                  "lockedata\\/"))

# archived
repos <- dplyr::filter(repos, !is_archived)

# are packages
repos$is_pkg <- purrr::map_lgl(repos$name,
                               ghrecipes::is_package_repo,
                               owner = "lockedata")

repos <- dplyr::filter(repos, is_pkg)

get_and_update_topic <- function(repo, new_topics, owner){
  message(repo)
  topics <- gh::gh("GET /repos/:owner/:repo/topics",
                   repo = repo, owner = owner,
                   .send_headers = c(Accept = "application/vnd.github.mercy-preview+json"))
  topics <- unlist(topics$names)
  all_topics <- sort(unique(c(new_topics, topics)))
  message(all_topics)
  if(length(all_topics) == 1){
    all_topics <- list(all_topics)
  }
  
  gh::gh("PUT /repos/:owner/:repo/topics",
         names = all_topics,
         repo = repo, owner = owner,
         .send_headers = c(Accept = "application/vnd.github.mercy-preview+json"))
  browseURL(glue::glue("https://github.com/{owner}/{repo}"))
  
}

purrr::walk(repos$name,
            get_and_update_topic,
            c("r", "rstats", "r-package"),
            owner = "lockedata")

