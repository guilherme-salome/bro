#' @title Load Data Status from File
#'
#' @description
#' Loads the data status information from a YAML file at the specified path, or returns an empty list if the file does not exist.
#'
#' @details
#' This function reads the data status information from a YAML file at the specified path. If the file exists, it loads the status information,
#' which typically includes the hash values for nodes and data, indicating the current state of the execution environment. If the file does not exist,
#' it returns an empty list, assuming no previous status information is available.
#'
#' @param path The file path from which to load the data status information in YAML format.
#'
#' @return Returns the loaded data status information or an empty list if the file does not exist.
#'
load_data_status <- function(path = file.path("data", "status.yaml")) {
  if(file.exists(path)) {
    status <- yaml::read_yaml(file = path)
  } else {
    status <- list()
  }
  return(status)
}
