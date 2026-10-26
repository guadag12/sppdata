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

#' Cómo citar el SPP
#'
#' Imprime las citas sugeridas. Cada dataset tiene su propio DOI de
#' Harvard Dataverse; el codebook tiene un DOI de OSF.
#'
#' @param dataset Abreviatura opcional (p. ej. "SED"). Si se omite, lista
#'   el DOI de todas las bases.
#' @return Invisiblemente, `NULL`.
#' @export
#' @examples
#' spp_citation()
#' spp_citation("SED")
spp_citation <- function(dataset = NULL) {
  reg <- spp_registry()
  if (!is.null(dataset)) {
    dataset <- toupper(dataset)
    if (!dataset %in% reg$abbrev) {
      stop("Dataset desconocido '", dataset, "'.", call. = FALSE)
    }
    reg <- reg[reg$abbrev == dataset, , drop = FALSE]
  }
  cat("Subnational Politics Project (SPP)\n")
  cat(strrep("-", 60), "\n", sep = "")
  for (i in seq_len(nrow(reg))) {
    cat(reg$abbrev[i], " — ", reg$name[i], "\n", sep = "")
    cat("  DOI: https://doi.org/", reg$doi[i], "\n\n", sep = "")
  }
  cat("Codebook (OSF): https://doi.org/", .spp_osf_doi, "\n", sep = "")
  cat("Sitio: https://subnationalpolitics.com\n")
  invisible(NULL)
}

#' DOI de Dataverse de un dataset
#' @param dataset Abreviatura, p. ej. "SED".
#' @return El DOI (character).
#' @export
spp_doi <- function(dataset) {
  reg <- spp_registry()
  dataset <- toupper(dataset)
  if (!dataset %in% reg$abbrev) stop("Dataset desconocido '", dataset, "'.", call. = FALSE)
  reg$doi[reg$abbrev == dataset]
}