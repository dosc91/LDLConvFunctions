#' Dual Route Consistency - DCC
#'
#' @description \code{DCC} computes the correlation between the semantic vector estimated from the direct route
#' and that from the indirect route.
#' @param comprehension A list, typically computed by solving \code{WpmWithLdl::learn_comprehension}.
#' @param Shat_matrix_indirect A matrix, typically computed by solving \code{WpmWithLdl::learn_comprehension} with \code{indirectRoute = TRUE}.
#' @param data The dataset with which \code{comprehension} and \code{Shat_matrix_indirect} were computed.
#' @return A data frame containing:
#' \itemize{
#'   \item \code{DCC} - The DCC value of a word.
#'   \item \code{Word} - The pertinent word as found in \code{data}.
#'   \item \code{Base} - The pertinent base as found in \code{data}.
#' }
#' @author D. Schmitz
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#' @references Chuang, Y-Y., Vollmer, M-l., Shafaei-Bajestan, E., Gahl, S., Hendrix, P., & Baayen, R. H. (2020). The processing of pseudoword form and meaning in production and comprehension: A computational modeling approach using Linear Discriminative Learning. Behavior Research Methods, 1-51.
DCC <- function (comprehension, Shat_matrix_indirect, data)
{
  if (is.null(comprehension)) {
    stop(call=F, geterrmessage = "comprehension not found\n")
  }
  if (is.null(Shat_matrix_indirect)) {
    stop(call=F, geterrmessage = "Shat_matrix_indirect not found\n")
  }
  if (is.null(data)) {
    stop(call=F, geterrmessage = "data not found\n")
  }
  results <- data.frame(matrix(ncol = 1, nrow = 0))
  for (i in 1:length(row.names(Shat_matrix_indirect)))
  {
    results[i,1] <- cor(Shat_matrix_indirect[i,], comprehension$Shat[i,], method = "pearson")
  }
  DCC <- rowMeans(results)
  Word <- data$Word
  Base <- data$Base
  DCCframe <- as.data.frame(cbind(DCC, Word, Base))
}
