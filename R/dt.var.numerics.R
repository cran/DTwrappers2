
#' dt.var.numerics

#' @description wrapper function that computes the variance for each selected quantitative variable in each group after applying a filter


#' @param dt.name a character value specifying the name of a data.frame or data.table object.

#' @param the.variables a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).
#'
#' @param grouping.variables a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.

#' @param add.function.name a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.
#'
#' @param na.rm a logical value specifying whether missing values should be removed from the calculations specified by the.functions.
#'
#' @param non.numeric.value if "missing", returns NA for variables that are not numeric, integer, logical, or complex.  Otherwise returns first entry of the vector.
#'
#' @param the.filter a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.
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
#' @return The function's output varies based on the 'return.as' parameter:
#' - If 'return.as' is "result", it returns a modified data frame or data table that includes the variance calculations for each specified quantitative variable, adjusted post any filtering and subgrouping. The variance is computed considering the 'na.rm' parameter to handle missing values and is presented in the specified 'table.format'.
#' - If 'return.as' is "code", it provides the R code or expressions designed to perform these variance computations, allowing users to inspect or execute the code independently.
#' - If 'return.as' specifies another option, the output may include both the calculated variance values and the corresponding R code, depending on the function's setup.
#'
#' This function is particularly valuable for statistical analysis, providing insights into the variability of each variable within the dataset, which is crucial for understanding the data distribution and variability after subgrouping and applying specific filters.

#' @export

dt.var.numerics <- function(dt.name, the.variables = ".", the.filter = NULL,
                            grouping.variables = NULL, sortby.group = TRUE,
                            table.format = "wide", add.function.name = FALSE,
                            return.as = "result", envir = parent.frame(),
                            na.rm = TRUE, non.numeric.value = "missing", ...){

  other.params <- sprintf("na.rm = %s, non.numeric.value = '%s'", na.rm, non.numeric.value)

  return(dt.calculate(dt.name = dt.name, the.variables = the.variables,
                      the.functions = "var.numerics", the.filter = the.filter,
                      grouping.variables = grouping.variables, sortby.group = sortby.group,
                      other.params = other.params, table.format = table.format,
                      add.function.name = add.function.name, return.as = return.as, envir = envir, ...))
}

