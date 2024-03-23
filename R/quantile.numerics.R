quantile.numerics <- function(x, probs, na.rm = TRUE){
  will.calculate.quantiles <- is.numeric(x) | is.complex(x)
  probs <- sort(unique(probs))
  if(will.calculate.quantiles == TRUE){
    the.quantiles <- quantile(x = x, probs = probs, na.rm = na.rm)
  }
  if(will.calculate.quantiles == FALSE){
    the.quantiles <- rep.int(x = NA_character_, times = length(probs))
  }
  return(the.quantiles)
}
