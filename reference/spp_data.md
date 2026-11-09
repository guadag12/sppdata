# Download an SPP dataset

Fetches one of the six SPP datasets from the project's GitHub Releases
mirror and returns it as a data frame. The file is cached locally (see
the local cache), so repeated calls in the same version do not hit the
network. The archival, citable copy of every dataset lives on Harvard
Dataverse; see
[`spp_citation()`](https://guadag12.github.io/sppdata/reference/spp_citation.md).

## Usage

``` r
spp_data(dataset, tag = spp_default_tag(), use_cache = TRUE, overwrite = FALSE)
```

## Arguments

- dataset:

  Dataset abbreviation, e.g. `"SED"`. See
  [`spp_datasets()`](https://guadag12.github.io/sppdata/reference/spp_datasets.md)
  for the full list. Case-insensitive.

- tag:

  Release tag (version) to download. Defaults to the version this
  package was built against (`v2.0`), so results are reproducible.
  Override to pull a different published version.

- use_cache:

  If `TRUE` (default), return a previously downloaded copy when
  available instead of re-downloading.

- overwrite:

  If `TRUE`, re-download even if a cached copy exists.

## Value

A data frame, or `NULL` (with an informative message) if the data cannot
be retrieved - e.g. no internet connection.

## Examples

``` r
if (FALSE) { # \dontrun{
# Requires an internet connection:
sed <- spp_data("SED")
head(sed)
} # }
```
