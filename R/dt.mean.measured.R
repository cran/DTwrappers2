#' dt.mean.measured
#'
#' @description Calculates the proportion of measured values for each specified variable in each group after applying a filter.

#' @param  dt.name a character value specifying the name of a data.frame or data.table object.

#' @param the.variables  a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).

#' @param the.filter  a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.

#' @param  grouping.variables a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.

#' @param add.function.name a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.
#'
#' @param sortby.group a logical value to specify if the sorting functionality needs to be applied or not
#'
#' @param table.format a character vector specifying if table should be in a wide format or a tall format
#' @param envir the environment in which the code would be evaluated; parent.frame() by default.
#'
#' @param return.as describes whether return should be result, code or mixture of both
#'
#' @param  ... additional arguments to be passed
#' @return The function returns an object based on the 'return.as' parameter:
#' - If 'return.as' is "result", it outputs a modified version of the input data frame or data table, showing the proportion of measured (non-missing) values for each specified variable, potentially grouped and sorted as defined by the user. The results are presented in the format (wide or tall) specified by the 'table.format' parameter.
#' - If 'return.as' is "code", the function provides the R code or expressions that would generate the aforementioned results, allowing users to evaluate or review the logic independently.
#' - For other values of 'return.as', the output may include both the computed proportions and the corresponding R code, depending on the function's implementation.
#'
#' The function is designed to facilitate an understanding of data completeness, providing insights into the proportion of actual measurements available within the dataset, after any specified subgrouping and filtering.


#' @export

dt.mean.measured <- function(dt.name, the.variables = ".", the.filter = NULL,
                             grouping.variables = NULL, sortby.group = TRUE,
                             table.format = "wide", add.function.name = FALSE,
                             return.as = "result", envir = parent.frame(), ...){

  return(dt.calculate(dt.name = dt.name, the.variables = the.variables,
                      the.functions = "mean.measured", the.filter = the.filter,
                      grouping.variables = grouping.variables, sortby.group = sortby.group,
                      table.format = table.format, add.function.name = add.function.name,
                      return.as = return.as, envir = envir, ...))
}

