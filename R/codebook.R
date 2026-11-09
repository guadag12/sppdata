# Variable-level codebook and PDF downloads ------------------------------

#' Consult or download the SPP codebook
#'
#' By default, returns the variable-level table bundled with the package,
#' which is available offline. With `download = TRUE`, downloads the official
#' PDF codebook for the requested GitHub Release (v1.0 or v2.0).
#' The bundled CSV is not a historical versioned PDF codebook.
#'
#' @param dataset Optional dataset abbreviation, e.g. `"SED"`, to filter the
#'   offline variable table. Ignored for PDFs only when `NULL`; specify no
#'   dataset when downloading the full versioned PDF.
#' @param download If `TRUE`, download the official PDF rather than return the
#'   bundled variable table.
#' @param file Optional destination path for the PDF. Defaults to
#'   `spp_codebook_v1.pdf` or `spp_codebook_v2.pdf` in the working directory.
#' @param version Published codebook version, `"v1.0"` or `"v2.0"`.
#'   Used only when `download = TRUE`.
#' @return With `download = FALSE`, a data frame (`dataset`, `variable`,
#'   `label`, `type`, `description`). With `download = TRUE`, the path of the
#'   saved PDF (invisibly), or `NULL` if downloading fails.
#' @export
#' @examples
#' head(spp_codebook())
#' spp_codebook("SED")
#' \dontrun{
#' spp_codebook(version = "v1.0", download = TRUE)
#' spp_codebook(version = "v2.0", download = TRUE)
#' }
spp_codebook <- function(dataset = NULL, download = FALSE, file = NULL,
                         version = spp_default_tag()) {
  if (isTRUE(download)) {
    if (!is.null(dataset)) {
      stop("PDF codebooks cover all datasets: omit 'dataset' when downloading.",
           call. = FALSE)
    }
    pdf_names <- c("v1.0" = "spp_codebook_v1.pdf",
                   "v2.0" = "spp_codebook_v2.pdf")
    if (length(version) != 1L || is.na(version) ||
        !version %in% names(pdf_names)) {
      stop("Unknown PDF codebook version. Use 'v1.0' or 'v2.0'.",
           call. = FALSE)
    }
    asset <- unname(pdf_names[[version]])
    if (is.null(file)) file <- asset
    if (length(file) != 1L || is.na(file) || !nzchar(file) ||
        tolower(tools::file_ext(file)) != "pdf") {
      stop("'file' must be a destination filename ending in .pdf.",
           call. = FALSE)
    }
    if (!dir.exists(dirname(file))) {
      stop("Destination directory does not exist: ", dirname(file),
           call. = FALSE)
    }
    url <- sprintf("https://github.com/%s/releases/download/%s/%s",
                   spp_repo(), version, asset)
    tmp <- tempfile(fileext = ".pdf")
    on.exit(unlink(tmp), add = TRUE)
    ok <- tryCatch({
      status <- suppressWarnings(utils::download.file(
        url, destfile = tmp, mode = "wb", quiet = TRUE))
      identical(status, 0L)
    }, error = function(e) {
      message("Could not download the codebook: ", conditionMessage(e))
      FALSE
    })
    if (!ok || !file.exists(tmp) || file.info(tmp)$size < 5L) {
      message("Codebook PDF unavailable for ", version, ": ", url)
      return(invisible(NULL))
    }
    con <- base::file(tmp, open = "rb")
    sig <- tryCatch(readBin(con, what = "raw", n = 5L),
                    finally = close(con))
    if (!identical(sig, charToRaw("%PDF-"))) {
      message("The downloaded file is not a PDF: ", url)
      return(invisible(NULL))
    }
    if (!file.copy(tmp, file, overwrite = TRUE)) {
      stop("Could not save PDF to: ", file, call. = FALSE)
    }
    return(invisible(normalizePath(file, mustWork = TRUE)))
  }

  if (!is.null(file)) {
    stop("'file' is only used with 'download = TRUE'.", call. = FALSE)
  }
  path <- system.file("extdata", "spp_codebook.csv", package = "sppdata")
  if (!nzchar(path)) {
    stop("Bundled variable table not found. Is the package installed correctly?",
         call. = FALSE)
  }
  cb <- utils::read.csv(path, stringsAsFactors = FALSE, encoding = "UTF-8")
  if (!is.null(dataset)) {
    dataset <- toupper(dataset)
    cb <- cb[toupper(cb$dataset) == dataset, , drop = FALSE]
    if (nrow(cb) == 0L) {
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
#' @keywords internal
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
    cat(reg$citation[i], "\n", sep = "")
    cat("DOI: https://doi.org/", reg$doi[i], "\n\n", sep = "")
  }
  cat("Codebook (OSF): https://doi.org/", .spp_osf_doi, "\n", sep = "")
  cat("Site: https://www.subnationalpolitics.com/\n")
  invisible(NULL)
}

