# LDLConvFunctions

R package offering functions to conveniently compute and extract several measures from WpmWithLdl objects.

Check out the [vignette](http://htmlpreview.github.io/?https://github.com/dosc91/LDLConvFunctions/blob/main/vignettes/introduction.html) to this package for more detailed information.

# How to Install

The prefered way to install this package is through devtools:

```r
devtools::install_github("dosc91/LDLConvFunctions", upgrade_dependencies = FALSE)
```

The `ALDC` function requires the [`stringdist`](https://cran.r-project.org/web/packages/stringdist/index.html) package to function. Thus, the [`stringdist`](https://cran.r-project.org/web/packages/stringdist/index.html) package is automatically installed unless it is installed already.

In case this automatic installation does not work for whatever reason, please install it manually:

```r
install.packages("stringdist")
```

# Overview

This is a full list of all functions currently contained in `LDLConvFunctions`:

- ALC - Average Lexical Correlation
- ALDC - Average Levenshtein Distance of Candidates
- DRC - Dual Route Consistency
- EDNN - Euclidian Distance from Nearest Neighbour
- NNC - Nearest Neighbour Correlation
- SCPP - Semantic Correlation of Predicted Production
