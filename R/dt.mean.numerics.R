
#' dt.mean.numerics
#'
#' @description wrapper function that computes the mean value for each selected quantitative variable in each group after applying a filter.

#' @param dt.name a character value specifying the name of a data.frame or data.table object.

#' @param the.variables a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).

#' @param the.filter a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.

#' @param grouping.variables  a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.

#'
#' @param na.rm a logical value specifying whether missing values should be removed from the calculations specified by the.functions.
#'
#' @param envir the environment in which the code would be evaluated; parent.frame() by default.

#' @param add.function.name a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.

#' @param non.numeric.value if "missing", returns NA for variables that are not numeric, integer, logical, or complex.  Otherwise returns first entry of the vector.
#'
#' @param sortby.group a logical value to specify if the sorting functionality needs to be applied or not
#'
#' @param table.format a character vector specifying if table should be in a wide format or a tall format
#'
#' @param return.as describes whether return should be result, code or mixture of both
#'
#' @param  ... additional arguments to be passed
#' @return The function returns an object determined by the 'return.as' parameter:
#' - If 'return.as' is "result", it outputs a modified version of the input data frame or data table, presenting the mean values for each selected numeric variable, adjusted for any applied filters and groupings. The results are formatted according to the user's preference (wide or tall format) and can incorporate sorting by groups if specified.
#' - If 'return.as' is "code", it provides the R code or expressions that would result in the calculation of these means, which allows the user to review or manually execute the code.
#' - If 'return.as' includes other values, the output might combine both the calculated means and the R code, depending on the function's implementation.
#'
#' The function efficiently aggregates the mean values, considering the handling of missing values as specified by 'na.rm' and adjusting for non-numeric values based on 'non.numeric.value'. This enables a detailed analysis of the dataset's quantitative aspects, especially after subgrouping and applying specific filters.

#' @export

dt.mean.numerics <- function(dt.name, the.variables = ".", the.filter = NULL,
                             grouping.variables = NULL, sortby.group = TRUE,
                             table.format = "wide", add.function.name = FALSE,
                             return.as = "result", envir = parent.frame(),
                             na.rm = TRUE, non.numeric.value = "missing", ...){

  other.params <- sprintf("na.rm = %s, non.numeric.value = '%s'", na.rm, non.numeric.value)

  return(dt.calculate(dt.name = dt.name, the.variables = the.variables,
                      the.functions = "mean.numerics", the.filter = the.filter,
                      grouping.variables = grouping.variables, sortby.group = sortby.group,
                      other.params = other.params, table.format = table.format,
                      add.function.name = add.function.name, return.as = return.as,
                      envir = envir, ...))
}

