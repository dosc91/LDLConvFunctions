#' Mean Word Support - MWS
#'
#' @description \code{MWS} computes the mean word support of a word's predicted form. Note: MWS only takes into account the winning production form.
#' It basically takes \code{path_sum} and divides it by the number of paths.
#' @param prod_acc A list, typically the output of \code{WpmWithLdl::accuracy_production}.
#' @param prod_measures A data frame, typically the output of \code{WpmWithLdl::production_measures}.
#' @return A data frame containing:
#' \itemize{
#'   \item \code{MWS} - The mean word support.
#' }
#' @author D. Schmitz
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#' @references Stein, S., & Plag, I. (2021). Modeling affix durations with Linear Discriminative Learning. [Unpublished Manuscript].

#' @export

MWS <- function (prod_acc, prod_measures)
{
  MWSframe <- matrix(0, nrow = length(rownames(prod_measures)), ncol = 1)

  for (i in 1:length(rownames(prod_measures))) {
    MWSframe[i] <- prod_measures$path_sum[i] / length(combined.prod_acc[["full"]][[i]][["li"]][[1]])
  }
  colnames(MWSframe) <- c("MWS")
  return(MWSframe)
}
