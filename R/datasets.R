# Dataset registry -------------------------------------------------------

# Read the dataset registry shipped in inst/extdata. One row per dataset:
# abbrev, name, file (the asset name on the GitHub Release), description.
spp_registry <- function() {
  path <- system.file("extdata", "spp_datasets.csv", package = "sppdata")
  if (!nzchar(path)) {
    stop("Dataset registry not found. Is the package installed correctly?",
         call. = FALSE)
  }
  utils::read.csv(path, stringsAsFactors = FALSE, encoding = "UTF-8")
}

#' List the SPP datasets
#'
#' Returns the six relational datasets that make up the Subnational Politics
#' Project, with their abbreviations and a one-line description. Use the
#' abbreviation (e.g. `"SED"`) as the `dataset` argument to [spp_data()].
#'
#' @return A data frame with columns `abbrev`, `name`, and `description`.
#' @export
#' @examples
#' spp_datasets()
spp_datasets <- function() {
  reg <- spp_registry()
  reg[, c("abbrev", "name", "description")]
}
