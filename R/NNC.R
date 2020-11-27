#' Nearest Neighbour Correlation - NNC
#'
#' @description \code{NNC} computes the maximum of the correlations between a pseudoword's
#' estimated semantic vector and words' semantic vectors.
#' @param pseudo_S_matrix A data frame, typically computed by solving \code{(pseudo_S_matrix = pseudo_Cue_matrix * Hp)}, with \code{Hp}
#' being the transformation matrix for mapping real word cues onto real word semantics (as done to obtain \code{real_S_matrix}).
#' @param real_S_matrix A data frame, typically the output of \code{WpmWithLdl::make_S_matrix}.
#' @param pseudo_word_data The dataset with which \code{pseudo_S_matrix} was computed.
#' @param real_word_data The dataset with which \code{real_S_matrix} was computed.
#' @return A data frame containing:
#' \itemize{
#'   \item \code{NNC} - The NNC value of a word, i.e. the maximum correlation between a pseudoword's estimated semantic vector and a word's semantic vector.
#'   \item \code{Vectors} - The number of the real word as found in \code{real_word_data}.
#'   \item \code{Base} - The pertinent pseudoword's base as found in \code{pseudo_word_data}.
#'   \item \code{Pseudoword} - The pertinent pseudoword as found in \code{pseudo_word_data}.
#'   \item \code{Word} - The pertinent real word as found in \code{real_word_data}.
#' }
#' @author D. Schmitz
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#' @references Chuang, Y-Y., Vollmer, M-l., Shafaei-Bajestan, E., Gahl, S., Hendrix, P., & Baayen, R. H. (2020). The processing of pseudoword form and meaning in production and comprehension: A computational modeling approach using Linear Discriminative Learning. Behavior Research Methods, 1-51.
NNC <- function (pseudo_S_matrix, real_S_matrix, pseudo_word_data, real_word_data)
{
  if (is.null(pseudo_S_matrix)) {
    stop(call=F, geterrmessage = "pseudo_S_matrix not found\n")
  }
  if (is.null(real_S_matrix)) {
    stop(call=F, geterrmessage = "real_S_matrix not found\n")
  }
  if (is.null(pseudo_word_data)) {
    stop(call=F, geterrmessage = "pseudo_word_data not found\n")
  }
  if (is.null(real_word_data)) {
    stop(call=F, geterrmessage = "real_word_data not found\n")
  }
  results <- data.frame(matrix(ncol = 1, nrow = 0))
  x <- colnames(results[1])
  names(results)[names(results) == x] <- "V1"
  for (i in 1:nrow(pseudo_S_matrix))
  {
    for (j in 1:nrow(real_S_matrix))
    {
      results[i,j] <- cor(pseudo_S_matrix[i,], real_S_matrix[j,], method = "pearson")
    }
  }
  NNC <- apply(results, 1, max)
  vectors_wV <- colnames(results)[apply(results,1,which.max)]
  vectors <- as.numeric(gsub('V', '', vectors_wV))
  Base <- pseudo_word_data$Base
  Pseudoword <- pseudo_word_data$Word
  Word <- real_word_data[vectors,1]
  NNCframe <- as.data.frame(cbind(NNC, vectors, Base, Pseudoword, Word))
}
