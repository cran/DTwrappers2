
#' dt.total.measured
#'
#' @description Calculates the proportion of measured values for each specified variable in each group after applying a filter.


#' @param dt.name a character value specifying the name of a data.frame or data.table object.

#' @param the.variables a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).

#' @param the.filter  a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.

#' @param grouping.variables  a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.
#'
#' @param envir the environment in which the code would be evaluated; parent.frame() by default.

#' @param add.function.name  a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.
#'
#' @param  ... additional arguments to be passed
#'
#' @param sortby.group a logical value to specify if the sorting functionality needs to be applied or not
#'
#' @param table.format a character vector soecifying if table should be in a wide format or a tall format
#'
#' @param return.as describes whether return should be result, code or mixture of both
#' @return The function's output varies based on the 'return.as' parameter:
#' - If 'return.as' is "result", it returns a data frame or data table with the calculated proportions of measured (non-missing) values for each specified variable, adjusted for any applied filtering and subgrouping. The data is formatted as specified, in either a wide or tall format, depending on the 'table.format' setting.
#' - If 'return.as' is "code", it provides the R code or expressions intended to generate these calculations, allowing the user to review or execute the code independently.
#' - If another option is specified for 'return.as', the output may include both the calculated proportions and the corresponding R code, contingent on the function’s design.
#'
#' This function is particularly useful for assessing data completeness, providing insights into the proportion of actual measurements available within the dataset, especially after subgrouping and applying specific filters.

#' @export

dt.total.measured <- function(dt.name, the.variables = ".", the.filter = NULL,
                              grouping.variables = NULL, sortby.group = TRUE,
                              table.format = "wide", add.function.name = FALSE,
                              return.as = "result", envir = parent.frame(), ...){

  return(dt.calculate(dt.name = dt.name, the.variables = the.variables,
                      the.functions = "total.measured", the.filter = the.filter,
                      grouping.variables = grouping.variables, sortby.group = sortby.group,
                      table.format = table.format, add.function.name = add.function.name,
                      return.as = return.as, envir = envir, ...))
}

