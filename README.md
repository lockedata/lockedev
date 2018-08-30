# lockedev

R Package helping to implement best practice over Locke Data’s packages suite.

## Installation

```r
devtools::install_github("lockedata/lockedev")
```

## Best practice for Locke Data packages

### Recommended reading for new developers

* [this blog post that includes links to beginner-friendly tutorials](https://masalmon.eu/2017/12/11/goodrpackages/)

* ["R packages" book by Hadley Wickham](http://r-pkgs.had.co.nz/) (free to read online)

* [rOpenSci guide](https://ropensci.github.io/dev_guide/) in particular Section 1 and Section 3.

### Locke Data specific guidance

* COC `lockedev::use_ld_github()`.

* Locke Data should be added as author via `lockedev::add_ld_fnd()`.

* Use the [official set of issue labels](https://itsalocke.com/blog/harmonizing-and-emojifying-our-github-issue-trackers/). No helper function yet.

* Add a codemeta.json file via `codemetar::write_codemeta`.

* Use GitHub labels. "r", "r-package" and "rstats" on top of the ones relevant for the package topic. Here’s the [direct URL to all Locke Data packages](https://github.com/search?q=topic%3Ar-package+org%3Alockedata+fork%3Atrue).

* Feel free to use emojis in the GitHub repo description. Do not forget to write such a repo description.