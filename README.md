
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lockemetadata

Guidelines and metadata for all Locke Data packages

TODO

  - Create CONTRIBUTING.md using [this
    model](https://github.com/lockedata/datasauRus#contributing-to-the-package)

  - Create a set of issues labels. With emojis, and aligning the help
    wanted one with the one that GitHub recognizes and puts in people’
    feeds (this repo needs help on blabla issues)

  - Use repostatus badges and CRAN badges (one? even more by repo) in
    all repos.

  - Add Locke Data as funder in DESCRIPTION for all packages.

  - Create a codemeta.json for each package, and merge them together
    here.

## Find packages

``` r

repos <- ghrecipes::get_repos("lockedata")
repos <- dplyr::mutate(repos, 
                       name = stringr::str_remove(name,
"lockedata\\/"))
# are packages
repos$is_pkg <- purrr::map_lgl(repos$name,
                               ghrecipes::is_package_repo,
                               owner = "lockedata")

repos <- dplyr::filter(repos, is_pkg, !is_fork)
knitr::kable(repos)
```

| name           | created\_at         | updated\_at         | description                                                                                | is\_fork | is\_archived | latest\_commit      | is\_pkg |
| :------------- | :------------------ | :------------------ | :----------------------------------------------------------------------------------------- | :------- | :----------- | :------------------ | :------ |
| optiRum        | 2014-04-08 15:51:10 | 2018-05-08 09:35:11 | A useful package of helper functions from Optimum Credit                                   | FALSE    | FALSE        | 2017-08-04 18:31:06 | TRUE    |
| tfsR           | 2015-03-18 15:41:39 | 2018-05-08 09:33:52 | Work with the TFS (git) source control system in R                                         | FALSE    | FALSE        | 2017-08-21 17:35:18 | TRUE    |
| mockaRoo       | 2016-02-29 16:25:22 | 2018-05-08 09:34:24 | Generate mock data with the Mockaroo API                                                   | FALSE    | FALSE        | 2016-03-25 10:12:43 | TRUE    |
| HIBPwned       | 2016-05-31 16:24:14 | 2018-05-07 19:36:44 | An R package for using the HaveIBeenPwned.com API                                          | FALSE    | FALSE        | 2018-04-18 05:45:43 | TRUE    |
| pRojects       | 2017-03-13 14:03:11 | 2018-04-26 06:51:53 | R package for making projects for various R activities                                     | FALSE    | FALSE        | 2017-09-23 16:04:37 | TRUE    |
| TextAnalysis   | 2017-03-28 14:33:08 | 2018-05-02 00:08:03 | A helper package for Locke Data text analysis courses - and getting Monty Python scripts\! | FALSE    | FALSE        | 2017-04-06 10:33:09 | TRUE    |
| PackageReviewR | 2017-04-11 14:18:35 | 2018-04-06 08:48:12 | Review R packages                                                                          | FALSE    | FALSE        | 2018-04-06 08:48:04 | TRUE    |
| datasauRus     | 2017-05-01 19:47:21 | 2018-05-10 05:39:13 | The Datasaurus Dozen datasets                                                              | FALSE    | FALSE        | 2018-05-02 07:42:26 | TRUE    |
| rightscale     | 2017-07-03 19:35:44 | 2017-07-03 19:39:48 | :package: over the rightscale.com API                                                      | FALSE    | FALSE        | 2017-07-04 09:59:46 | TRUE    |
| locketweet     | 2018-02-21 11:08:25 | 2018-05-08 12:25:03 | Helps Automatic Tweeting for Locke Data                                                    | FALSE    | FALSE        | 2018-05-08 12:24:28 | TRUE    |
| dummyimages    | 2018-04-06 08:36:52 | 2018-04-06 08:37:07 | :package: to make placeholder images, using dummyimage.com                                 | FALSE    | FALSE        | 2018-04-06 08:35:37 | TRUE    |
| presdown       | 2018-05-07 19:00:06 | 2018-05-09 08:38:58 | An R :package: for making a directory of presentations :speech\_balloon:                   | FALSE    | FALSE        | 2018-05-08 09:23:54 | TRUE    |
