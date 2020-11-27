#' Average Levenshtein Distance of Candidates - ALDC
#'
#' @description \code{ALDC} computes the mean Levenshtein Distances of all candidate productions.
#' @param prod_acc A list, typically the output of \code{WpmWithLdl::accuracy_production}.
#' @param data The dataset with which \code{prod_acc} was computed
#' @return A data frame containing:
#' \itemize{
#'   \item \code{Word} - The pertinent word as found in \code{data}.
#'   \item \code{Base} - The pertinent base as found in \code{data}.
#'   \item \code{ALDC} - The ALDC of a word.
#' }
#' @author D. Schmitz
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#' @references Chuang, Y-Y., Vollmer, M-l., Shafaei-Bajestan, E., Gahl, S., Hendrix, P., & Baayen, R. H. (2020). The processing of pseudoword form and meaning in production and comprehension: A computational modeling approach using Linear Discriminative Learning. Behavior Research Methods, 1-51.
#' @references  Levenshtein, V. I. (1966). Binary codes capable of correcting deletions, insertions, and reversals. Soviet Physics Doklady. 10 (8), 707-710.
#' @references van der Loo M (2014). The stringdist package for approximate string matching. The R Journal, 6, 111-122.
ALDC <- function (prod_acc, data) {
  if (is.null(prod_acc)) {
    stop(call=F, geterrmessage = "prod_acc not found\n")
  }
  if (is.null(data)) {
    stop(call=F, geterrmessage = "data not found\n")
  }
  result <- vector("list",length(prod_acc[["full"]]))
  for (i in 1:length(prod_acc[["full"]]))
  {
    result[[i]] <- stringdist::stringdist(
      prod_acc[["full"]][[i]][["word"]],
      prod_acc[["full"]][[i]][["candidates"]],
      method = c("lv"),
      useBytes = FALSE,
      weight = c(d = 1, i = 1, s = 1, t = 1),
      q = 1,
      p = 0,
      bt = 0,
      nthread = getOption("sd_num_thread"))
  }
  Word = data$Word
  Base = data$Base
  ALDC <- data.frame(matrix(vector(), 0, 1, dimnames=list(c(), c("ALDC"))), stringsAsFactors=F)
  for (j in 1:length(prod_acc[["full"]]))
  {
    ALDC[j,1] <- mean(result[[j]])
  }
  ALDCframe <- as.data.frame(cbind(Word, Base, ALDC))
}
