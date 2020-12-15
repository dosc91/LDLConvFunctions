#' Semantic Correlation of Predicted Production - SCPP
#'
#' @description \code{SCPP} extracts the maximum correlation between a word's predicted semantic vector and any of the semantic vectors of its candidate forms. This measure is similar to \code{correlations} which is part of the \code{WpmWithLdl::production_measures} function.
#' @param prod_measures A data frame, typically the output of \code{WpmWithLdl::production_measures}.
#' @param data The dataset with which \code{comp_measures} was computed
#' @return A data frame containing:
#' \itemize{
#'   \item \code{SCPP} - The SCPP value of a word.
#'   \item \code{Word} - The pertinent word as found in \code{data}.
#'   \item \code{Base} - The pertinent base as found in \code{data}.
#' }
#' @author D. Schmitz
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#' @references Chuang, Y-Y., Vollmer, M-l., Shafaei-Bajestan, E., Gahl, S., Hendrix, P., & Baayen, R. H. (2020). The processing of pseudoword form and meaning in production and comprehension: A computational modeling approach using Linear Discriminative Learning. Behavior Research Methods, 1-51.

#' @export

SCPP <- function (prod_measures, data) {
  if (is.null(prod_measures)) {
    stop(call=F, geterrmessage = "prod_measures not found\n")
  }
  if (is.null(data)) {
    stop(call=F, geterrmessage = "data not found\n")
  }
  SCPP = prod_measures$correlations
  Word = data$Word
  Base = data$Base
  SCPPframe <- as.data.frame(cbind(Word, Base, SCPP))
}
