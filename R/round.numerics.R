# x:  a vector.

# digits:  the number of digits to round to.

# If x is numeric, or complex, then it will be rounded to the specified number of digits.  Otherwise, the values of x will be returned untouched.

round.numerics <- function(x, digits = 0, ...){
  if(is.numeric(digits) == FALSE){
    digits <- 0
  }
  if(is.numeric(x) | is.complex(x)){
    x <- round(x = x, digits = floor(digits))
  }
  return(x)
}
