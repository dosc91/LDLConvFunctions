% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ALC.R
\name{ALC}
\alias{ALC}
\title{Average Lexical Correlation - ALC}
\usage{
ALC(pseudo_S_matrix, real_S_matrix, pseudo_word_data)
}
\arguments{
\item{pseudo_S_matrix}{A data frame, typically computed by solving \code{(pseudo_S_matrix = pseudo_Cue_matrix * Hp)}, with \code{Hp}
being the transformation matrix for mapping real word cues onto real word semantics (as done to obtain \code{real_S_matrix}).}

\item{real_S_matrix}{A data frame, typically the output of \code{WpmWithLdl::make_S_matrix}.}

\item{pseudo_word_data}{The dataset with which \code{pseudo_S_matrix} was computed.}
}
\value{
A data frame containing:
\itemize{
\item \code{ALC} - The ALC value of a word.
\item \code{Pseudoword} - The pertinent pseudoword as found in \code{pseudo_word_data}.
\item \code{Base} - The pertinent base as found in \code{pseudo_word_data}.
}
}
\description{
\code{ALC} computes the mean correlation of a pseudoword's estimated semantic vector with each of the word's semantic vectors.
}
\references{
Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.

Chuang, Y-Y., Vollmer, M-l., Shafaei-Bajestan, E., Gahl, S., Hendrix, P., & Baayen, R. H. (2020). The processing of pseudoword form and meaning in production and comprehension: A computational modeling approach using Linear Discriminative Learning. Behavior Research Methods, 1-51.
}
\author{
D. Schmitz
}
