% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DTWrapper2.R
\name{dt.total.missing}
\alias{dt.total.missing}
\title{dt.total.missing}
\usage{
dt.total.missing(
  dt.name,
  the.variables = ".",
  the.filter = NULL,
  grouping.variables = NULL,
  sortby.group = TRUE,
  table.format = "wide",
  add.function.name = FALSE,
  return.as = "result",
  envir = parent.frame(),
  ...
)
}
\arguments{
\item{dt.name}{a character value specifying the name of a data.frame or data.table object.}

\item{the.variables}{a character vector specifying the variables that we want to apply a function to.  Only values that exist in names(dat) will be used; other values in the.variables will be excluded from the calculation.  When the.variables includes ".", then all values in names(dat) will be selected.  Values of the.variables that also exist in grouping.variables will be excluded from the.variables (but grouped by these values).}

\item{the.filter}{a character value, logical value, or expression stating the logical operations to be performed in filtering the data prior to calculating the.function.}

\item{grouping.variables}{a character vector specifying variables to group by in performing the computation.  Only values that exist in names(dat) will be used.}

\item{sortby.group}{a logical value to specify if the sorting functionality needs to be applied or not}

\item{table.format}{a character vector soecifying if table should be in a wide format or a tall format}

\item{add.function.name}{a logical value specifying whether the name of the function applied should be appended to the column names in the resulting table.}

\item{return.as}{describes whether return should be result, code or mixture of both}

\item{envir}{the environment in which the code would be evaluated; parent.frame() by default.}

\item{...}{additional arguments to be passed}
}
\value{
The function's output is determined by the 'return.as' parameter:
- If 'return.as' is "result", it provides a modified data frame or data table displaying the proportions of missing values for each specified variable. These calculations are performed after considering any filters applied and subgrouping defined, presented in the format specified by 'table.format'.
- If 'return.as' is "code", the function outputs the R code or expressions designed to calculate these proportions, allowing users to inspect or execute the code independently.
- If a different value is specified for 'return.as', the output might include both the calculated proportions of missing values and the corresponding R code, depending on the specifics of the function's implementation.

This function is essential for data quality assessment, offering insights into the extent of missing data within each variable of the dataset, especially useful after applying subgrouping and specific filters.
}
\description{
Calculates the proportion of missing values for each specified variable in each group after applying a filter.
}
