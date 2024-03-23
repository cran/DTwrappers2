
#' dt.total.missing
#'
#' @description Calculates the proportion of missing values for each specified variable in each group after applying a filter.


#' @param dt.name a character value specifying the name of a data.frame or data.table object.

#' @param the.variables  a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).

#' @param the.filter  a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.

#' @param grouping.variables  a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.
#'
#' @param envir the environment in which the code would be evaluated; parent.frame() by default.

#' @param add.function.name  a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.
#'
#' @param sortby.group a logical value to specify if the sorting functionality needs to be applied or not
#'
#' @param table.format a character vector soecifying if table should be in a wide format or a tall format
#'
#' @param  ... additional arguments to be passed
#'
#' @param return.as describes whether return should be result, code or mixture of both
#' @return The function's output is determined by the 'return.as' parameter:
#' - If 'return.as' is "result", it provides a modified data frame or data table displaying the proportions of missing values for each specified variable. These calculations are performed after considering any filters applied and subgrouping defined, presented in the format specified by 'table.format'.
#' - If 'return.as' is "code", the function outputs the R code or expressions designed to calculate these proportions, allowing users to inspect or execute the code independently.
#' - If a different value is specified for 'return.as', the output might include both the calculated proportions of missing values and the corresponding R code, depending on the specifics of the function's implementation.
#'
#' This function is essential for data quality assessment, offering insights into the extent of missing data within each variable of the dataset, especially useful after applying subgrouping and specific filters.

#' @export


dt.total.missing <- function(dt.name, the.variables = ".", the.filter = NULL,
                             grouping.variables = NULL, sortby.group = TRUE,
                             table.format = "wide", add.function.name = FALSE,
                             return.as = "result", envir = parent.frame(), ...){

  return(dt.calculate(dt.name = dt.name, the.variables = the.variables,
                      the.functions = "total.missing", the.filter = the.filter,
                      grouping.variables = grouping.variables, sortby.group = sortby.group,
                      table.format = table.format, add.function.name = add.function.name,
                      return.as = return.as, envir = envir, ...))
}
