## Internal Function

round.exactly.one.value <- function(x, digits){

  if(digits == 0){
    return(x[1])
  }
  if(digits > 0){
    nc <- max(0, nchar(x[2]), na.rm = TRUE)

    if(nc == 0){
      this.result <- sprintf("%s.%s", x[1], paste(rep.int(x = 0, times = digits), collapse = ""))
    }
    if(nc < digits & nc > 0){
      this.result <- sprintf("%s.%s%s", x[1], x[2], paste(rep.int(x = 0, times = digits - nc), collapse = ""))
    }
    if(nc >= digits){
      this.result <- sprintf("%s.%s", x[1], substring(text = x[2], first = 1, last = digits))
    }
  }
  return(this.result)
}

# x:  a numeric vector

# digits:  the number of digits to round to.  This number will be exact, in that there will be exactly this number of decimal places listed even if this includes lagging zeros.  For instance, setting digits = 5 for x = 2.54 would result in 2.54000

# decimal:  The character specifying the decimal, which splits between whole numbers and the fractional component.



round.exactly <- function(x, digits = 0, decimal = ".", ...){

  x.is.numeric <- is.numeric(x)
  digits <- floor(digits)

  if(x.is.numeric == TRUE){

    the.pieces <- strsplit(x = as.character(x), split = decimal, fixed = TRUE)

    rounded.values <- unlist(sapply(X = the.pieces, FUN = "round.exactly.one.value", digits = digits))

    return(rounded.values)
  }
  if(x.is.numeric == FALSE){
    return(x)
  }
}


