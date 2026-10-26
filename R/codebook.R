# Variable-level codebook -------------------------------------------------

#' The SPP variable codebook
#'
#' Returns the variable-level codebook bundled with the package: one row per
#' variable, with the dataset it belongs to, a human-readable label, its type,
#' and a description. This ships inside the package, so it works offline and
#' needs no download. Optionally filter to a single dataset.
#'
#' @param dataset Optional dataset abbreviation (e.g. `"SED"`) to filter to.
#'   Case-insensitive. If `NULL` (default), the full codebook is returned.
#'
#' @return A data frame with columns `dataset`, `variable`, `label`, `type`,
#'   and `description`.
#' @export
#' @examples
#' head(spp_codebook())
#' spp_codebook("SED")
spp_codebook <- function(dataset = NULL) {
  path <- system.file("extdata", "spp_codebook.csv", package = "sppdata")
  if (!nzchar(path)) {
    stop("Codebook not found. Is the package installed correctly?",
         call. = FALSE)
  }
  cb <- utils::read.csv(path, stringsAsFactors = FALSE, encoding = "UTF-8")
  
  if (!is.null(dataset)) {
    dataset <- toupper(dataset)
    cb <- cb[toupper(cb$dataset) == dataset, , drop = FALSE]
    if (nrow(cb) == 0) {
      stop("No codebook entries for dataset '", dataset, "'.", call. = FALSE)
    }
    rownames(cb) <- NULL
  }
  cb
}

#' Describe the variables in one dataset
#'
#' Prints the codebook entries for a single dataset in a compact, readable
#' form. A convenience wrapper over [spp_codebook()] for interactive use.
#'
#' @param dataset Dataset abbreviation, e.g. `"SEDI"` or `"SED"`.
#' @return The filtered codebook data frame, invisibly.
#' @export
#' @examples
#' spp_describe("SED")
spp_describe <- function(dataset) {
  cb <- spp_codebook(dataset)
  cat("Dataset: ", toupper(dataset), " (", nrow(cb), " variables)\n", sep = "")
  cat(strrep("-", 60), "\n", sep = "")
  for (i in seq_len(nrow(cb))) {
    cat(cb$variable[i], " [", cb$type[i], "]\n", sep = "")
    cat("  ", cb$label[i], "\n", sep = "")
    if (nzchar(cb$description[i])) cat("  ", cb$description[i], "\n", sep = "")
    cat("\n")
  }
  invisible(cb)
}

#' How to cite the SPP
#'
#' Prints the official Harvard Dataverse citation for each dataset. Pass a
#' dataset abbreviation to print just that one.
#'
#' @param dataset Optional abbreviation (e.g. "SED"). If omitted, prints the
#'   citation for every dataset.
#' @return Invisibly, `NULL`.
#' @export
#' @examples
#' spp_citation()
#' spp_citation("SED")
spp_citation <- function(dataset = NULL) {
  reg <- spp_registry()
  if (!is.null(dataset)) {
    dataset <- toupper(dataset)
    if (!dataset %in% reg$abbrev) {
      stop("Unknown dataset '", dataset, "'.", call. = FALSE)
    }
    reg <- reg[reg$abbrev == dataset, , drop = FALSE]
  }
  cat("Subnational Politics Project (SPP)\n")
  cat(strrep("-", 60), "\n\n", sep = "")
  for (i in seq_len(nrow(reg))) {
    cat(reg$abbrev[i], "\n", sep = "")
    cat(reg$citation[i], "\n\n", sep = "")
  }
  cat("Codebook (OSF): https://doi.org/", .spp_osf_doi, "\n", sep = "")
  cat("Site: https://subnationalpolitics.com\n")
  invisible(NULL)
}

#' Dataverse DOI for a dataset
#' @param dataset Abbreviation, e.g. "SED".
#' @return The DOI (character).
#' @export
spp_doi <- function(dataset) {
  reg <- spp_registry()
  dataset <- toupper(dataset)
  if (!dataset %in% reg$abbrev) stop("Unknown dataset '", dataset, "'.", call. = FALSE)
  reg$doi[reg$abbrev == dataset]
}