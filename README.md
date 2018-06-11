
<!-- README.md is generated from README.Rmd. Please edit that file -->

# lockemetadata

Guidelines and metadata for all Locke Data packages

TODO

  - Create CONTRIBUTING.md using [this
    model](https://github.com/lockedata/datasauRus#contributing-to-the-package)

  - Create a set of issues labels. With emojis, and aligning the help
    wanted one with the one that GitHub recognizes and puts in people’
    feeds (this repo needs help on blabla issues) DONE

  - Use repostatus badges and CRAN badges (one? even more by repo) in
    all repos.

  - Add Locke Data as funder in DESCRIPTION for all packages.

  - Create a codemeta.json for each package, and merge them together
    here.

  - Add emojis and the fact that packages are packages in all repo
    descriptions. DONE

  - Add “r”, “rstats” and “r-package” as topics for all repo
    descriptions. DONE

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

| name            | created\_at         | updated\_at         | description                                                                                         | is\_fork | is\_archived | latest\_commit      | is\_pkg |
| :-------------- | :------------------ | :------------------ | :-------------------------------------------------------------------------------------------------- | :------- | :----------- | :------------------ | :------ |
| optiRum         | 2014-04-08 15:51:10 | 2018-06-11 08:59:07 | R ðŸ“¦ of useful helper functions from Optimum Credit :moneybag:                                    | FALSE    | FALSE        | 2018-05-10 05:53:15 | TRUE    |
| tfsR            | 2015-03-18 15:41:39 | 2018-06-11 08:58:36 | R ðŸ“¦ to Work with the TFS (git) source control system in R :seedling:                             | FALSE    | FALSE        | 2018-05-10 05:59:41 | TRUE    |
| mockaRoo        | 2016-02-29 16:25:22 | 2018-06-11 08:58:16 | R ðŸ“¦ to Generate mock data with the Mockaroo API :sparkles:                                       | FALSE    | FALSE        | 2018-05-10 06:02:39 | TRUE    |
| HIBPwned        | 2016-05-31 16:24:14 | 2018-06-11 08:57:45 | R ðŸ“¦ for using the HaveIBeenPwned.com API :scream:                                                | FALSE    | FALSE        | 2018-04-18 05:45:43 | TRUE    |
| pRojects        | 2017-03-13 14:03:11 | 2018-06-11 08:57:06 | R ðŸ“¦ for making projects for various R activities :nut\_and\_bolt:                                | FALSE    | FALSE        | 2018-05-10 06:08:05 | TRUE    |
| TextAnalysis    | 2017-03-28 14:33:08 | 2018-06-11 08:56:43 | R ðŸ“¦ for Locke Data text analysis courses :books: - and getting Monty Python scripts\! :laughing: | FALSE    | FALSE        | 2018-05-10 06:09:48 | TRUE    |
| PackageReviewR  | 2017-04-11 14:18:35 | 2018-06-11 09:00:20 | R :package: to review :mag: R :package:s                                                            | FALSE    | FALSE        | 2018-05-10 06:12:18 | TRUE    |
| datasauRus      | 2017-05-01 19:47:21 | 2018-06-11 08:55:34 | R ðŸ“¦ Containing the Datasaurus Dozen datasets :bar\_chart:                                        | FALSE    | FALSE        | 2018-05-02 07:42:26 | TRUE    |
| rightscale      | 2017-07-03 19:35:44 | 2018-06-11 08:54:57 | R :package: over the rightscale.com API :cloud:                                                     | FALSE    | FALSE        | 2018-05-10 06:13:55 | TRUE    |
| twitterbookdraw | 2018-02-01 11:47:52 | 2018-06-11 08:54:34 | R ðŸ“¦ for drawing a random :game\_die: Locke Data follower to win a book :book:                    | FALSE    | FALSE        | 2018-05-28 14:33:00 | TRUE    |
| locketweet      | 2018-02-21 11:08:25 | 2018-06-11 08:53:50 | R ðŸ“¦ to Help Automatic Tweeting :bird: for Locke Data                                             | FALSE    | FALSE        | 2018-06-11 07:58:40 | TRUE    |
| dummyimages     | 2018-04-06 08:36:52 | 2018-06-11 08:53:29 | R :package: to make placeholder images :construction:, using dummyimage.com                         | FALSE    | FALSE        | 2018-05-10 05:51:41 | TRUE    |
| presdown        | 2018-05-07 19:00:06 | 2018-06-11 08:51:48 | R :package: for making a directory :file\_folder: of presentations :speech\_balloon:                | FALSE    | FALSE        | 2018-05-08 09:23:54 | TRUE    |
