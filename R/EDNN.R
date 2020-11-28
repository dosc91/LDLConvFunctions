#' Euclidian Distance from Nearest Neighbour - EDNN
#'
#' @description \code{EDNN} extracts the Euclidian distance between a word's estimated semantic vector and its nearest neighbour.
#' This measure is similar to \code{l2norm} which is part of the \code{WpmWithLdl::comprehension_measures} function.
#' @param comp_measures A data frame, typically the output of \code{WpmWithLdl::comprehension_measures}.
#' @param data The dataset with which \code{comp_measures} was computed
#' @return A data frame containing:
#' \itemize{
#'   \item \code{EDNN} - The EDNN value of a word.
#'   \item \code{Word} - The pertinent word as found in \code{data}.
#'   \item \code{Base} - The pertinent base as found in \code{data}.
#' }
#' @author D. Schmitz
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#' @references Chuang, Y-Y., Vollmer, M-l., Shafaei-Bajestan, E., Gahl, S., Hendrix, P., & Baayen, R. H. (2020). The processing of pseudoword form and meaning in production and comprehension: A computational modeling approach using Linear Discriminative Learning. Behavior Research Methods, 1-51.

#' @export

EDNN <- function (comp_measures, data) {
  if (is.null(comp_measures)) {
    stop(call=F, geterrmessage = "comp_measures not found\n")
  }
  if (is.null(data)) {
    stop(call=F, geterrmessage = "data not found\n")
  }
  EDNN = comp_measures$l2norm
  Word = data$Word
  Base = data$Base
  EDNNframe <- as.data.frame(cbind(Word, Base, EDNN))
}
