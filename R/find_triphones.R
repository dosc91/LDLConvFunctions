#' find_triphones
#'
#' @description \code{find_triphones} finds all triphones contained in two C matrices, e.g. in pseudoword and real word cue matrices.
#' All triphones contained in both matrices as well as their column numbers are returned.
#'
#' @param pseudo_C_matrix A data frame, typically the output of \code{WpmWithLdl::make_cue_matrix}.
#' @param real_C_matrix A data frame, typically the output of \code{WpmWithLdl::make_cue_matrix}.
#'
#' @return A data frame containing:
#' \itemize{
#'   \item \code{V1} - Triphones found in both matrices.
#'   \item \code{V2.x} - Column numbers of triphones in \code{pseudo_C_matrix}
#'   \item \code{V2.y} - Column numbers of triphones in \code{real_C_matrix}
#' }
#'
#' @author D. Schmitz
#'
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#'
#' @export

find_triphones <- function (pseudo_C_matrix, real_C_matrix){
  real.triphones <- cbind(colnames(real_C_matrix$matrices$C), seq(1:length(colnames(real_C_matrix$matrices$C))))
  pseudo.triphones <- cbind(colnames(pseudo_C_matrix$matrices$C), seq(1:length(colnames(pseudo_C_matrix$matrices$C))))
  all.triphones <- merge(pseudo.triphones, real.triphones, by="V1")
}
