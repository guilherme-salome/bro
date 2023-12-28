#' @title Load Nodes from Configuration File
#'
#' @description
#' Loads nodes from a specified configuration file into a separate environment.
#'
#' @details
#' This function takes the path to a configuration file (default is "R/nodes.R") and creates a new environment (`objects`).
#' It then sources the specified file, executing its contents within the new environment. The function selects only objects
#' with the class 'node' from the environment, which are typically used to represent nodes in a data processing or analysis
#' pipeline. These nodes can include various data processing functions or other objects relevant to the workflow.
#'
#' @param path (string) The path to the configuration file containing nodes and other objects.
#'
#' @return Returns a list of nodes loaded from the specified configuration file.
#'
load_nodes <- function(path = file.path("R", "nodes.R")) {
  ## Load nodes and possibly other objects, including functions, into a separate environment
  objects <- new.env()
  source(path, chdir = TRUE, local = objects)
  ## Select only objects with 'node' class
  classes <- lapply(mget(ls(envir = objects), envir = objects), class)
  nodes <- mget(names(classes)[classes == "node"], envir = objects)
  return(nodes)
}
