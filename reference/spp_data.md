# Download an SPP dataset

Fetches one of the six SPP datasets from the project's GitHub Releases
mirror and returns it as a data frame. The file is cached locally (see
[`spp_cache_dir()`](https://guadag12.github.io/sppdata/reference/spp_cache_dir.md)),
so repeated calls in the same version do not hit the network. The
archival, citable copy of every dataset lives on Harvard Dataverse; see
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
  package was built against, so results are reproducible. Override to
  pull a different published version.

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
# \donttest{
# Requires an internet connection:
sed <- spp_data("SED")
#> ⠙ 2 items, page 1 | 4ms
head(sed)
#> # A tibble: 6 × 36
#>   country_name country_code state_name state_code country_state_code region_name
#>   <chr>        <chr>        <chr>      <chr>      <chr>              <chr>      
#> 1 ARGENTINA    032          CAPITAL F… 02         03202              PAMPA      
#> 2 ARGENTINA    032          CAPITAL F… 02         03202              PAMPA      
#> 3 ARGENTINA    032          CAPITAL F… 02         03202              PAMPA      
#> 4 ARGENTINA    032          CAPITAL F… 02         03202              PAMPA      
#> 5 ARGENTINA    032          CAPITAL F… 02         03202              PAMPA      
#> 6 ARGENTINA    032          CAPITAL F… 02         03202              PAMPA      
#> # ℹ 30 more variables: name_head_sub_exe <chr>, surname_head_sub_exe <chr>,
#> #   start_date_head_sub_exe <date>, end_date_head_sub_exe <date>,
#> #   gender_head_sub_exe <int>, birth_date_head_sub_exe <date>,
#> #   decease_date_head_sub_exe <date>, birth_state_head_sub_exe <chr>,
#> #   party_head_sub_exe <chr>, party_abbrev_head_sub_exe <chr>,
#> #   date_election_sub_exe <date>, concurrent_with_nat_election_sub_exe <int>,
#> #   term_length_in_years_sub_exe <dbl>, early_exit_sub_exe <int>, …
# }
```
