#' dt.sd.numerics
#'
#' @description wrapper function that computes the standard deviation for each selected quantitative variable in each group after applying a filter.

#' @param dt.name a character value specifying the name of a data.frame or data.table object.

#' @param the.variables a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).

#' @param the.filter  a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.

#' @param grouping.variables a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.

#'
#'@param na.rm a logical value specifying whether missing values should be removed from the calculations specified by the.functions.

#' @param add.function.name  a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.
#'
#' @param  ... additional arguments to be passed
#'
#' @param envir the environment in which the code would be evaluated; parent.frame() by default.

#' @param non.numeric.value if "missing", returns NA for variables that are not numeric, integer, logical, or complex.  Otherwise returns first entry of the vector.
#'
#' @param sortby.group a logical value to specify if the sorting functionality needs to be applied or not
#'
#' @param table.format a character vector specifying if table should be in a wide format or a tall format
#'
#' @param return.as describes whether return should be result, code or mixture of both
#' @return The output of the function varies based on the 'return.as' parameter:
#' - If 'return.as' is "result", it provides a modified version of the input data frame or data table, incorporating the standard deviation values for the specified numeric variables, computed post any filtering and grouping operations. These standard deviations are calculated considering the 'na.rm' parameter, which dictates the handling of missing values.
#' - If 'return.as' is "code", the function returns the R code or expressions that would compute the standard deviations, allowing the user to inspect or run the calculations separately.
#' - If 'return.as' is set to another value, the output might include both the computed standard deviations and the R code, depending on the function's design.
#'
#' This function is designed to provide a statistical summary, particularly the standard deviation, which is a measure of the amount of variation or dispersion of a set of values. It's particularly useful for data analysis and understanding the variability of the dataset.

#' @export

dt.sd.numerics <- function(dt.name, the.variables = ".", the.filter = NULL,
                           grouping.variables = NULL, sortby.group = TRUE,
                           table.format = "wide", add.function.name = FALSE,
                           return.as = "result", envir = parent.frame(),
                           na.rm = TRUE, non.numeric.value = "missing", ...){

  other.params <- sprintf("na.rm = %s, non.numeric.value = '%s'", na.rm, non.numeric.value)

  return(dt.calculate(dt.name = dt.name, the.variables = the.variables,
                      the.functions = "sd.numerics", the.filter = the.filter,
                      grouping.variables = grouping.variables, sortby.group = sortby.group,
                      other.params = other.params, table.format = table.format,
                      add.function.name = add.function.name, return.as = return.as,
                      envir = envir, ...))
}

