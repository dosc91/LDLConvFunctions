#' LDLConvFunction - Data Set
#'
#' Small data set containing English real words as well as pseudowords (from Schmitz et al., 2020). Columns contain information on wordforms, bases, affixes, and transcription.
#'
#' @docType data
#'
#' @usage data(grav)
#'
#' @format An object of class \code{"cross"}; see \code{\link[qtl]{read.cross}}.
#'
#' @keywords datasets
#'
#' @author D. Schmitz
#'
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#' @references Chuang, Y-Y., Vollmer, M-l., Shafaei-Bajestan, E., Gahl, S., Hendrix, P., & Baayen, R. H. (2020). The processing of pseudoword form and meaning in production and comprehension: A computational modeling approach using Linear Discriminative Learning. Behavior Research Methods, 1-51.

#' @export

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
