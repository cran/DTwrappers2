#' dt.character.coercion.culprits
#'
#' @description a wrapper function to determine if a character variable that might reasonably be reformatted as numeric


#' @param dt.name a character value specifying the name of a data.frame or data.table object.

#' @param threshold.for.numeric  a value between 0 and 1 specifying the maximum proportion of x that does not "look" numeric, e.g. "2.154" is a character value that can be converted to a numeric value.. If threshold.for.numeric = 0.1, then no more than 10 percent of the values in x can be values that do not "look" numeric.

#' @param the.variables a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).
#'
#'
#' @param the.filter a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.
#'
#' @param grouping.variables a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.

#' @param grouping.type a character value specifying whether the grouping should be sorted (keyby) or as is (by).  Defaults to keyby unless "by" is specified.
#'
#' @param add.function.name  a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.
#'
#' @param ... additional arguments to be passed
#' @return Returns a data table object resulting from the application of the 'character coercion culprits' analysis on the specified data frame or data table (dt).
#' This function identifies character variables within the specified columns (the.variables) of the data table 'dt.name' that could potentially be converted to numeric based on the specified 'threshold.for.numeric'.
#' It applies the given logical filter (if any) before the analysis and groups the results based on 'grouping.variables' and 'grouping.type' parameters.
#' If 'add.function.name' is TRUE, the name of the function is appended to the column names in the resultant table.
#' The output will contain columns corresponding to the analyzed variables, indicating the proportion of values in each that can potentially be converted to numeric, respecting the specified threshold.
#' @import DTwrappers
#' @import data.table
#'
#' @export



dt.character.coercion.culprits <- function(dt.name, threshold.for.numeric = 0.5, the.variables = ".", the.filter = NULL, grouping.variables = NULL, grouping.type = "keyby", add.function.name = FALSE, ...){
  ##require(DTwrappers)
  other.params <- sprintf("threshold.for.numeric = %s", threshold.for.numeric)

  return(dt.calculate(dt.name = dt.name, the.variables = the.variables, the.functions = "character.coercion.culprits", the.filter = the.filter, grouping.variables = grouping.variables, grouping.type = grouping.type, add.function.name = add.function.name, other.params = other.params, ...))
}
