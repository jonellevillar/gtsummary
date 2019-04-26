
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![lifecycle](man/figures/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/ddsjoberg/gtsummary.svg?branch=master)](https://travis-ci.org/ddsjoberg/gtsummary)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/ddsjoberg/gtsummary?branch=master&svg=true)](https://ci.appveyor.com/project/ddsjoberg/gtsummary)
[![Coverage
status](https://codecov.io/gh/ddsjoberg/gtsummary/branch/master/graph/badge.svg)](https://codecov.io/github/ddsjoberg/gtsummary?branch=master)

## gtsummary

A collection of functions commonly used in the work of the
biostatisticians. The goal of gtsummary is to make reporting of tabular
analytic results simple, beautiful, and
reproducible.  
<!-- Update the list of contributors from the git shell `git shortlog -s -n` -->

## Installation

You can install the production version of gtsummary with:

``` r
install.packages("remotes")
remotes::install_github("ddsjoberg/gtsummary")
```

and the development version with:

``` r
remotes::install_github("ddsjoberg/gtsummary", ref = "dev")
```

## Examples

The vignettes/tutorials for the primary gtsummary functions have
detailed examples and can be found at
[danieldsjoberg.com/gtsummary](http://www.danieldsjoberg.com/gtsummary).
Each vignette is an Rmarkdown file (\*.Rmd) and a copy of the files can
be found here:
<https://github.com/ddsjoberg/gtsummary/tree/master/vignettes>.

### Summary Table

``` r
library(gtsummary)
#> Loading required package: gt
t1 <-
  trial %>%
  dplyr::select(trt, age, grade, response) %>%
  tbl_summary(by = "trt") %>% 
  add_comparison() 
```

![](man/figures/README-tbl_summary.png)

### Regression Models

``` r
mod1 = glm(response ~ trt + age + grade, trial, family = binomial(link = "logit"))
t2 <-
  tbl_regression(mod1,
                 exponentiate = TRUE)
```

![](man/figures/README-tbl_regression.png%20%7C%20width=35%)

Thank you to all contributors\!  
<!-- UPDATE THIS LIST! usethis::use_tidy_thanks() -->
[@ddsjoberg](https://github.com/ddsjoberg),
[@karissawhiting](https://github.com/karissawhiting), and
[@michaelcurry1123](https://github.com/michaelcurry1123)
