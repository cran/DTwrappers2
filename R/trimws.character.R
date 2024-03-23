trimws.character <- function(x, which = c("both", "left", "right"), whitespace = "[ \t\r\n]", convert.factor = FALSE){
  if(is.factor(x) & convert.factor == TRUE){
    x <- as.character(x)
  }
  if(is.character(x)){
    x <- trimws(x = x, which = which, whitespace = whitespace)
  }
  return(x)
}
