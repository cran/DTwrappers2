# x:  a character vector of values that should be a numeric vector but was coerced to a character due to a small number of entries.

# threshold.for.numeric:  a value between 0 and 1 specifying the maximum proportion of x that does not "look" numeric, e.g. "2.154" is a character value that can be converted to a numeric value.. If threshold.for.numeric = 0.1, then no more than 10% of the values in x can be values that do not "look" numeric.

remove.erroneous.characters <- function(x, threshold.for.numeric = 0.8, variable.should.be = "numeric", value.for.missing = NULL, ...){
  w <- is.na(x)

  complex.variable <- (variable.should.be[1] == "complex")

  if(complex.variable){
    y <- suppressWarnings(as.complex(x))
    if(is.null(value.for.missing)){
      value.for.missing <- NA_complex_
    }
  } else {
    y <- suppressWarnings(as.numeric(x))
    if(is.null(value.for.missing)){
      value.for.missing <- NA_real_
    }
  }

  if(mean(!is.na(y[!w])) < threshold.for.numeric){
    return(x)
  }

  w2 <- which(is.na(y))
  the.indices <- w2[!(w2 %in% w)]
  y[the.indices] <- value.for.missing

  return(y)
}

