# TODO: copied from common, do this more elegantly!
fromJSON  <- function(x) jsonlite::fromJSON(x, TRUE, FALSE, FALSE)
toJSON    <- function(x) jsonlite::toJSON(x, auto_unbox = TRUE, digits = NA, null = "null")
.extractErrorMessage <- function(error) {

  split <- base::strsplit(as.character(error), ":")[[1]]
  last <- split[[length(split)]]
  trimws(last)
}

assignFunctionInPackage <- function(fun, name, package) {
  ns <- asNamespace(package)
  unlockBinding(name, ns)
  assign(name, fun, envir = ns)
  lockBinding(name, ns)
}
