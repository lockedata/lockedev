repos <- ghrecipes::get_repos("lockedata")
repos <- dplyr::mutate(repos, 
                       name = stringr::str_remove(name,
                                                  "lockedata\\/"))
# are packages
repos$is_pkg <- purrr::map_lgl(repos$name,
                               ghrecipes::is_package_repo,
                               owner = "lockedata")

repos <- dplyr::filter(repos, is_pkg, !is_fork)

# issues with labels
get_issues <- function(repo){
  issues <- gh::gh("GET /repos/:owner/:repo/issues",
                   owner = "lockedata", repo = repo)
  if(issues!=""){
    
    tibble::tibble(number = purrr::map_int(issues, "number"),
                   labels = purrr::map(issues, "labels"), 
                   repo = repo)
  }else{
    NULL
  }
}
issues <- purrr::map_df(repos$name, get_issues)

# old labels
get_labels <- function(repo){
  message(repo)
  current_labels <- gh::gh("/repos/:owner/:repo/labels", 
                           owner = "lockedata",
                           repo = repo)
  tibble::tibble(name = purrr::map_chr(current_labels, "name"),
                 color = purrr::map_chr(current_labels, "color"),
                 id = purrr::map_chr(current_labels, "id"),
                 repo = repo)
}
labels <- purrr::map_df(repos$name, get_labels)

# dput(sort(unique(labels$name)))
new_labels <- tibble::tibble(old = c("bug", "duplicate", "enhancement", "first-timers-only", "good first issue", 
                                     "help wanted", "invalid", "question", "up-for-grabs", "wontfix"
),
                             new = c("bug :bug:",
                                     "duplicate :dancers:",
                                     "enhancement :sparkles:",
                                     "good first issue :hatching_chick:",
                                     "good first issue :hatching_chick:",
                                     "help wanted :raised_hand:",
                                     "wontfix :see_no_evil:",
                                     "question :question:",
                                     "help wanted :raised_hand:",
                                     "wontfix :see_no_evil:"))
new_labels <- rbind(new_labels, 
                    tibble::tibble(new = "documentation :page_with_curl:",
                                   old = ""))
# random colors
# not colorblind-friendly 
set.seed(42)
unique_new <- unique(new_labels[,c("new")])
unique_new$color <- charlatan::ch_hex_color(n = nrow(unique_new))
unique_new$color <- gsub("#", "", unique_new$color)

delete_old_labels <- function(repo, labels){
  purrr::walk(labels, delete_old_label, 
              repo = repo)
}

delete_old_label <- function(name, repo){
  gh::gh("DELETE /repos/:owner/:repo/labels/:name",
         owner = "lockedata", repo = repo,
         name = name)
}

post_new_labels <- function(repo, unique_new){
  purrr::walk2(unique_new$new, unique_new$color,
               post_new_label, repo = repo)
}

post_new_label <- function(name, color, repo){
  gh::gh("POST /repos/:owner/:repo/labels",
         owner = "lockedata", repo = repo,
         name = name, color = color)
}

update_issue_labels <- function(issue_number, issue_labels, repo,
                                new_labels){
  message(issue_number)
  labels <- purrr::map_chr(issue_labels, "name")
  updated_labels <- new_labels$new[new_labels$old %in% labels]
  
  purrr::walk(updated_labels, function(x){
    gh::gh("POST /repos/:owner/:repo/issues/:number/labels",
           owner = "lockedata", repo = repo,
           number = issue_number, x,
           .send_headers = c(Accept = "application/vnd.github.symmetra-preview+json"))
    
  })
  }


update_labels <- function(repo, issues, labels, unique_new, new_labels){

  # delete old labels
  repo_labels <- labels[labels$repo == repo,]
  delete_old_labels(repo, unique(repo_labels$name))
  # post new ones
  post_new_labels(repo, unique_new)
  # post new ones for issues
  repo_issues <- issues[issues$repo == repo &
                          lengths(issues$labels) != 0,]
  if(nrow(repo_issues) > 0){
    purrr::walk2(repo_issues$number, repo_issues$labels,
                update_issue_labels,
                repo = repo, 
                new_labels = new_labels)
  }
  
}
update_labels("HIBPwned", issues, labels, unique_new, new_labels)
update_labels("optiRum", issues, labels, unique_new, new_labels)
update_labels("tfsR", issues, labels, unique_new, new_labels)
update_labels("pRojects", issues, labels, unique_new, new_labels)
update_labels("PackageReviewR", issues, labels, unique_new, new_labels)
update_labels("datasauRus", issues, labels, unique_new, new_labels)
update_labels("PackageReviewR", issues, labels, unique_new, new_labels)
