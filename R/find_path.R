#' @title Find Dependency Path for a Node
#'
#' @description
#' Finds the dependency path for a specified node in a graph, considering both direct and indirect dependencies.
#'
#' @details
#' This function takes a 'node' object, a matrix 'nodes' representing the nodes in the graph, and a matrix 'dependencies'
#' representing the dependencies (1 for dependencies, 0 for no dependency). It first identifies the index of the starting
#' node in the dependencies matrix. Then, it uses the depth-first search function to find the indices of nodes in the
#' dependency path.
#'
#' The resulting path is converted to node names using the row names of the dependencies matrix and returned.
#'
#' @param node The node for which the dependency path is to be found.
#' @param nodes The matrix representing nodes in the graph.
#' @param dependencies The matrix representing dependencies (1 for dependencies, 0 for no dependency).
#'
#' @return Returns a vector containing the names of nodes in the dependency path for the specified node.
#'
find_path <- function(node, nodes, dependencies) {
  ## Find index of starting node
  start <- which(rownames(dependencies) == node$name)
  ## Find direct and indirect dependencies of node in order
  path_indices <- depth_first(start, dependencies)
  ## Convert path to nodes
  path <- rownames(dependencies)[path_indices]
  return(path)
}
