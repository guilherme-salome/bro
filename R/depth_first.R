#' @title Depth-First Search for Dependencies
#'
#' @description
#' Performs a depth-first search to find dependencies and paths leading to a specified node in a directed graph.
#'
#' @details
#' This function takes an index 'i' and a matrix 'dependencies' as input, where 'dependencies' represents a directed graph
#' with nodes and dependencies. It initializes a boolean vector 'visited' to track visited nodes and an integer vector 'result'
#' to store the path in a depth-first manner.
#'
#' The depth-first search (DFS) is performed using a helper function 'dfs'. It explores the graph, marking visited nodes,
#' and appends the nodes to the 'result' vector in the order of traversal. The search avoids repeating nodes in the paths.
#'
#' @param i The index of the starting node for depth-first search.
#' @param dependencies The matrix representing dependencies (1 for dependencies, 0 for no dependency).
#'
#' @return Returns a vector containing the nodes visited in a depth-first manner starting from the specified node.
#'
depth_first <- function(i, dependencies) {
  n <- nrow(dependencies)
  visited <- rep(FALSE, n)
  result <- integer(0)

  ## Helper function for depth-first search
  dfs <- function(i) {
    visited[i] <<- TRUE
    direct <- which(dependencies[i, ] == 1)
    for (j in direct) {
      if (!visited[j]) {
        dfs(j)
      }
    }
    result <<- c(result, i)
  }

  ## Find all paths to node i, without repeating nodes
  dfs(i)

  return(result)
}
