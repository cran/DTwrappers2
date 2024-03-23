
#' dt.mean.missing
#'
#' @description Calculates the proportion of measured values for each specified variable in each group after applying a filter.
#'
#' @param dt.name a character value specifying the name of a data.frame or data.table object.

#' @param the.variables a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).

#' @param the.filter a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.

#' @param grouping.variables a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.

#' @param add.function.name a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.
#'
#' @param sortby.group a logical value to specify if the sorting functionality needs to be applied or not
#'
#' @param table.format a character vector specifying if table should be in a wide format or a tall format
#'
#' @param envir the environment in which the code would be evaluated; parent.frame() by default.
#'
#' @param return.as describes whether return should be result, code or mixture of both
#'
#' @param  ... additional arguments to be passed
#' @return The function outputs an object based on the specified 'return.as' parameter:
#' - If 'return.as' is "result", it returns a data frame or data table modified to include the proportion of missing values for each specified variable, after the data has been filtered and potentially grouped according to the parameters provided. The results are formatted according to the 'table.format' parameter, in either wide or tall form, and can be sorted by groups if 'sortby.group' is enabled.
#' - If 'return.as' is "code", the function will return the R code or expressions designed to calculate these proportions, allowing the user to review or execute the code independently.
#' - If 'return.as' encompasses other values, the output may combine the computed results and the R code, varying with the function's implementation and user specifications.
#'
#' This function is tailored for analyzing data completeness, specifically by quantifying the missingness in the dataset, facilitating detailed examination and understanding of the data's integrity, especially after applying any specified filters and groupings.

#' @export

dt.mean.missing <- function(dt.name, the.variables = ".", the.filter = NULL,
                            grouping.variables = NULL, sortby.group = TRUE,
                            table.format = "wide", add.function.name = FALSE,
                            return.as = "result", envir = parent.frame(), ...){

  return(dt.calculate(dt.name = dt.name, the.variables = the.variables,
                      the.functions = "mean.missing", the.filter = the.filter,
                      grouping.variables = grouping.variables, sortby.group = sortby.group,
                      table.format = table.format, add.function.name = add.function.name,
                      return.as = return.as, envir = envir, ...))
}

