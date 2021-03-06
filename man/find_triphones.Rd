% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/find_triphones.R
\name{find_triphones}
\alias{find_triphones}
\title{find_triphones}
\usage{
find_triphones(pseudo_C_matrix, real_C_matrix)
}
\arguments{
\item{pseudo_C_matrix}{A data frame, typically the output of \code{WpmWithLdl::make_cue_matrix}.}

\item{real_C_matrix}{A data frame, typically the output of \code{WpmWithLdl::make_cue_matrix}.}
}
\value{
A data frame containing:
\itemize{
\item \code{V1} - Triphones found in both matrices.
\item \code{V2.x} - Column numbers of triphones in \code{pseudo_C_matrix}
\item \code{V2.y} - Column numbers of triphones in \code{real_C_matrix}
}
}
\description{
\code{find_triphones} finds all triphones contained in two C matrices, e.g. in pseudoword and real word cue matrices.
All triphones contained in both matrices as well as their column numbers are returned.
}
\references{
Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
}
\author{
D. Schmitz
}
