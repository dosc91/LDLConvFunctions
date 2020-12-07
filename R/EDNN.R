#' Euclidian Distance from Nearest Neighbour - EDNN
#'
#' @description \code{EDNN} extracts the Euclidian distance between a word's estimated semantic vector and its nearest neighbour.
#' @description \code{EDNN} extracts the Euclidian distance between a word's estimated semantic vector and its nearest neighbour.
#' @param comprehension A data frame, typically the output of \code{WpmWithLdl::learn_comprehension}.
#' @param data The dataset with which \code{comprehension} was computed
#' @return A data frame containing:
#' \itemize{
#'   \item \code{EDNN} - The EDNN value of a word.
#'   \item \code{Word} - The pertinent word as found in \code{data}.
#'   \item \code{Base} - The pertinent base as found in \code{data}.
#' }
#' @author D. Schmitz
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#' @references Beygelzimer, A., Kakadet, S., Langford, J., Arya, S., Mount, D., & Shengqiao, L. (2019). FNN: Fast Nearest Neighbor Search Algorithms and Applications. R package version 1.1.3.
#' @references Chuang, Y-Y., Vollmer, M-l., Shafaei-Bajestan, E., Gahl, S., Hendrix, P., & Baayen, R. H. (2020). The processing of pseudoword form and meaning in production and comprehension: A computational modeling approach using Linear Discriminative Learning. Behavior Research Methods, 1-51.

#' @export

EDNN <- function (comprehension, data) {
  if (is.null(comprehension)) {
    stop(call=F, geterrmessage = "comprehension not found\n")
  }
  if (is.null(data)) {
    stop(call=F, geterrmessage = "data not found\n")
  }
  euclidian <- get.knnx(comprehension$S, comprehension$Shat, k=1)
  EDNN <- as.data.frame(euclidian[["nn.dist"]])
  colnames(EDNN) <- c("EDNN")
  Word = data$Word
  Base = data$Base
  EDNNframe <- as.data.frame(cbind(Word, Base, EDNN))
}
