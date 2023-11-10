##' @title Creates new project with folder structure and examples
##' @param name <string, optional> Name of new project or relative or absolute path to a folder.
##'   If unspecified, uses current working directory as the project folder and name.
##' @param example <logical> If TRUE, creates a concise example in new project.
##' @return NULL
create <- function(name = base::getwd(), example = TRUE) {

  ## Obtain path to project
  path <- base::path.expand(name)

  ## Create folder structure with required files
  folders <- c(
    "R", # source code
    "inst", # parameters, connections, and data catalog
    "data", # alternative name 'data_hub', avoids clashing with 'data' folder for R packages
    ## Suggested structure of data files:
    file.path("data", "base"),
    file.path("data", "inputs"),
    file.path("data", "models"),
    file.path("data", "outputs"),
    file.path("data", "reporting"),
    file.path("logs")
  )
  created <- lapply(folders, base::dir.create, showWarnings = FALSE, recursive = TRUE)

  ## Copy example files if requested
  if(example) {
    examples <- list.files(system.file("example", package = "bro"), full.names = TRUE, include.dirs = TRUE)
    copied <- lapply(examples, file.copy, to = path, recursive = TRUE, overwrite = TRUE)
  }

}
