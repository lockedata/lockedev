#' Get the badge with the Slack invite
#'
#' @export
#'
use_slack_invite <- function(){
  usethis::use_badge(badge_name = "Locke Data Slack",
                     src = "https://img.shields.io/badge/Slack-discuss-blue.svg?logo=slack&longCache=true&style=flat",
                     href = "https://join.slack.com/t/lockedata/shared_invite/enQtMjkwNjY3ODkwMzg2LTI1OGU1NTM3ZGIyZGFiNTdlODI3MzU2N2ZlNDczMjM4M2U2OWVmNDMzZTQ1ZGNlZDQ3MGM2MGVjMjI2MWIyMjI")
}