# Download and cache ------------------------------------------------------

#' Local cache directory for SPP data
#'
#' Downloaded datasets are cached here so they are fetched from the network
#' only once per version. The location follows the CRAN-sanctioned
#' [tools::R_user_dir()] convention and can be overridden with the
#' `sppdata.cache` option or the `SPPDATA_CACHE` environment variable.
#'
#' @return The cache directory path (character scalar). Created if needed.
#' @export
#' @examples
#' spp_cache_dir()
spp_cache_dir <- function() {
  path <- getOption("sppdata.cache", Sys.getenv("SPPDATA_CACHE", ""))
  if (!nzchar(path)) {
    path <- tools::R_user_dir("sppdata", which = "cache")
  }
  if (!dir.exists(path)) {
    dir.create(path, recursive = TRUE, showWarnings = FALSE)
  }
  path
}

#' Clear the SPP data cache
#'
#' Removes cached datasets. CRAN policy requires that cached contents be
#' actively managed, so this gives users a simple way to reclaim the space.
#'
#' @param tag Optional release tag. If supplied, only that version's cache is
#'   cleared; otherwise the whole cache is emptied.
#' @return Invisibly, `TRUE` on success.
#' @export
#' @examples
#' \donttest{
#' spp_cache_clear()
#' }
spp_cache_clear <- function(tag = NULL) {
  root <- spp_cache_dir()
  target <- if (is.null(tag)) root else file.path(root, tag)
  if (dir.exists(target)) {
    unlink(target, recursive = TRUE, force = TRUE)
    message("Cleared SPP cache: ", target)
  } else {
    message("Nothing to clear at: ", target)
  }
  invisible(TRUE)
}

# Read a cached file by extension. Keeps the fetch format flexible: .rds for
# fast native loading, .csv as a human-readable fallback.
read_spp_file <- function(path) {
  ext <- tolower(tools::file_ext(path))
  switch(ext,
    rds = readRDS(path),
    csv = utils::read.csv(path, stringsAsFactors = FALSE, encoding = "UTF-8"),
    stop("Unsupported file type: .", ext, call. = FALSE)
  )
}

#' Download an SPP dataset
#'
#' Fetches one of the six SPP datasets from the project's GitHub Releases
#' mirror and returns it as a data frame. The file is cached locally (see
#' [spp_cache_dir()]), so repeated calls in the same version do not hit the
#' network. The archival, citable copy of every dataset lives on Harvard
#' Dataverse; see [spp_citation()].
#'
#' @param dataset Dataset abbreviation, e.g. `"SED"`. See [spp_datasets()] for
#'   the full list. Case-insensitive.
#' @param tag Release tag (version) to download. Defaults to the version this
#'   package was built against, so results are reproducible. Override to pull
#'   a different published version.
#' @param use_cache If `TRUE` (default), return a previously downloaded copy
#'   when available instead of re-downloading.
#' @param overwrite If `TRUE`, re-download even if a cached copy exists.
#'
#' @return A data frame, or `NULL` (with an informative message) if the data
#'   cannot be retrieved — e.g. no internet connection.
#' @export
#' @examples
#' \donttest{
#' # Requires an internet connection:
#' sed <- spp_data("SED")
#' head(sed)
#' }
spp_data <- function(dataset,
                     tag = spp_default_tag(),
                     use_cache = TRUE,
                     overwrite = FALSE) {

  reg <- spp_registry()
  dataset <- toupper(dataset)

  if (!dataset %in% reg$abbrev) {
    stop("Unknown dataset '", dataset, "'. Available: ",
         paste(reg$abbrev, collapse = ", "), ".", call. = FALSE)
  }

  file <- reg$file[reg$abbrev == dataset]
  dest_dir <- file.path(spp_cache_dir(), tag)
  local <- file.path(dest_dir, file)

  # Serve from cache when we can.
  if (use_cache && file.exists(local) && !overwrite) {
    return(read_spp_file(local))
  }

  if (!dir.exists(dest_dir)) {
    dir.create(dest_dir, recursive = TRUE, showWarnings = FALSE)
  }

  # Fetch from GitHub Releases, failing gracefully (CRAN policy: a networked
  # package must not error/warn when the resource is unavailable).
  ok <- tryCatch({
    piggyback::pb_download(
      file      = file,
      repo      = spp_repo(),
      tag       = tag,
      dest      = dest_dir,
      overwrite = TRUE
    )
    TRUE
  }, error = function(e) {
    message("Could not download '", dataset, "' (", tag, "): ",
            conditionMessage(e))
    FALSE
  })

  if (!ok || !file.exists(local)) {
    message("SPP data could not be retrieved. Check your internet ",
            "connection, or download the archival copy from Dataverse ",
            "(DOI ", doi, ").")
    return(invisible(NULL))
  }

  read_spp_file(local)
}
