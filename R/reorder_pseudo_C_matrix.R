#' reorder_pseudo_C_matrix
#'
#' @description \code{reorder_pseudo_C_matrix} reorders and extends a smaller C matrix according to the order and number of columns of a bigger C matrix.
#' Use \code{find_triphones} to provide information on column order.
#'
#' @param pseudo_C_matrix A data frame, typically the output of \code{WpmWithLdl::make_cue_matrix}.
#' @param real_C_matrix A data frame, typically the output of \code{WpmWithLdl::make_cue_matrix}.
#' @param found_triphones A data frame, typically the output of \code{find_triphones}.
#'
#' @return A cue matrix (C) similar to those found in the result of \code{WpmWithLdl::make_cue_matrix}.
#'
#' @author D. Schmitz
#'
#' @references Baayen, R. H., Chuang, Y. Y., and Blevins, J. P. (2018). Inflectional morphology with linear mappings. The Mental Lexicon, 13 (2), 232-270.
#'
#' @export

reorder_pseudo_C_matrix <- function (pseudo_C_matrix, real_C_matrix, found_triphones)
{
  pseudo.C.new <- matrix(0, nrow = length(rownames(pseudo_C_matrix$matrices$C)), ncol = length(colnames(real_C_matrix$matrices$C)))
  colnames(pseudo.C.new) <- colnames(real_C_matrix$matrices$C)

  for (i in 1:length(found_triphones$V1)) {
    pseudo.C.new[,as.numeric(found_triphones$V2.y[i])] <- pseudo_C_matrix$matrices$C[,as.numeric(found_triphones$V2.x[i])]
  }
  return(pseudo.C.new)
  }




