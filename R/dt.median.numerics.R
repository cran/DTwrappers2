#' dt.median.numerics
#'
#' @description wrapper function that computes the median value for each selected quantitative variable in each group after applying a filter.
#'
#' @param dt.name a character value specifying the name of a data.frame or data.table object.

#' @param the.variables a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).

#' @param  the.filter a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.

#' @param  grouping.variables a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.

#' @param add.function.name  a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.

#' @param non.numeric.value if "missing", returns NA for variables that are not numeric, integer, logical, or complex.  Otherwise returns first entry of the vector.
#'
#'@param  na.rm a logical value specifying whether missing values should be removed from the calculations specified by the.functions.
#'
#' @param envir the environment in which the code would be evaluated; parent.frame() by default.
#'
#' @param sortby.group a logical value to specify if the sorting functionality needs to be applied or not
#'
#' @param table.format a character vector specifying if table should be in a wide format or a tall format
#'
#' @param return.as describes whether return should be result, code or mixture of both
#'
#' @param  ... additional arguments to be passed
#' @return The function returns an output based on the 'return.as' parameter:
#' - If 'return.as' is "result", it provides a modified version of the input data frame or data table, showing the median values for the specified numeric variables, after applying the set filters and groupings. The data is presented in the format specified by 'table.format', either wide or tall, and it reflects any sorting by group as dictated by 'sortby.group'.
#' - If 'return.as' is "code", the function will return the R code or expressions that would generate the calculated medians, offering users the opportunity to inspect or execute the code separately.
#' - If 'return.as' incorporates other options, the output may consist of both the calculated medians and the R code, varying according to the function’s implementation.
#'
#' The function aims to aggregate median values, taking into account the handling of missing values as specified by 'na.rm' and adapting for non-numeric values as determined by 'non.numeric.value'. This functionality allows for a nuanced analysis of the central tendency within the dataset, particularly after subgrouping and applying specified filters.

#' @export

dt.median.numerics <- function(dt.name, the.variables = ".", the.filter = NULL,
                               grouping.variables = NULL, sortby.group = TRUE,
                               table.format = "wide", add.function.name = FALSE,
                               return.as = "result", envir = parent.frame(),
                               na.rm = TRUE, non.numeric.value = "missing", ...){

  other.params <- sprintf("na.rm = %s, non.numeric.value = '%s'", na.rm, non.numeric.value)

  return(dt.calculate(dt.name = dt.name, the.variables = the.variables,
                      the.functions = "median.numerics", the.filter = the.filter,
                      grouping.variables = grouping.variables, sortby.group = sortby.group,
                      other.params = other.params, table.format = table.format,
                      add.function.name = add.function.name, return.as = return.as,
                      envir = envir, ...))
}

