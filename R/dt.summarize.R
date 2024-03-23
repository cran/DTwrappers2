#' dt.summarize
#'
#' @description summarizes the dataset
#'
#' @param dt.name a character value specifying the name of a data.frame or data.table object.
#'
#' @param the.variables  a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).

#' @param the.functions  a character vector or list specifying the name of the function to apply to the variables.  This may either be specified by the name of the function as a character (e.g. "mean") or by defining a function;

#' @param the.filter a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.

#' @param grouping.variables a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.
#'
#' @param envir the environment in which the code would be evaluated; parent.frame() by default.

#' @param add.function.name  a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.

#'
#' @param sortby.group a logical value to specify if the sorting functionality needs to be applied or not
#'
#' @param  ... additional arguments to be passed
#'
#' @param other.params additional parameters to be passed
#'
#' @param table.format a character vector specifying if table should be in a wide format or a tall format
#'
#' @param return.as describes whether return should be result, code or mixture of both
#' @return The output of the function is determined by the 'return.as' parameter:
#' - If 'return.as' is "result", it returns a data frame or data table that summarizes the specified variables using the functions listed in 'the.functions'. The summary might include statistics like minimum, maximum, mean, median, standard deviation, and other specified measures, applied after any set filtering and grouping.
#' - If 'return.as' is "code", the function will return the R code or expressions that generate the summary, allowing users to inspect or execute the code independently.
#' - If 'return.as' specifies a different option, the output may include both the summary statistics and the corresponding R code, varying with the function's implementation.
#'
#' This function is intended to provide a comprehensive summary of the dataset, offering insights into each selected variable's distribution and central tendencies, facilitating a thorough understanding of the dataset's characteristics.

#' @export

dt.summarize <- function(dt.name,
                         the.functions = c("min", "lower.quartile", "median", "mean", "upper.quartile", "max", "sd", "num.records", "total.missing"),
                         the.variables = ".",
                         the.filter = NULL,
                         grouping.variables = NULL,
                         sortby.group = TRUE,
                         other.params = "",
                         table.format = "long",
                         add.function.name = TRUE,
                         return.as = "result",
                         envir = parent.frame(),
                         ...){

  return(dt.calculate(dt.name = dt.name, the.functions = the.functions, the.variables = the.variables, the.filter = the.filter, grouping.variables = grouping.variables, sortby.group = sortby.group, other.params = other.params, table.format = table.format, add.function.name = add.function.name, return.as = return.as, envir = envir, ...))
}





