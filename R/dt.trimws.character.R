
#' dt.trimws.character
#'
#' @description wrapper function


#' @param dt.name a character value specifying the name of a data.frame or data.table object.

#' @param the.variables a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).

#' @param the.filter a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.

#' @param grouping.variables a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.

#' @param add.function.name a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.
#'
#' @param sortby.group a logical value to specify if the sorting functionality needs to be applied or not
#'
#' @param  ... additional arguments to be passed
#'
#' @param table.format a character vector specifying if table should be in a wide format or a tall format
#'
#' @param which both, left or right
#'
#' @param whitespace encoded whitespace
#'
#' @param convert.factor logical value specifying if variable needs to be converted to a factor before calculations
#'
#' @param return.as describes whether return should be result, code or mixture of both
#'
#' @param envir the environment in which the code would be evaluated; parent.frame() by default.
#' @return The function's output varies based on the 'return.as' parameter:
#' - If 'return.as' is "result", it returns a modified version of the input data frame or data table with specified variables having their leading, trailing, or both types of whitespace trimmed according to the 'which' parameter. This is performed after any set filtering and subgrouping, with options for trimming specified by 'whitespace' and 'convert.factor'.
#' - If 'return.as' is "code", it provides the R code or expressions designed to execute this whitespace trimming, allowing users to review or implement the modifications independently.
#' - If another value is specified for 'return.as', the output might include both the adjusted data and the corresponding R code, depending on the function’s configuration.
#'
#' This function is crucial for cleaning character data, ensuring consistency, and preparing data for analysis by removing unwanted whitespace from the specified variables.

#' @export

dt.trimws.character <- function(dt.name, the.variables = ".", the.filter = NULL,
                                grouping.variables = NULL, sortby.group = TRUE,
                                table.format = "wide", add.function.name = FALSE,
                                return.as = "result", envir = parent.frame(),
                                which = c("both", "left", "right"),
                                whitespace = "[ \t\r\n]",
                                convert.factor = FALSE, ...){

  value.which <- NULL
  if(is.character(which) && which[1] != "both"){
    value.which <- sprintf("which = c('%s')", paste(which))
  }

  value.whitespace <- NULL
  if(is.character(whitespace) && whitespace[1] != "[ \t\r\n]"){
    value.whitespace <- as.character(whitespace[1])
  }

  value.convert.factor <- NULL
  if(convert.factor == TRUE){
    value.convert.factor <- "convert.factor = TRUE"
  }

  other.params <- paste(value.which, value.whitespace, value.convert.factor, collapse = ", ")

  return(dt.calculate(dt.name = dt.name, the.variables = the.variables,
                      the.functions = "trimws.character", the.filter = the.filter,
                      grouping.variables = grouping.variables, sortby.group = sortby.group,
                      other.params = other.params, table.format = table.format,
                      add.function.name = add.function.name, return.as = return.as, envir = envir, ...))
}
