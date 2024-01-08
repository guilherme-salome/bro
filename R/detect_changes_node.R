#' @title Detect Changes in Node
#'
#' @description
#' Detects changes in a specified node by comparing its current hash with the previous hash stored in the execution environment.
#'
#' @details
#' This function takes a node and the execution environment as inputs. It calculates the hash of the provided node using the
#' rlang::hash function. It then compares this new hash with the previous hash stored in the execution environment for the same node.
#' If the hashes differ, indicating changes, the function returns TRUE and displays a message about the detected changes.
#' Otherwise, it returns FALSE, indicating no changes.
#'
#' @param node The node for which changes are to be detected.
#' @param execution The execution environment containing the status information for nodes.
#'
#' @return Returns TRUE if changes are detected, FALSE otherwise.
#'
detect_changes_node <- function(node, execution) {

  previous_hash <- execution$status$nodes[[node$name]]
  new_hash <- rlang::hash(node)
  if(new_hash != previous_hash) {
    message("(bro) detected changes to node '", node$name, "'")
    return(TRUE)
  }

  return(FALSE)
}
