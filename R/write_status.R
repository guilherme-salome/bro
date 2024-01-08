#' @title Write Status to File
#'
#' @description
#' Writes the provided status information to a YAML file at the specified path.
#'
#' @details
#' This function takes the provided status information and writes it to a YAML file at the specified path.
#' The status information typically includes the hash values for nodes and data, indicating the current state of the execution environment.
#'
#' @param status The status information to be written to the YAML file.
#' @param path The file path where the status information will be stored in YAML format.
#'
write_status <- function(status, path = file.path("data", "status.yaml")) {
  yaml::write_yaml(x = status, file = path)
}

