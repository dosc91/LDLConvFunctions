# LDLConvFunctions

`LDLConvFunctions` offers functions

- to conveniently compute and extract several measures from WpmWithLdl objects
- to reorder C matrices when handling pseudowords in LDL

Check out the [vignette](http://htmlpreview.github.io/?https://github.com/dosc91/LDLConvFunctions/blob/main/vignettes/introduction.html) for more detailed information.

# How to Install

The preferred way to install this package is through devtools:

```r
devtools::install_github("dosc91/LDLConvFunctions", upgrade_dependencies = FALSE)
```

The `ALDC` function requires the [`stringdist`](https://cran.r-project.org/web/packages/stringdist/index.html) package to function. Thus, the [`stringdist`](https://cran.r-project.org/web/packages/stringdist/index.html) package is automatically installed unless it is installed already. </br>
Similary, the EDNN function requires the [`FNN`](https://cran.r-project.org/web/packages/FNN/index.html) package to function. Thus, this package is automatically installed unless it is installed already. 

In case this automatic installation does not work for whatever reason, please install the required packages manually:

```r
install.packages("stringdist")
install.packages("FNN")
```

# Overview

This is a full list of all functions currently contained in `LDLConvFunctions`

Functions to compute and extract measures:

- ALC - Average Lexical Correlation
- ALDC - Average Levenshtein Distance of Candidates
- DRC - Dual Route Consistency
- EDNN - Euclidian Distance from Nearest Neighbour
- NNC - Nearest Neighbour Correlation
- SCPP - Semantic Correlation of Predicted Production

Functions to reorder C matrices:

- find_triphones
- reorder_pseudo_C_matrix

Additionally, the package provides a small sample data set:

- LDLConvFunctions_data.RData

# References

Please see the references section of the [vignette](http://htmlpreview.github.io/?https://github.com/dosc91/LDLConvFunctions/blob/main/vignettes/introduction.html#references) for a list of references.
