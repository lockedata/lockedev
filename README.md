# lockedev

[![Locke Data Slack](https://img.shields.io/badge/Slack-discuss-blue.svg?logo=slack&longCache=true&style=flat)](https://join.slack.com/t/lockedata/shared_invite/enQtMjkwNjY3ODkwMzg2LTI1OGU1NTM3ZGIyZGFiNTdlODI3MzU2N2ZlNDczMjM4M2U2OWVmNDMzZTQ1ZGNlZDQ3MGM2MGVjMjI2MWIyMjI)


R Package helping to implement best practice over Locke Data’s packages suite.

## Installation

```r
devtools::install_github("lockedata/lockedev")
```

## Other Locke Data package

For our `ggplot2` theme, our colours, refer to [`lockeutils`](https://github.com/lockedata/lockeutils).

## Best practice for Locke Data repos

### Recommended reading for new package developers

* [this blog post that includes links to beginner-friendly tutorials](https://masalmon.eu/2017/12/11/goodrpackages/)

* ["R packages" book by Hadley Wickham](http://r-pkgs.had.co.nz/) (free to read online)

* [rOpenSci guide](https://ropensci.github.io/dev_guide/) in particular Section 1 and Section 3.

### Locke Data specific guidance for repos

!!! Soon-ish the setup should be all automatic !!! (but you'll still need the guidance to LDify existing repos)

* First, create an RStudio project associated with the folder. You should gitignore in the case of the repo not being an R project. Run `usethis::use_build_ignore("projectname.Rproj")`.

* Add a minimal README using `usethis::use_readme_rmd()` or `usethis::use_readme_md()`.

* If the repo is an R project, even not a package, create a DESCRIPTION for it, using  `desc::desc` (more guidance to come).

* Run `lockedev::use_ld_github()` inside the RStudio Rproj. It recognizes whether the repo is R stuff by looking for a DESCRIPTION file. It adds a contributing guide, a code of conduct, and gives you text to add to the README.

* Use the [official set of issue labels](https://itsalocke.com/blog/harmonizing-and-emojifying-our-github-issue-trackers/). Get a token https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/ and save it via `usethis::edit_r_environ()`. Run `lockedev::use_ld_labels()`

* Write a GitHub repo description (or ask someone with admin rights to do that for you!). Feel free to use emojis in the GitHub repo description. 

* Add a Slack invite badge via `use_slack_invite()` so folks can join and discuss in our friendly social space.

#### R packages only

* Use GitHub labels. "r", "r-package" and "rstats" on top of the ones relevant for the package topic. Here’s the [direct URL to all Locke Data packages](https://github.com/search?q=topic%3Ar-package+org%3Alockedata+fork%3Atrue).

* Locke Data should be added as author via `lockedev::add_ld_fnd()`.

* For packages, add a codemeta.json file via `codemetar::write_codemeta`.

