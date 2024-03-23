#' lower.quartile
#'
#' @description value that cuts off the first 25% of the data when it is sorted in ascending order.
#'
#' @param x a vector
#'
#' @param na.rm a logical value specifying whether missing values should be removed from the calculations specified by the.functions.
#'
#' @param ... additional arguments to be passed
#' @return Returns a numeric value representing the lower quartile (25th percentile) of the given vector 'x'.
#' The lower quartile is the value below which 25% of the data points in the sorted vector fall.
#' If 'na.rm' is TRUE, any missing values (NA) are removed before the calculation.
#' The function utilizes the 'quantile' function internally to compute this statistic, and any additional arguments provided (...) are passed along to this underlying function.
#' @export

# x:  a vector

# na.rm:  a logical value specifying whether missing values should be removed from the calculations specified by the.functions.

lower.quartile <- function(x, na.rm = TRUE, ...){
  return(as.numeric(quantile(x = x, probs = 0.25, na.rm = na.rm)))
}
