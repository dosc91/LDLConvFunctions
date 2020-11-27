#' Average Lexical Correlation - ALC
#'
#' @description \code{ALC} computes the mean correlation of a pseudoword's estimated semantic vector with each of the word's semantic vectors.
#' @param pseudo_S_matrix A data frame, typically computed by solving \code{(pseudo_S_matrix = pseudo_Cue_matrix * Hp)}, with \code{Hp}
#' being the transformation matrix for mapping real word cues onto real word semantics (as done to obtain \code{real_S_matrix}).
#' @param real_S_matrix A data frame, typically the output of \code{WpmWithLdl::make_S_matrix}.
#' @param pseudo_word_data The dataset with which \code{pseudo_S_matrix} was computed.
#' @return A data frame containing:
#' \itemize{
#'   \item \code{ALC} - The ALC value of a word.
#'   \item \code{Pseudoword} - The pertinent pseudoword as found in \code{pseudo_word_data}.
#'   \item \code{Base} - The pertinent base as found in \code{pseudo_word_data}.
#' }
#' @author D. Schmitz
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#' @references Chuang, Y-Y., Vollmer, M-l., Shafaei-Bajestan, E., Gahl, S., Hendrix, P., & Baayen, R. H. (2020). The processing of pseudoword form and meaning in production and comprehension: A computational modeling approach using Linear Discriminative Learning. Behavior Research Methods, 1-51.
ALC <- function (pseudo_S_matrix, real_S_matrix, pseudo_word_data)
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
  results <- data.frame(matrix(ncol = 1, nrow = 0))
  for (i in 1:length(row.names(pseudo_S_matrix)))
  {
    for (j in 1:length(row.names(real_S_matrix)))
    {
      results[i,j] <- cor(pseudo_S_matrix[i,], real_S_matrix[j,], method = "pearson")
    }
  }
  ALC <- rowMeans(results)
  Pseudoword <- pseudo_word_data$Word
  Base <- pseudo_word_data$Base
  ALCframe <- as.data.frame(cbind(ALC, Pseudoword, Base))
}
