repos <- ghrecipes::get_repos("lockedata")
repos <- dplyr::mutate(repos, 
                       name = stringr::str_remove(name,
                                                  "lockedata\\/"))
# are packages
repos$is_pkg <- purrr::map_lgl(repos$name,
                               ghrecipes::is_package_repo,
                               owner = "lockedata")

repos <- dplyr::filter(repos, is_pkg, !is_fork)

# Blue - 33 101 182 - 2165B6
# Orange - 232 131 12 - E8830C
# Grey - 77 77 77 - 4d4d4d

brand_labels <- function(repo){
  message(repo)
  # blue for enhancement
  gh::gh("PATCH /repos/:owner/:repo/labels/:name",
         repo = repo, owner = "lockedata",
           name = "enhancement :sparkles:",
         color = "2165B6",
         .send_headers = c(Accept = "application/vnd.github.symmetra-preview+json"))
  
  # orange for help wanted
  gh::gh("PATCH /repos/:owner/:repo/labels/:name",
         repo = repo, owner = "lockedata",
         name = "help wanted :raised_hand:",
         color = "E8830C",
         .send_headers = c(Accept = "application/vnd.github.symmetra-preview+json"))
  
  # grey for good first issue
  gh::gh("PATCH /repos/:owner/:repo/labels/:name",
         repo = repo, owner = "lockedata",
         name = "good first issue :hatching_chick:",
         color = "4d4d4d",
         .send_headers = c(Accept = "application/vnd.github.symmetra-preview+json"))
  
}

purrr::walk(repos$name, brand_labels)
