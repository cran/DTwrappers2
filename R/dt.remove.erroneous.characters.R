
#' dt.remove.erroneous.characters
#'
#' @description removes erroneous characters
#'
#' @param dt.name a character value specifying the name of a data.frame or data.table object.

#' @param threshold.for.numeric  a value between 0 and 1 specifying the maximum proportion of x that does not "look" numeric, e.g. "2.154" is a character value that can be converted to a numeric value.. If threshold.for.numeric = 0.1, then no more than 10 percent of the values in x can be values that do not "look" numeric.

#' @param the.variables  a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).

#' @param the.filter a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.
#'
#' @param variable.should.be a character vector specifying whether variable should be numeric or text or something else
#'
#' @param value.for.missing a character value, logical value, or expression stating the logical operations to be performed in stating the missing value
#'
#' @param envir the environment in which the code would be evaluated; parent.frame() by default.
#'
#' @param return.as describes whether return should be result, code or mixture of both
#'
#' @param  ... additional arguments to be passed
#' @return The output of the function is contingent upon the 'return.as' parameter:
#' - If 'return.as' is "result", it returns a modified version of the input data frame or data table where erroneous characters in the specified variables are removed based on the given threshold. The function ensures that only values fitting the specified 'variable.should.be' criteria are retained, converting or imputing others as necessary, guided by the 'threshold.for.numeric' and 'value.for.missing' parameters.
#' - If 'return.as' is "code", it provides the R code or expressions that would perform this character removal and data cleaning, allowing users to review or manually execute the modifications.
#' - If another option is specified for 'return.as', the output may include both the cleaned data and the corresponding R code, depending on the specifics of the function’s implementation.
#'
#' The function aims to sanitize data by eliminating or correcting values in specified variables that do not conform to the expected numeric or text formats, thereby enhancing data quality and consistency.

#' @export

dt.remove.erroneous.characters <- function(dt.name, threshold.for.numeric = 0.8,
                                           the.variables = ".", the.filter = NULL,
                                           variable.should.be = "numeric",
                                           value.for.missing = NULL, return.as = "result",
                                           envir = parent.frame(), ...){

  if(is.null(value.for.missing)){
    value.for.missing <- "NULL"
  }
  other.params <- sprintf("threshold.for.numeric = %s, variable.should.be = '%s', value.for.missing = %s",
                          threshold.for.numeric, variable.should.be, value.for.missing)

  return(dt.calculate(dt.name = dt.name, the.functions = "remove.erroneous.characters",
                      the.variables = the.variables, the.filter = the.filter,
                      grouping.variables = NULL, sortby.group = TRUE, other.params = other.params,
                      table.format = "wide", add.function.name = FALSE, individual.variables = TRUE,
                      output.as.table = TRUE, return.as = return.as, envir = envir))
}

