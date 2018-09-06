# lockedev

R Package helping to implement best practice over Locke Data’s packages suite.

## Installation

```r
devtools::install_github("lockedata/lockedev")
```

## Misc

``` r
lockedev::get_ld_colours()
#> # A tibble: 3 x 2
#>   colour_name colour_hex
#>   <chr>       <chr>     
#> 1 orange      #E8830C   
#> 2 blue        #2165B6   
#> 3 grey        #4d4d4d
```

## Best practice for Locke Data repos

### Recommended reading for new package developers

* [this blog post that includes links to beginner-friendly tutorials](https://masalmon.eu/2017/12/11/goodrpackages/)

* ["R packages" book by Hadley Wickham](http://r-pkgs.had.co.nz/) (free to read online)

* [rOpenSci guide](https://ropensci.github.io/dev_guide/) in particular Section 1 and Section 3.

### Locke Data specific guidance for repos

!!! Soon-ish the setup should be all automatic !!! (but you'll still need the guidance to LDify existing repos)

First, create an RStudio project associated with the folder. You can gitignore it if you prefer, in the case of the repo not being an R project.

* Add a minimal README using `usethis::use_readme_rmd()` or `usethis::use_readme_md()`.

* If the repo is an R project, even not a package, create a DESCRIPTION for it, using  `desc::desc` (more guidance to come).

* Run `lockedev::use_ld_github()` inside the RStudio Rproj. It recognizes whether the repo is R stuff by looking for a DESCRIPTION file. It adds a contributing guide, a code of conduct, and gives you text to add to the README.

* Use the [official set of issue labels](https://itsalocke.com/blog/harmonizing-and-emojifying-our-github-issue-trackers/). No helper function yet.

* Write a GitHub repo description (or ask someone with admin rights to do that for you!). Feel free to use emojis in the GitHub repo description. 

#### R packages only

* Use GitHub labels. "r", "r-package" and "rstats" on top of the ones relevant for the package topic. Here’s the [direct URL to all Locke Data packages](https://github.com/search?q=topic%3Ar-package+org%3Alockedata+fork%3Atrue).

* Locke Data should be added as author via `lockedev::add_ld_fnd()`.

* For packages, add a codemeta.json file via `codemetar::write_codemeta`.
