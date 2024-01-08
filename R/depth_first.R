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
